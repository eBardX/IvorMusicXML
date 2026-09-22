// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPitchTests {
}

// MARK: -

extension MXLPitchTests {
    @Test
    func equality() {
        let octave = MXLOctave(uintValue: 4)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLPitch(step: .c, octave: octave) == MXLPitch(step: .c, octave: octave))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let octave = MXLOctave(uintValue: 4)!    // swiftlint:disable:this force_unwrapping
        let values: Set<MXLPitch> = [MXLPitch(step: .c, octave: octave), MXLPitch(step: .c, octave: octave), MXLPitch(step: .d, octave: octave)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let octave = MXLOctave(uintValue: 4)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLPitch(step: .c, octave: octave) != MXLPitch(step: .d, octave: octave))
    }

    @Test
    func init_defaultValues() {
        let octave = MXLOctave(uintValue: 4)!    // swiftlint:disable:this force_unwrapping
        let value = MXLPitch(step: .c, octave: octave)

        #expect(value.alter == nil)
        #expect(value.octave == octave)
        #expect(value.step == .c)
    }

    @Test
    func init_explicitValues() {
        let octave = MXLOctave(uintValue: 5)!    // swiftlint:disable:this force_unwrapping
        let value = MXLPitch(step: .d, alter: 1, octave: octave)

        #expect(value.alter == 1)
        #expect(value.octave == octave)
        #expect(value.step == .d)
    }
}
