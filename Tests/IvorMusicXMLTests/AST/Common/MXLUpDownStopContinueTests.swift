// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLUpDownStopContinueTests {
}

// MARK: -

extension MXLUpDownStopContinueTests {
    @Test
    func equality() {
        #expect(MXLUpDownStopContinue.down == .down)
        #expect(MXLUpDownStopContinue.up == .up)
    }

    @Test
    func hashable() {
        let values: Set<MXLUpDownStopContinue> = [.continue, .continue, .down, .stop, .up]

        #expect(values.count == 4)
    }

    @Test
    func inequality() {
        #expect(MXLUpDownStopContinue.down != .up)
    }
}
