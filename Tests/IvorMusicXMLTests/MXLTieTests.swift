// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTieTests {
}

// MARK: -

extension MXLTieTests {
    @Test
    func test_caseStart() {
        let tie = MXLTie.start

        if case .start = tie {
            // pass
        } else {
            Issue.record("Expected .start case")
        }
    }

    @Test
    func test_caseStop() {
        let tie = MXLTie.stop

        if case .stop = tie {
            // pass
        } else {
            Issue.record("Expected .stop case")
        }
    }

    @Test
    func test_equality() {
        #expect(MXLTie.start == .start)
        #expect(MXLTie.stop == .stop)
    }

    @Test
    func test_hashable() {
        let set: Set<MXLTie> = [.start, .stop, .start]

        #expect(set.count == 2)
    }

    @Test
    func test_inequality() {
        #expect(MXLTie.start != .stop)
    }
}
