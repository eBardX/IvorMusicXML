// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPartLinkTests {
}

// MARK: -

extension MXLPartLinkTests {
    @Test
    func equality() {
        let xlink = MXLXLink(href: "part1.musicxml")

        #expect(MXLPartLink(xlink: xlink) == MXLPartLink(xlink: xlink))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let xlink = MXLXLink(href: "part1.musicxml")
        let otherXlink = MXLXLink(href: "part2.musicxml")
        let values: Set<MXLPartLink> = [MXLPartLink(xlink: xlink), MXLPartLink(xlink: xlink), MXLPartLink(xlink: otherXlink)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let xlink = MXLXLink(href: "part1.musicxml")
        let otherXlink = MXLXLink(href: "part2.musicxml")

        #expect(MXLPartLink(xlink: xlink) != MXLPartLink(xlink: otherXlink))
    }

    @Test
    func init_defaultValues() {
        let xlink = MXLXLink(href: "part1.musicxml")
        let value = MXLPartLink(xlink: xlink)

        #expect(value.groupLink.isEmpty)
        #expect(value.instrumentLink.isEmpty)
        #expect(value.xlink == xlink)
    }

    @Test
    func init_explicitValues() {
        let xlink = MXLXLink(href: "part1.musicxml")
        let instrumentLink = [MXLInstrumentLink(id: "i1")]
        let groupLink = ["group1"]
        let value = MXLPartLink(instrumentLink: instrumentLink, groupLink: groupLink, xlink: xlink)

        #expect(value.groupLink == groupLink)
        #expect(value.instrumentLink == instrumentLink)
        #expect(value.xlink == xlink)
    }
}
