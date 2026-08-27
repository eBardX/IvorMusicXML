// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPercussionTests {
}

// MARK: -

extension MXLPercussionTests {
    @Test
    func equality() {
        let content = MXLPercussion.Content.timpani(MXLTimpani())

        #expect(MXLPercussion(content: content) == MXLPercussion(content: content))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let content = MXLPercussion.Content.timpani(MXLTimpani())
        let values: Set<MXLPercussion> = [MXLPercussion(content: content), MXLPercussion(content: content), MXLPercussion(id: "p2", content: content)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let content = MXLPercussion.Content.timpani(MXLTimpani())

        #expect(MXLPercussion(content: content) != MXLPercussion(id: "p2", content: content))
    }

    @Test
    func init_defaultValues() {
        let content = MXLPercussion.Content.timpani(MXLTimpani())
        let value = MXLPercussion(content: content)

        #expect(value.color == nil)
        #expect(value.content == content)
        #expect(value.enclosure == nil)
        #expect(value.font == MXLFont())
        #expect(value.halign == nil)
        #expect(value.id == nil)
        #expect(value.position == MXLPosition())
        #expect(value.valign == nil)
    }

    @Test
    func init_explicitValues() {
        let content = MXLPercussion.Content.timpani(MXLTimpani())
        let value = MXLPercussion(id: "p1",
                                  content: content,
                                  position: MXLPosition(defaultX: 10),
                                  font: MXLFont(style: .italic),
                                  color: MXLColor(stringValue: "#800080"),
                                  halign: .center,
                                  valign: .middle,
                                  enclosure: .circle)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.content == content)
        #expect(value.enclosure == .circle)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.halign == .center)
        #expect(value.id == "p1")
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.valign == .middle)
    }
}
