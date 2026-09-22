// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSoundTests {
}

// MARK: -

extension MXLSoundTests {
    @Test
    func equality() {
        #expect(MXLSound() == MXLSound())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLSound> = [MXLSound(), MXLSound(), MXLSound(id: "s2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSound() != MXLSound(id: "s2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLSound()

        #expect(value.coda == nil)
        #expect(value.isDaCapo == nil)
        #expect(value.dalsegno == nil)
        #expect(value.damperPedal == nil)
        #expect(value.divisions == nil)
        #expect(value.dynamics == nil)
        #expect(value.elevation == nil)
        #expect(value.fine == nil)
        #expect(value.impliesForwardRepeat == nil)
        #expect(value.group.isEmpty)
        #expect(value.id == nil)
        #expect(value.offset == nil)
        #expect(value.pan == nil)
        #expect(value.isPizzicato == nil)
        #expect(value.segno == nil)
        #expect(value.softPedal == nil)
        #expect(value.sostenutoPedal == nil)
        #expect(value.swing == nil)
        #expect(value.tempo == nil)
        #expect(value.timeOnly == nil)
        #expect(value.tocoda == nil)
    }

    @Test
    func init_explicitValues() {
        let group = [MXLSound.Group(instrumentChange: MXLInstrumentChange(id: "i1"))]
        let swing = MXLSwing(content: .straight)
        let offset = MXLOffset(value: 4)
        let value = MXLSound(id: "s1",
                             group: group,
                             swing: swing,
                             offset: offset,
                             tempo: 120,
                             dynamics: 90,
                             isDaCapo: true,
                             segno: "seg1",
                             dalsegno: "seg1",
                             coda: "coda1",
                             tocoda: "coda1",
                             divisions: MXLDivisions(intValue: 4),
                             impliesForwardRepeat: true,
                             fine: "yes",
                             timeOnly: [1],
                             isPizzicato: true,
                             pan: 10,
                             elevation: -10,
                             damperPedal: .yes,
                             softPedal: .no,
                             sostenutoPedal: .number(50))

        #expect(value.coda == "coda1")
        #expect(value.isDaCapo == true)
        #expect(value.dalsegno == "seg1")
        #expect(value.damperPedal == .yes)
        #expect(value.divisions == MXLDivisions(intValue: 4))
        #expect(value.dynamics == 90)
        #expect(value.elevation == -10)
        #expect(value.fine == "yes")
        #expect(value.impliesForwardRepeat == true)
        #expect(value.group == group)
        #expect(value.id == "s1")
        #expect(value.offset == offset)
        #expect(value.pan == 10)
        #expect(value.isPizzicato == true)
        #expect(value.segno == "seg1")
        #expect(value.softPedal == .no)
        #expect(value.sostenutoPedal == .number(50))
        #expect(value.swing == swing)
        #expect(value.tempo == 120)
        #expect(value.timeOnly == [1])
        #expect(value.tocoda == "coda1")
    }
}
