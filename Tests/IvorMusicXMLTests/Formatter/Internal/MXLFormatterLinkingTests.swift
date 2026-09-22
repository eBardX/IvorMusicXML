// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLFormatterLinkingTests {
}

// MARK: -

extension MXLFormatterLinkingTests {
    @Test
    func format_roundTripsBookmark() throws {
        let bookmark = MXLBookmark(id: "B1",
                                   name: "chorus",
                                   elementPosition: MXLElementPosition(element: "beam",
                                                                       position: 2))

        try expectRoundTrip(items: [.bookmark(bookmark)])
    }

    @Test
    func format_roundTripsLink() throws {
        let xlink = MXLXLink(href: "https://example.org/score.xml",
                             actuate: .onLoad,
                             role: "reference",
                             show: .embed,
                             title: "Companion score")
        let link = MXLLink(xlink: xlink,
                           name: "companion",
                           elementPosition: MXLElementPosition(element: "note",
                                                               position: 1),
                           position: MXLPosition(defaultX: 12,
                                                 defaultY: -8))

        try expectRoundTrip(items: [.link(link)])
    }
}
