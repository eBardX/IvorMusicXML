// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLinkTests {
}

// MARK: -

extension MXLLinkTests {
    @Test
    func equality() {
        let xlink = MXLXLink(href: "https://example.com")

        #expect(MXLLink(xlink: xlink) == MXLLink(xlink: xlink))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let xlink = MXLXLink(href: "https://example.com")
        let otherXlink = MXLXLink(href: "https://example.org")
        let values: Set<MXLLink> = [MXLLink(xlink: xlink), MXLLink(xlink: xlink), MXLLink(xlink: otherXlink)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let xlink = MXLXLink(href: "https://example.com")
        let otherXlink = MXLXLink(href: "https://example.org")

        #expect(MXLLink(xlink: xlink) != MXLLink(xlink: otherXlink))
    }

    @Test
    func init_defaultValues() {
        let xlink = MXLXLink(href: "https://example.com")
        let value = MXLLink(xlink: xlink)

        #expect(value.elementPosition == MXLElementPosition())
        #expect(value.xlink == xlink)
        #expect(value.name == nil)
        #expect(value.position == MXLPosition())
    }

    @Test
    func init_explicitValues() {
        let xlink = MXLXLink(href: "https://example.com")
        let elementPosition = MXLElementPosition(element: "beam", position: 2)
        let value = MXLLink(xlink: xlink, name: "verse", elementPosition: elementPosition, position: MXLPosition(defaultX: 10))

        #expect(value.elementPosition == elementPosition)
        #expect(value.xlink == xlink)
        #expect(value.name == "verse")
        #expect(value.position == MXLPosition(defaultX: 10))
    }
}
