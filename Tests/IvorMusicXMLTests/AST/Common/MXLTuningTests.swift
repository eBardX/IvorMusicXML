// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTuningTests {
}

// MARK: -

extension MXLTuningTests {
    @Test
    func equality() {
        let octave = MXLOctave(uintValue: 4)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLTuning(step: .e, octave: octave) == MXLTuning(step: .e, octave: octave))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let octave = MXLOctave(uintValue: 4)!    // swiftlint:disable:this force_unwrapping
        let values: Set<MXLTuning> = [MXLTuning(step: .e, octave: octave),
                                      MXLTuning(step: .e, octave: octave),
                                      MXLTuning(step: .a, octave: octave)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let octave = MXLOctave(uintValue: 4)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLTuning(step: .e, octave: octave) != MXLTuning(step: .a, octave: octave))
    }

    @Test
    func init_defaultValues() {
        let octave = MXLOctave(uintValue: 4)!    // swiftlint:disable:this force_unwrapping
        let value = MXLTuning(step: .e, octave: octave)

        #expect(value.alter == nil)
        #expect(value.octave == octave)
        #expect(value.step == .e)
    }

    @Test
    func init_explicitValues() {
        let octave = MXLOctave(uintValue: 4)!    // swiftlint:disable:this force_unwrapping
        let value = MXLTuning(step: .e,
                              alter: 1,
                              octave: octave)

        #expect(value.alter == 1)
        #expect(value.octave == octave)
        #expect(value.step == .e)
    }
}
