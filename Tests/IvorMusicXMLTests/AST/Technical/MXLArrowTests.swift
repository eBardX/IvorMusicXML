// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLArrowTests {
}

// MARK: -

extension MXLArrowTests {
    @Test
    func equality() {
        let content = MXLArrow.Content.circularArrow(.clockwise)

        #expect(MXLArrow(content: content) == MXLArrow(content: content))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let content = MXLArrow.Content.circularArrow(.clockwise)
        let otherContent = MXLArrow.Content.circularArrow(.anticlockwise)
        let values: Set<MXLArrow> = [MXLArrow(content: content), MXLArrow(content: content), MXLArrow(content: otherContent)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let content = MXLArrow.Content.circularArrow(.clockwise)
        let otherContent = MXLArrow.Content.circularArrow(.anticlockwise)

        #expect(MXLArrow(content: content) != MXLArrow(content: otherContent))
    }

    @Test
    func init_defaultValues() {
        let content = MXLArrow.Content.circularArrow(.clockwise)
        let value = MXLArrow(content: content)

        #expect(value.color == nil)
        #expect(value.content == content)
        #expect(value.font == MXLFont())
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.smufl == nil)
    }

    @Test
    func init_explicitValues() {
        let content = MXLArrow.Content.circularArrow(.anticlockwise)
        let value = MXLArrow(content: content,
                             position: MXLPosition(defaultX: 10),
                             font: MXLFont(style: .italic),
                             color: MXLColor(stringValue: "#800080"),
                             placement: .above,
                             smufl: MXLSmuflGlyphName(stringValue: "arrowBlackUp"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.content == content)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.smufl == MXLSmuflGlyphName(stringValue: "arrowBlackUp"))
    }
}
