// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTechnicalItemTests {
}

// MARK: -

extension MXLTechnicalItemTests {
    @Test
    func equality() {
        let fret = MXLFret(value: 3)

        #expect(MXLTechnical.Item.fret(fret) == .fret(fret))
    }

    @Test
    func hashable() {
        let fret = MXLTechnical.Item.fret(MXLFret(value: 3))
        let string = MXLTechnical.Item.string(MXLString(value: 1))
        let values: Set<MXLTechnical.Item> = [fret, fret, string]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let fret = MXLTechnical.Item.fret(MXLFret(value: 3))
        let string = MXLTechnical.Item.string(MXLString(value: 1))

        #expect(fret != string)
    }
}
