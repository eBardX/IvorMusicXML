// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLUpDownTests {
}

// MARK: -

extension MXLUpDownTests {
    @Test
    func equality() {
        #expect(MXLUpDown.down == .down)
        #expect(MXLUpDown.up == .up)
    }

    @Test
    func hashable() {
        let values: Set<MXLUpDown> = [.down, .down, .up]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLUpDown.down != .up)
    }
}
