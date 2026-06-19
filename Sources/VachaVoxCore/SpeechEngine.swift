import Foundation

public struct SpeechEngineRequest: Equatable, Sendable {
    public var localeIdentifier: String
    public var audioFileURL: URL

    public init(localeIdentifier: String, audioFileURL: URL) {
        self.localeIdentifier = localeIdentifier
        self.audioFileURL = audioFileURL
    }
}

public struct SpeechEngineResult: Equatable, Sendable {
    public var text: String
    public var isFinal: Bool

    public init(text: String, isFinal: Bool) {
        self.text = text
        self.isFinal = isFinal
    }
}

public enum SpeechEngineReadiness: Equatable, Sendable {
    case unavailable(reason: String)
    case supported(assetStatus: String)
    case ready
}

public protocol SpeechEngine: Sendable {
    func readiness(localeIdentifier: String) async -> SpeechEngineReadiness
    func transcribe(_ request: SpeechEngineRequest) async throws -> SpeechEngineResult
    func cancel() async
}

public actor MockSpeechEngine: SpeechEngine {
    private var result: SpeechEngineResult
    private var readinessValue: SpeechEngineReadiness
    private(set) public var requests: [SpeechEngineRequest] = []
    private(set) public var didCancel = false

    public init(
        readiness: SpeechEngineReadiness = .ready,
        result: SpeechEngineResult = .init(text: "mock transcript", isFinal: true)
    ) {
        self.readinessValue = readiness
        self.result = result
    }

    public func readiness(localeIdentifier: String) async -> SpeechEngineReadiness {
        readinessValue
    }

    public func transcribe(_ request: SpeechEngineRequest) async throws -> SpeechEngineResult {
        requests.append(request)
        return result
    }

    public func cancel() async {
        didCancel = true
    }
}
