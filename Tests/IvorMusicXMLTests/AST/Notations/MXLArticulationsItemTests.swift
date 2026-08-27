// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLArticulationsItemTests {
}

// MARK: -

extension MXLArticulationsItemTests {
    @Test
    func equality() {
        let breathMark = MXLBreathMark(value: .comma)

        #expect(MXLArticulations.Item.breathMark(breathMark) == .breathMark(breathMark))
    }

    @Test
    func hashable() {
        let breathMark = MXLArticulations.Item.breathMark(MXLBreathMark(value: .comma))
        let caesura = MXLArticulations.Item.caesura(MXLCaesura(value: .normal))
        let values: Set<MXLArticulations.Item> = [breathMark, breathMark, caesura]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let breathMark = MXLArticulations.Item.breathMark(MXLBreathMark(value: .comma))
        let caesura = MXLArticulations.Item.caesura(MXLCaesura(value: .normal))

        #expect(breathMark != caesura)
    }
}
