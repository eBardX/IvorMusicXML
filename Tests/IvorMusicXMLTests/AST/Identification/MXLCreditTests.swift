// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLCreditTests {
}

// MARK: -

extension MXLCreditTests {
    @Test
    func equality() {
        let content = MXLCredit.Content.creditImage(MXLImage(attributes: MXLImage.Attributes(source: "a.png", kind: "image/png")))

        #expect(MXLCredit(content: content) == MXLCredit(content: content))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let content = MXLCredit.Content.creditImage(MXLImage(attributes: MXLImage.Attributes(source: "a.png", kind: "image/png")))
        let values: Set<MXLCredit> = [MXLCredit(content: content), MXLCredit(content: content), MXLCredit(id: "c2", content: content)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let content = MXLCredit.Content.creditImage(MXLImage(attributes: MXLImage.Attributes(source: "a.png", kind: "image/png")))

        #expect(MXLCredit(content: content) != MXLCredit(id: "c2", content: content))
    }

    @Test
    func init_defaultValues() {
        let content = MXLCredit.Content.creditImage(MXLImage(attributes: MXLImage.Attributes(source: "a.png", kind: "image/png")))
        let value = MXLCredit(content: content)

        #expect(value.bookmark.isEmpty)
        #expect(value.content == content)
        #expect(value.id == nil)
        #expect(value.kind.isEmpty)
        #expect(value.link.isEmpty)
        #expect(value.page == nil)
    }

    @Test
    func init_explicitValues() {
        let content = MXLCredit.Content.creditImage(MXLImage(attributes: MXLImage.Attributes(source: "a.png", kind: "image/png")))
        let link = [MXLLink(xlink: MXLXLink(href: "https://example.com"))]
        let bookmark = [MXLBookmark(id: "b1")]
        let value = MXLCredit(id: "c1", kind: ["title"], link: link, bookmark: bookmark, content: content, page: 1)

        #expect(value.bookmark == bookmark)
        #expect(value.content == content)
        #expect(value.id == "c1")
        #expect(value.kind == ["title"])
        #expect(value.link == link)
        #expect(value.page == 1)
    }
}
