// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLEffectValueTests {
}

// MARK: -

extension MXLEffectValueTests {
    @Test
    func equality() {
        #expect(MXLEffect.Value.anvil == .anvil)
    }

    @Test
    func hashable() {
        let values: Set<MXLEffect.Value> = [.anvil, .anvil, .siren]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLEffect.Value.anvil != .siren)
    }
}
