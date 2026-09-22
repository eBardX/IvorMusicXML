// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLWoodValueTests {
}

// MARK: -

extension MXLWoodValueTests {
    @Test
    func equality() {
        #expect(MXLWood.Value.claves == .claves)
    }

    @Test
    func hashable() {
        let values: Set<MXLWood.Value> = [.claves, .claves, .guiro]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLWood.Value.claves != .guiro)
    }
}
