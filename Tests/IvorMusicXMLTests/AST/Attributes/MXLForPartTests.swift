// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLForPartTests {
}

// MARK: -

extension MXLForPartTests {
    @Test
    func equality() {
        #expect(MXLForPart(transpose: MXLTranspose.Content(chromatic: 2)) ==    // swiftlint:disable:this identical_operands
                 MXLForPart(transpose: MXLTranspose.Content(chromatic: 2)))
    }

    @Test
    func hashable() {
        let values: Set<MXLForPart> = [MXLForPart(transpose: MXLTranspose.Content(chromatic: 2)),
                                       MXLForPart(transpose: MXLTranspose.Content(chromatic: 2)),
                                       MXLForPart(transpose: MXLTranspose.Content(chromatic: -2))]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLForPart(transpose: MXLTranspose.Content(chromatic: 2)) !=
                 MXLForPart(transpose: MXLTranspose.Content(chromatic: -2)))
    }

    @Test
    func init_defaultValues() {
        let value = MXLForPart(transpose: MXLTranspose.Content(chromatic: 2))

        #expect(value.clef == nil)
        #expect(value.id == nil)
        #expect(value.number == nil)
        #expect(value.transpose == MXLTranspose.Content(chromatic: 2))
    }

    @Test
    func init_explicitValues() {
        let value = MXLForPart(id: "fp1",
                               clef: MXLClef.Content(sign: .g),
                               transpose: MXLTranspose.Content(chromatic: 2),
                               number: MXLStaffNumber(uintValue: 1))

        #expect(value.clef == MXLClef.Content(sign: .g))
        #expect(value.id == "fp1")
        #expect(value.number == MXLStaffNumber(uintValue: 1))
        #expect(value.transpose == MXLTranspose.Content(chromatic: 2))
    }
}
