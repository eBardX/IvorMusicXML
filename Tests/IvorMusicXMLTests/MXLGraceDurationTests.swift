// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLGraceDurationTests {
}

// MARK: -

extension MXLGraceDurationTests {
    @Test
    func test_caseMakeTime() {
        let duration = MXLGraceDuration.makeTime(0.5)

        if case let .makeTime(value) = duration {
            #expect(value == 0.5)
        } else {
            Issue.record("Expected .makeTime case")
        }
    }

    @Test
    func test_caseStealTimeFollowing() {
        let duration = MXLGraceDuration.stealTimeFollowing(25.0)

        if case let .stealTimeFollowing(value) = duration {
            #expect(value == 25.0)
        } else {
            Issue.record("Expected .stealTimeFollowing case")
        }
    }

    @Test
    func test_caseStealTimePrevious() {
        let duration = MXLGraceDuration.stealTimePrevious(75.0)

        if case let .stealTimePrevious(value) = duration {
            #expect(value == 75.0)
        } else {
            Issue.record("Expected .stealTimePrevious case")
        }
    }

    @Test
    func test_caseUnspecified() {
        let duration = MXLGraceDuration.unspecified

        if case .unspecified = duration {
            // pass
        } else {
            Issue.record("Expected .unspecified case")
        }
    }
}
