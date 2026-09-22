// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLUnpitchedTests {
}

// MARK: -

extension MXLUnpitchedTests {
    @Test
    func equality() {
        #expect(MXLUnpitched() == MXLUnpitched())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let displayStepOctave = MXLDisplayStepOctave(displayStep: .c, displayOctave: MXLOctave(uintValue: 4)!)    // swiftlint:disable:this force_unwrapping line_length
        let values: Set<MXLUnpitched> = [MXLUnpitched(), MXLUnpitched(), MXLUnpitched(displayStepOctave: displayStepOctave)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let displayStepOctave = MXLDisplayStepOctave(displayStep: .c, displayOctave: MXLOctave(uintValue: 4)!)    // swiftlint:disable:this force_unwrapping line_length

        #expect(MXLUnpitched() != MXLUnpitched(displayStepOctave: displayStepOctave))
    }

    @Test
    func init_defaultValues() {
        let value = MXLUnpitched()

        #expect(value.displayStepOctave == nil)
    }

    @Test
    func init_explicitValues() {
        let displayStepOctave = MXLDisplayStepOctave(displayStep: .c, displayOctave: MXLOctave(uintValue: 4)!)    // swiftlint:disable:this force_unwrapping line_length
        let value = MXLUnpitched(displayStepOctave: displayStepOctave)

        #expect(value.displayStepOctave == displayStepOctave)
    }
}
