// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLRepeatDirectionTests {
}

// MARK: -

extension MXLRepeatDirectionTests {
    @Test
    func equality() {
        #expect(MXLRepeat.Direction.forward == .forward)
        #expect(MXLRepeat.Direction.backward == .backward)
    }

    @Test
    func hashable() {
        let values: Set<MXLRepeat.Direction> = [.backward, .backward, .forward]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLRepeat.Direction.forward != .backward)
    }
}
