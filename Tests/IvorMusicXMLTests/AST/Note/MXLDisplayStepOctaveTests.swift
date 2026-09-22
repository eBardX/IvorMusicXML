// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDisplayStepOctaveTests {
}

// MARK: -

extension MXLDisplayStepOctaveTests {
    @Test
    func equality() {
        let octave = MXLOctave(uintValue: 4)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLDisplayStepOctave(displayStep: .c, displayOctave: octave) ==    // swiftlint:disable:this identical_operands
                 MXLDisplayStepOctave(displayStep: .c, displayOctave: octave))
    }

    @Test
    func hashable() {
        let octave = MXLOctave(uintValue: 4)!    // swiftlint:disable:this force_unwrapping
        let values: Set<MXLDisplayStepOctave> = [MXLDisplayStepOctave(displayStep: .c, displayOctave: octave),
                                                 MXLDisplayStepOctave(displayStep: .c, displayOctave: octave),
                                                 MXLDisplayStepOctave(displayStep: .d, displayOctave: octave)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let octave = MXLOctave(uintValue: 4)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLDisplayStepOctave(displayStep: .c, displayOctave: octave) !=
                 MXLDisplayStepOctave(displayStep: .d, displayOctave: octave))
    }

    @Test
    func init_values() {
        let octave = MXLOctave(uintValue: 4)!    // swiftlint:disable:this force_unwrapping
        let value = MXLDisplayStepOctave(displayStep: .c, displayOctave: octave)

        #expect(value.displayOctave == octave)
        #expect(value.displayStep == .c)
    }
}
