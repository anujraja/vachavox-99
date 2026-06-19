import AVFoundation
import Foundation
import Speech
import VachaVoxCore

@main
struct SpeechFeasibilitySpike {
    static func main() async {
        do {
            let arguments = Array(CommandLine.arguments.dropFirst())
            let options = try SpikeOptions(arguments: arguments)
            let report = try await SystemSpeechProbe().run(options: options)
            print(report.rendered)
        } catch {
            fputs("SpeechFeasibilitySpike error: \(error.localizedDescription)\n", stderr)
            exit(1)
        }
    }
}

struct SpikeOptions {
    var localeIdentifier = "en_US"
    var audioFileURL: URL?
    var installAssets = false

    init(arguments: [String]) throws {
        var index = 0
        while index < arguments.count {
            let argument = arguments[index]
            switch argument {
            case "--locale":
                index += 1
                guard index < arguments.count else { throw SpikeError.missingValue("--locale") }
                localeIdentifier = arguments[index]
            case "--audio-file":
                index += 1
                guard index < arguments.count else { throw SpikeError.missingValue("--audio-file") }
                audioFileURL = URL(fileURLWithPath: arguments[index]).standardizedFileURL
            case "--install-assets":
                installAssets = true
            case "--help":
                throw SpikeError.help
            default:
                throw SpikeError.unknownArgument(argument)
            }
            index += 1
        }
    }
}

enum SpikeError: LocalizedError {
    case help
    case missingValue(String)
    case unknownArgument(String)
    case unsupportedLocale(String)
    case audioFileMissing(URL)

    var errorDescription: String? {
        switch self {
        case .help:
            return "Usage: SpeechFeasibilitySpike [--locale en_US] [--audio-file /path/to.wav] [--install-assets]"
        case .missingValue(let name):
            return "Missing value for \(name)"
        case .unknownArgument(let argument):
            return "Unknown argument \(argument)"
        case .unsupportedLocale(let locale):
            return "SpeechTranscriber does not support locale \(locale)"
        case .audioFileMissing(let url):
            return "Audio file does not exist at \(url.path)"
        }
    }
}

struct ProbeReport {
    var localeIdentifier: String
    var equivalentLocaleIdentifier: String?
    var supportedLocaleCount: Int
    var installedLocaleIdentifiers: [String]
    var reservedLocaleIdentifiers: [String]
    var maximumReservedLocales: Int
    var assetStatus: String
    var installationRequestAvailable: Bool
    var installAttempted: Bool
    var installResult: String?
    var compatibleAudioFormat: String?
    var transcript: String?

    var rendered: String {
        var lines: [String] = [
            "locale=\(localeIdentifier)",
            "equivalentLocale=\(equivalentLocaleIdentifier ?? "none")",
            "supportedLocaleCount=\(supportedLocaleCount)",
            "installedLocales=\(installedLocaleIdentifiers.joined(separator: ", "))",
            "reservedLocales=\(reservedLocaleIdentifiers.joined(separator: ", "))",
            "maximumReservedLocales=\(maximumReservedLocales)",
            "assetStatus=\(assetStatus)",
            "installationRequestAvailable=\(installationRequestAvailable)",
            "installAttempted=\(installAttempted)",
            "installResult=\(installResult ?? "not attempted")",
            "compatibleAudioFormat=\(compatibleAudioFormat ?? "none")"
        ]
        if let transcript {
            lines.append("transcript=\(transcript)")
        }
        return lines.joined(separator: "\n")
    }
}

struct SystemSpeechProbe {
    func run(options: SpikeOptions) async throws -> ProbeReport {
        guard #available(macOS 26.0, *) else {
            throw SpikeError.unsupportedLocale("macOS 26 Speech APIs unavailable")
        }

        let requestedLocale = Locale(identifier: options.localeIdentifier)
        let equivalentLocale = await SpeechTranscriber.supportedLocale(equivalentTo: requestedLocale)
        guard let selectedLocale = equivalentLocale else {
            throw SpikeError.unsupportedLocale(options.localeIdentifier)
        }

        let transcriber = SpeechTranscriber(locale: selectedLocale, preset: .transcription)
        let modules: [any SpeechModule] = [transcriber]
        let installationRequest = try await AssetInventory.assetInstallationRequest(supporting: modules)

        var installResult: String?
        if options.installAssets {
            if let installationRequest {
                try await installationRequest.downloadAndInstall()
                installResult = "completed"
            } else {
                installResult = "not needed"
            }
        }

        let refreshedStatus = await AssetInventory.status(forModules: modules)
        let compatibleFormat = await SpeechAnalyzer.bestAvailableAudioFormat(compatibleWith: modules)
        var transcript: String?

        if let audioFileURL = options.audioFileURL {
            guard FileManager.default.fileExists(atPath: audioFileURL.path) else {
                throw SpikeError.audioFileMissing(audioFileURL)
            }
            transcript = try await transcribeFile(
                audioFileURL,
                locale: selectedLocale
            )
        }

        return ProbeReport(
            localeIdentifier: options.localeIdentifier,
            equivalentLocaleIdentifier: selectedLocale.identifier,
            supportedLocaleCount: await SpeechTranscriber.supportedLocales.count,
            installedLocaleIdentifiers: await SpeechTranscriber.installedLocales.map(\.identifier).sorted(),
            reservedLocaleIdentifiers: await AssetInventory.reservedLocales.map(\.identifier).sorted(),
            maximumReservedLocales: AssetInventory.maximumReservedLocales,
            assetStatus: String(describing: refreshedStatus),
            installationRequestAvailable: installationRequest != nil,
            installAttempted: options.installAssets,
            installResult: installResult,
            compatibleAudioFormat: compatibleFormat.map(Self.describe),
            transcript: transcript
        )
    }

    private func transcribeFile(_ url: URL, locale: Locale) async throws -> String {
        let audioFile = try AVAudioFile(forReading: url)
        let transcriber = SpeechTranscriber(locale: locale, preset: .transcription)
        let analyzer = SpeechAnalyzer(modules: [transcriber])
        try await analyzer.prepareToAnalyze(in: audioFile.processingFormat)

        let resultTask = Task<String, Error> {
            var parts: [String] = []
            for try await result in transcriber.results {
                let text = String(result.text.characters).trimmingCharacters(in: .whitespacesAndNewlines)
                if result.isFinal, !text.isEmpty {
                    parts.append(text)
                }
            }
            return parts.joined(separator: " ")
        }

        _ = try await analyzer.analyzeSequence(from: audioFile)
        try await analyzer.finalizeAndFinishThroughEndOfInput()
        return try await resultTask.value
    }

    private static func describe(_ format: AVAudioFormat) -> String {
        "\(Int(format.sampleRate)) Hz, \(format.channelCount) channel(s), \(format.commonFormat)"
    }
}
