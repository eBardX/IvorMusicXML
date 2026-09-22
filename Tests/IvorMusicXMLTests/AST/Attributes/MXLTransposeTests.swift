// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTransposeTests {
}

// MARK: -

extension MXLTransposeTests {
    @Test
    func equality() {
        let content = MXLTranspose.Content(chromatic: 2)

        #expect(MXLTranspose(content: content) == MXLTranspose(content: content))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let content1 = MXLTranspose.Content(chromatic: 2)
        let content2 = MXLTranspose.Content(chromatic: -2)
        let values: Set<MXLTranspose> = [MXLTranspose(content: content1),
                                         MXLTranspose(content: content1),
                                         MXLTranspose(content: content2)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let content1 = MXLTranspose.Content(chromatic: 2)
        let content2 = MXLTranspose.Content(chromatic: -2)

        #expect(MXLTranspose(content: content1) != MXLTranspose(content: content2))
    }

    @Test
    func init_defaultValues() {
        let content = MXLTranspose.Content(chromatic: 2)
        let value = MXLTranspose(content: content)

        #expect(value.content == content)
        #expect(value.id == nil)
        #expect(value.number == nil)
    }

    @Test
    func init_explicitValues() {
        let content = MXLTranspose.Content(chromatic: 2)
        let value = MXLTranspose(id: "t1",
                                 content: content,
                                 number: MXLStaffNumber(uintValue: 1))

        #expect(value.content == content)
        #expect(value.id == "t1")
        #expect(value.number == MXLStaffNumber(uintValue: 1))
    }
}
