// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiXML

// The writer is driven directly rather than through
// `MXLFormatter.format(_:compressed:)`, so that the round trip is asserted
// independently of the pipeline dispatch that turns opus formatting on.
struct MXLFormatterOpusTests {
}

// MARK: -

extension MXLFormatterOpusTests {
    @Test
    func format_namesTheOpusEntryInACompressedArchive() throws {
        let opus = MXLOpus(version: .current,
                           title: "Collected Works",
                           items: [.score(MXLOpus.Score(xlink: MXLXLink(href: "movement1.musicxml")))])
        let document = MXLDocument(content: .opus(opus),
                                   isNormalized: true,
                                   isValidated: true)

        let data = try MXLFormatter().format(document,
                                             compressed: true)
        let (reparsed, _) = try MXLParser().parse(data,
                                                  compressed: true)

        #expect(reparsed.content == document.content)
    }

    @Test
    func format_omitsNewPageWhenAbsent() throws {
        let opus = MXLOpus(version: .v4_0,
                           title: "Unpaged",
                           items: [.score(MXLOpus.Score(xlink: MXLXLink(href: "score.musicxml")))])

        #expect(try !xml(opus).contains("new-page"))

        try expectRoundTrip(opus)
    }

    @Test
    func format_omitsTitleWhenAbsent() throws {
        let opus = MXLOpus(version: .v4_0,
                           items: [.score(MXLOpus.Score(xlink: MXLXLink(href: "score.musicxml")))])

        #expect(try !xml(opus).contains("<title>"))

        try expectRoundTrip(opus)
    }

    @Test
    func format_writesEveryItemKindTogether() throws {
        let opus = MXLOpus(version: .v4_0,
                           title: "Mixed",
                           items: [.opusLink(MXLXLink(href: "linked.musicxml")),
                                   .score(MXLOpus.Score(xlink: MXLXLink(href: "score.musicxml"))),
                                   .opus(MXLOpus(version: .v4_0,
                                                 title: "Nested"))])

        try expectRoundTrip(opus)
    }

    @Test
    func format_writesFlatOpusOfScores() throws {
        let opus = MXLOpus(version: .v4_0,
                           title: "Collected Works",
                           items: [.score(MXLOpus.Score(xlink: MXLXLink(href: "movement1.musicxml"))),
                                   .score(MXLOpus.Score(xlink: MXLXLink(href: "movement2.musicxml")))])

        try expectRoundTrip(opus)
    }

    @Test
    func format_writesNestedOpusTwoLevelsDeep() throws {
        let innermost = MXLOpus(version: .v4_0,
                                title: "Book I",
                                items: [.score(MXLOpus.Score(xlink: MXLXLink(href: "prelude.musicxml")))])
        let inner = MXLOpus(version: .v4_0,
                            title: "Volume One",
                            items: [.opus(innermost)])
        let opus = MXLOpus(version: .v4_0,
                           title: "Complete Works",
                           items: [.opus(inner)])

        try expectRoundTrip(opus)
    }

    @Test
    func format_writesNewPageWhenPresent() throws {
        let opus = MXLOpus(version: .v4_0,
                           title: "Paged",
                           items: [.score(MXLOpus.Score(newPage: true,
                                                        xlink: MXLXLink(href: "first.musicxml"))),
                                   .score(MXLOpus.Score(newPage: false,
                                                        xlink: MXLXLink(href: "second.musicxml")))])

        let text = try xml(opus)

        #expect(text.contains("new-page=\"yes\""))
        #expect(text.contains("new-page=\"no\""))

        try expectRoundTrip(opus)
    }

    @Test
    func format_writesOpusLink() throws {
        let opus = MXLOpus(version: .v4_0,
                           title: "Collected Works",
                           items: [.opusLink(MXLXLink(href: "other-opus.musicxml"))])

        try expectRoundTrip(opus)
    }

    @Test
    func format_writesTheDefaultValuedXLinkAttributes() throws {
        let opus = MXLOpus(version: .v4_0,
                           title: "Linked",
                           items: [.score(MXLOpus.Score(xlink: MXLXLink(href: "score.musicxml")))])

        let text = try xml(opus)

        #expect(text.contains("xlink:href=\"score.musicxml\""))
        #expect(text.contains("xlink:actuate=\"onRequest\""))
        #expect(text.contains("xlink:show=\"replace\""))

        try expectRoundTrip(opus)
    }

    @Test
    func format_writesTheFullXLinkAttributeSet() throws {
        let xlink = MXLXLink(href: "score.musicxml",
                             actuate: .onLoad,
                             role: "http://example.com/role",
                             show: .embed,
                             title: "First Movement")
        let opus = MXLOpus(version: .v4_0,
                           title: "Linked",
                           items: [.opusLink(xlink)])

        let text = try xml(opus)

        #expect(text.contains("xlink:role=\"http://example.com/role\""))
        #expect(text.contains("xlink:title=\"First Movement\""))

        try expectRoundTrip(opus)
    }

    @Test
    func format_writesTheOpusDocumentTypeDeclaration() throws {
        let text = try xml(MXLOpus(version: .v4_0,
                                   title: "Collected Works"))

        #expect(text.contains("<!DOCTYPE opus PUBLIC \"-//Recordare//DTD MusicXML 4.0 Opus//EN\""))
        #expect(text.contains("\"http://www.musicxml.org/dtds/opus.dtd\""))
        #expect(text.contains("xmlns:xlink=\"http://www.w3.org/1999/xlink\""))
        #expect(text.contains("version=\"4.0\""))
    }

    @Test
    func format_writesTitleWhenPresent() throws {
        let opus = MXLOpus(version: .v4_0,
                           title: "Collected Works")

        #expect(try xml(opus).contains("<title>Collected Works</title>"))

        try expectRoundTrip(opus)
    }
}
