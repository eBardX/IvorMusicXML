// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStickMaterialTests {
}

// MARK: -

extension MXLStickMaterialTests {
    @Test
    func equality() {
        #expect(MXLStick.Material.hard == .hard)
    }

    @Test
    func hashable() {
        let values: Set<MXLStick.Material> = [.hard, .hard, .soft]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLStick.Material.hard != .soft)
    }
}
