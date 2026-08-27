// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLRestTests {
}

// MARK: -

extension MXLRestTests {
    @Test
    func equality() {
        #expect(MXLRest() == MXLRest())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLRest> = [MXLRest(), MXLRest(), MXLRest(measure: true)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLRest() != MXLRest(measure: true))
    }

    @Test
    func init_defaultValues() {
        let value = MXLRest()

        #expect(value.displayStepOctave == nil)
        #expect(value.measure == nil)
    }

    @Test
    func init_explicitValues() {
        let displayStepOctave = MXLDisplayStepOctave(displayStep: .c, displayOctave: MXLOctave(uintValue: 4)!)    // swiftlint:disable:this force_unwrapping line_length
        let value = MXLRest(displayStepOctave: displayStepOctave, measure: true)

        #expect(value.displayStepOctave == displayStepOctave)
        #expect(value.measure == true)
    }
}
