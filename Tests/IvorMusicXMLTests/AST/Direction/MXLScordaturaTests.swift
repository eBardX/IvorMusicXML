// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLScordaturaTests {
}

// MARK: -

extension MXLScordaturaTests {
    @Test
    func equality() {
        #expect(MXLScordatura() == MXLScordatura())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLScordatura> = [MXLScordatura(), MXLScordatura(), MXLScordatura(id: "s2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLScordatura() != MXLScordatura(id: "s2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLScordatura()

        #expect(value.accord.isEmpty)
        #expect(value.id == nil)
    }

    @Test
    func init_explicitValues() {
        let accord = [MXLAccord(tuning: MXLTuning(step: .g, octave: MXLOctave(uintValue: 3)!))]    // swiftlint:disable:this force_unwrapping
        let value = MXLScordatura(id: "s1", accord: accord)

        #expect(value.accord == accord)
        #expect(value.id == "s1")
    }
}
