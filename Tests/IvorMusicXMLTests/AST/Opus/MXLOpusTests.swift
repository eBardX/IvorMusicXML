// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOpusTests {
}

// MARK: -

extension MXLOpusTests {
    @Test
    func equality() {
        #expect(MXLOpus(title: "Collected Works") == MXLOpus(title: "Collected Works"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLOpus> = [MXLOpus(title: "Collected Works"), MXLOpus(title: "Collected Works"), MXLOpus(title: "Other Works")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLOpus(title: "Collected Works") != MXLOpus(title: "Other Works"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLOpus(title: "Collected Works")

        #expect(value.items.isEmpty)
        #expect(value.title == "Collected Works")
        #expect(value.version == MXLDocument.Version(major: 1, minor: 0))
    }

    @Test
    func init_explicitValues() {
        let items: [MXLOpus.Item] = [.opusLink(MXLXLink(href: "opus2.xml"))]
        let value = MXLOpus(version: MXLDocument.Version(major: 4, minor: 0), title: "Collected Works", items: items)

        #expect(value.items == items)
        #expect(value.title == "Collected Works")
        #expect(value.version == MXLDocument.Version(major: 4, minor: 0))
    }
}
