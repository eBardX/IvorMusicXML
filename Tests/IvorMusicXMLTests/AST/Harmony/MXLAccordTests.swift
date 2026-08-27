// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLAccordTests {
}

// MARK: -

extension MXLAccordTests {
    @Test
    func equality() {
        let tuning = MXLTuning(step: .g, octave: MXLOctave(uintValue: 3)!)    // swiftlint:disable:this force_unwrapping

        #expect(MXLAccord(tuning: tuning) == MXLAccord(tuning: tuning))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let tuning = MXLTuning(step: .g, octave: MXLOctave(uintValue: 3)!)    // swiftlint:disable:this force_unwrapping
        let otherTuning = MXLTuning(step: .a, octave: MXLOctave(uintValue: 4)!)    // swiftlint:disable:this force_unwrapping
        let values: Set<MXLAccord> = [MXLAccord(tuning: tuning), MXLAccord(tuning: tuning), MXLAccord(tuning: otherTuning)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let tuning = MXLTuning(step: .g, octave: MXLOctave(uintValue: 3)!)    // swiftlint:disable:this force_unwrapping
        let otherTuning = MXLTuning(step: .a, octave: MXLOctave(uintValue: 4)!)    // swiftlint:disable:this force_unwrapping

        #expect(MXLAccord(tuning: tuning) != MXLAccord(tuning: otherTuning))
    }

    @Test
    func init_defaultValues() {
        let tuning = MXLTuning(step: .g, octave: MXLOctave(uintValue: 3)!)    // swiftlint:disable:this force_unwrapping
        let value = MXLAccord(tuning: tuning)

        #expect(value.string == nil)
        #expect(value.tuning == tuning)
    }

    @Test
    func init_explicitValues() {
        let tuning = MXLTuning(step: .g, octave: MXLOctave(uintValue: 3)!)    // swiftlint:disable:this force_unwrapping
        let value = MXLAccord(tuning: tuning, string: MXLStringNumber(uintValue: 1))

        #expect(value.string == MXLStringNumber(uintValue: 1))
        #expect(value.tuning == tuning)
    }
}
