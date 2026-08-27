// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTransposeContentTests {
}

// MARK: -

extension MXLTransposeContentTests {
    @Test
    func equality() {
        #expect(MXLTranspose.Content(chromatic: 2) == MXLTranspose.Content(chromatic: 2))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLTranspose.Content> = [MXLTranspose.Content(chromatic: 2),
                                                 MXLTranspose.Content(chromatic: 2),
                                                 MXLTranspose.Content(chromatic: -2)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTranspose.Content(chromatic: 2) != MXLTranspose.Content(chromatic: -2))
    }

    @Test
    func init_defaultValues() {
        let value = MXLTranspose.Content(chromatic: 2)

        #expect(value.chromatic == 2)
        #expect(value.diatonic == nil)
        #expect(value.double == nil)
        #expect(value.octaveChange == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLTranspose.Content(diatonic: MXLDiatonicSteps(intValue: 1),
                                         chromatic: 2,
                                         octaveChange: MXLOctaveChange(intValue: -1),
                                         double: MXLDouble(isAbove: true))

        #expect(value.chromatic == 2)
        #expect(value.diatonic == MXLDiatonicSteps(intValue: 1))
        #expect(value.double == MXLDouble(isAbove: true))
        #expect(value.octaveChange == MXLOctaveChange(intValue: -1))
    }
}
