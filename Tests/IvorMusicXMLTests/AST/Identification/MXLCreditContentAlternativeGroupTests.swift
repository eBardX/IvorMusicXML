// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLCreditContentAlternativeGroupTests {
}

// MARK: -

extension MXLCreditContentAlternativeGroupTests {
    @Test
    func equality() {
        let content = MXLCredit.Content.AlternativeGroup.Content.creditWords(MXLFormattedTextID(value: "Title"))

        #expect(MXLCredit.Content.AlternativeGroup(content: content) ==    // swiftlint:disable:this identical_operands
                 MXLCredit.Content.AlternativeGroup(content: content))
    }

    @Test
    func hashable() {
        let content = MXLCredit.Content.AlternativeGroup.Content.creditWords(MXLFormattedTextID(value: "Title"))
        let otherContent = MXLCredit.Content.AlternativeGroup.Content.creditSymbol(MXLFormattedSymbolID(value: "coda"))
        let values: Set<MXLCredit.Content.AlternativeGroup> = [MXLCredit.Content.AlternativeGroup(content: content),
                                                               MXLCredit.Content.AlternativeGroup(content: content),
                                                               MXLCredit.Content.AlternativeGroup(content: otherContent)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let content = MXLCredit.Content.AlternativeGroup.Content.creditWords(MXLFormattedTextID(value: "Title"))
        let otherContent = MXLCredit.Content.AlternativeGroup.Content.creditSymbol(MXLFormattedSymbolID(value: "coda"))

        #expect(MXLCredit.Content.AlternativeGroup(content: content) !=
                 MXLCredit.Content.AlternativeGroup(content: otherContent))
    }

    @Test
    func init_defaultValues() {
        let content = MXLCredit.Content.AlternativeGroup.Content.creditWords(MXLFormattedTextID(value: "Title"))
        let value = MXLCredit.Content.AlternativeGroup(content: content)

        #expect(value.bookmark.isEmpty)
        #expect(value.content == content)
        #expect(value.link.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let content = MXLCredit.Content.AlternativeGroup.Content.creditWords(MXLFormattedTextID(value: "Title"))
        let link = [MXLLink(xlink: MXLXLink(href: "https://example.com"))]
        let bookmark = [MXLBookmark(id: "b1")]
        let value = MXLCredit.Content.AlternativeGroup(link: link, bookmark: bookmark, content: content)

        #expect(value.bookmark == bookmark)
        #expect(value.content == content)
        #expect(value.link == link)
    }
}
