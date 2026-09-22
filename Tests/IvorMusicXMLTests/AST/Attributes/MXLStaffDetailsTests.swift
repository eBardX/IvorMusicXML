// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStaffDetailsTests {
}

// MARK: -

extension MXLStaffDetailsTests {
    @Test
    func equality() {
        #expect(MXLStaffDetails() == MXLStaffDetails())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLStaffDetails> = [MXLStaffDetails(), MXLStaffDetails(), MXLStaffDetails(staffKind: .cue)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLStaffDetails() != MXLStaffDetails(staffKind: .cue))
    }

    @Test
    func init_defaultValues() {
        let value = MXLStaffDetails()

        #expect(value.capo == nil)
        #expect(value.group == nil)
        #expect(value.number == nil)
        #expect(value.printsObject == nil)
        #expect(value.printsSpacing == nil)
        #expect(value.showFrets == .numbers)
        #expect(value.staffKind == nil)
        #expect(value.staffSize == nil)
        #expect(value.staffTuning.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let group = MXLStaffDetails.Group(staffLines: 5)
        let tuning = MXLTuning(step: .e,
                               octave: MXLOctave(uintValue: 4)!)    // swiftlint:disable:this force_unwrapping
        let line = MXLStaffLine(uintValue: 1)!    // swiftlint:disable:this force_unwrapping
        let staffTuning = [MXLStaffTuning(tuning: tuning, line: line)]
        let staffSize = MXLStaffSize(value: 80)
        let value = MXLStaffDetails(staffKind: .cue,
                                    group: group,
                                    staffTuning: staffTuning,
                                    capo: 5,
                                    staffSize: staffSize,
                                    number: MXLStaffNumber(uintValue: 1),
                                    showFrets: .letters,
                                    printsObject: false,
                                    printsSpacing: true)

        #expect(value.capo == 5)
        #expect(value.group == group)
        #expect(value.number == MXLStaffNumber(uintValue: 1))
        #expect(value.printsObject == false)
        #expect(value.printsSpacing == true)
        #expect(value.showFrets == .letters)
        #expect(value.staffKind == .cue)
        #expect(value.staffSize == staffSize)
        #expect(value.staffTuning == staffTuning)
    }
}
