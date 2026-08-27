// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStartStopDiscontinueTests {
}

// MARK: -

extension MXLStartStopDiscontinueTests {
    @Test
    func equality() {
        #expect(MXLStartStopDiscontinue.discontinue == .discontinue)
        #expect(MXLStartStopDiscontinue.start == .start)
    }

    @Test
    func hashable() {
        let values: Set<MXLStartStopDiscontinue> = [.discontinue, .discontinue, .start, .stop]

        #expect(values.count == 3)
    }

    @Test
    func inequality() {
        #expect(MXLStartStopDiscontinue.start != .stop)
    }
}
