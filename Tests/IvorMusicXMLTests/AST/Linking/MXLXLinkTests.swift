// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLXLinkTests {
}

// MARK: -

extension MXLXLinkTests {
    @Test
    func equality() {
        #expect(MXLXLink(href: "https://example.com") == MXLXLink(href: "https://example.com"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLXLink> = [MXLXLink(href: "https://example.com"),
                                     MXLXLink(href: "https://example.com"),
                                     MXLXLink(href: "https://example.org")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLXLink(href: "https://example.com") != MXLXLink(href: "https://example.org"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLXLink(href: "https://example.com")

        #expect(value.actuate == .onRequest)
        #expect(value.href == "https://example.com")
        #expect(value.role == nil)
        #expect(value.show == .replace)
        #expect(value.title == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLXLink(href: "https://example.com",
                             actuate: .onLoad,
                             role: "opus",
                             show: .embed,
                             title: "Score")

        #expect(value.actuate == .onLoad)
        #expect(value.href == "https://example.com")
        #expect(value.role == "opus")
        #expect(value.show == .embed)
        #expect(value.title == "Score")
    }
}
