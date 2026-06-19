import Foundation
import VachaVoxCore

@main
struct VachaVoxCoreSelfTest {
    static func main() async {
        let engine = MockSpeechEngine(result: .init(text: "hello world", isFinal: true))
        let request = SpeechEngineRequest(
            localeIdentifier: "en_US",
            audioFileURL: URL(fileURLWithPath: "/tmp/sample.wav")
        )

        do {
            let result = try await engine.transcribe(request)
            try check(result == SpeechEngineResult(text: "hello world", isFinal: true), "mock transcript result")
            let requests = await engine.requests
            try check(requests == [request], "mock request recording")

            await engine.cancel()
            let didCancel = await engine.didCancel
            try check(didCancel, "mock cancellation")

            print("VachaVoxCoreSelfTest passed")
        } catch {
            fputs("VachaVoxCoreSelfTest failed: \(error.localizedDescription)\n", stderr)
            exit(1)
        }
    }

    private static func check(_ condition: Bool, _ label: String) throws {
        if !condition {
            throw SelfTestError.failed(label)
        }
    }
}

enum SelfTestError: LocalizedError {
    case failed(String)

    var errorDescription: String? {
        switch self {
        case .failed(let label):
            return "Check failed: \(label)"
        }
    }
}
