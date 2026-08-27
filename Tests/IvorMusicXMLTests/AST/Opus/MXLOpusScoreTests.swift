// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOpusScoreTests {
}

// MARK: -

extension MXLOpusScoreTests {
    @Test
    func equality() {
        let xlink = MXLXLink(href: "score1.xml")

        #expect(MXLOpus.Score(xlink: xlink) == MXLOpus.Score(xlink: xlink))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let xlink = MXLXLink(href: "score1.xml")
        let otherXlink = MXLXLink(href: "score2.xml")
        let values: Set<MXLOpus.Score> = [MXLOpus.Score(xlink: xlink), MXLOpus.Score(xlink: xlink), MXLOpus.Score(xlink: otherXlink)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let xlink = MXLXLink(href: "score1.xml")
        let otherXlink = MXLXLink(href: "score2.xml")

        #expect(MXLOpus.Score(xlink: xlink) != MXLOpus.Score(xlink: otherXlink))
    }

    @Test
    func init_defaultValues() {
        let xlink = MXLXLink(href: "score1.xml")
        let value = MXLOpus.Score(xlink: xlink)

        #expect(value.newPage == nil)
        #expect(value.xlink == xlink)
    }

    @Test
    func init_explicitValues() {
        let xlink = MXLXLink(href: "score1.xml")
        let value = MXLOpus.Score(newPage: true, xlink: xlink)

        #expect(value.newPage == true)
        #expect(value.xlink == xlink)
    }
}
