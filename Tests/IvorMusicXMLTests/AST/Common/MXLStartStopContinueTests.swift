// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStartStopContinueTests {
}

// MARK: -

extension MXLStartStopContinueTests {
    @Test
    func equality() {
        #expect(MXLStartStopContinue.start == .start)
        #expect(MXLStartStopContinue.continue == .continue)
    }

    @Test
    func hashable() {
        let values: Set<MXLStartStopContinue> = [.continue, .continue, .start, .stop]

        #expect(values.count == 3)
    }

    @Test
    func inequality() {
        #expect(MXLStartStopContinue.start != .stop)
    }
}
