// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMeasureStyleTests {
}

// MARK: -

extension MXLMeasureStyleTests {
    @Test
    func equality() {
        let content = MXLMeasureStyle.Content.multipleRest(MXLMultipleRest(value: 4))

        #expect(MXLMeasureStyle(content: content) == MXLMeasureStyle(content: content))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let content1 = MXLMeasureStyle.Content.multipleRest(MXLMultipleRest(value: 4))
        let content2 = MXLMeasureStyle.Content.multipleRest(MXLMultipleRest(value: 8))
        let values: Set<MXLMeasureStyle> = [MXLMeasureStyle(content: content1),
                                            MXLMeasureStyle(content: content1),
                                            MXLMeasureStyle(content: content2)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let content1 = MXLMeasureStyle.Content.multipleRest(MXLMultipleRest(value: 4))
        let content2 = MXLMeasureStyle.Content.multipleRest(MXLMultipleRest(value: 8))

        #expect(MXLMeasureStyle(content: content1) != MXLMeasureStyle(content: content2))
    }

    @Test
    func init_defaultValues() {
        let content = MXLMeasureStyle.Content.multipleRest(MXLMultipleRest(value: 4))
        let value = MXLMeasureStyle(content: content)

        #expect(value.color == nil)
        #expect(value.content == content)
        #expect(value.font == MXLFont())
        #expect(value.id == nil)
        #expect(value.number == nil)
    }

    @Test
    func init_explicitValues() {
        let content = MXLMeasureStyle.Content.multipleRest(MXLMultipleRest(value: 4))
        let value = MXLMeasureStyle(id: "ms1",
                                    content: content,
                                    number: MXLStaffNumber(uintValue: 1),
                                    font: MXLFont(style: .italic),
                                    color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.content == content)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.id == "ms1")
        #expect(value.number == MXLStaffNumber(uintValue: 1))
    }
}
