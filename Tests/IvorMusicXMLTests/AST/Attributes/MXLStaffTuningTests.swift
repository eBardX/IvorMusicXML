// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStaffTuningTests {
}

// MARK: -

extension MXLStaffTuningTests {
    @Test
    func equality() {
        let tuning = MXLTuning(step: .e, octave: MXLOctave(uintValue: 4)!)    // swiftlint:disable:this force_unwrapping
        let line = MXLStaffLine(uintValue: 1)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLStaffTuning(tuning: tuning, line: line) == MXLStaffTuning(tuning: tuning, line: line))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let tuning1 = MXLTuning(step: .e, octave: MXLOctave(uintValue: 4)!)    // swiftlint:disable:this force_unwrapping
        let tuning2 = MXLTuning(step: .a, octave: MXLOctave(uintValue: 2)!)    // swiftlint:disable:this force_unwrapping
        let line1 = MXLStaffLine(uintValue: 1)!    // swiftlint:disable:this force_unwrapping
        let line2 = MXLStaffLine(uintValue: 2)!    // swiftlint:disable:this force_unwrapping
        let values: Set<MXLStaffTuning> = [MXLStaffTuning(tuning: tuning1, line: line1),
                                           MXLStaffTuning(tuning: tuning1, line: line1),
                                           MXLStaffTuning(tuning: tuning2, line: line2)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let tuning1 = MXLTuning(step: .e, octave: MXLOctave(uintValue: 4)!)    // swiftlint:disable:this force_unwrapping
        let tuning2 = MXLTuning(step: .a, octave: MXLOctave(uintValue: 2)!)    // swiftlint:disable:this force_unwrapping
        let line = MXLStaffLine(uintValue: 1)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLStaffTuning(tuning: tuning1, line: line) != MXLStaffTuning(tuning: tuning2, line: line))
    }

    @Test
    func init_values() {
        let tuning = MXLTuning(step: .e, octave: MXLOctave(uintValue: 4)!)    // swiftlint:disable:this force_unwrapping
        let line = MXLStaffLine(uintValue: 1)!    // swiftlint:disable:this force_unwrapping
        let value = MXLStaffTuning(tuning: tuning, line: line)

        #expect(value.line == line)
        #expect(value.tuning == tuning)
    }
}
