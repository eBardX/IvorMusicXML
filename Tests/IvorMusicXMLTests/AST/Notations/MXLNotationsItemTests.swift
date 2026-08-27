// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNotationsItemTests {
}

// MARK: -

extension MXLNotationsItemTests {
    @Test
    func equality() {
        let fermata = MXLFermata(value: .normal)

        #expect(MXLNotations.Item.fermata(fermata) == .fermata(fermata))
    }

    @Test
    func hashable() {
        let fermata = MXLNotations.Item.fermata(MXLFermata(value: .normal))
        let arpeggiate = MXLNotations.Item.arpeggiate(MXLArpeggiate())
        let values: Set<MXLNotations.Item> = [fermata, fermata, arpeggiate]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let fermata = MXLNotations.Item.fermata(MXLFermata(value: .normal))
        let arpeggiate = MXLNotations.Item.arpeggiate(MXLArpeggiate())

        #expect(fermata != arpeggiate)
    }
}
