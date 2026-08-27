// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDirectionKindTests {
}

// MARK: -

extension MXLDirectionKindTests {
    @Test
    func equality() {
        let content = MXLDirection.Kind.Content.coda([MXLCoda()])

        #expect(MXLDirection.Kind(content: content) == MXLDirection.Kind(content: content))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let content = MXLDirection.Kind.Content.coda([MXLCoda()])
        let otherContent = MXLDirection.Kind.Content.words(MXLFormattedTextID(value: "Allegro"))
        let values: Set<MXLDirection.Kind> = [MXLDirection.Kind(content: content),
                                              MXLDirection.Kind(content: content),
                                              MXLDirection.Kind(content: otherContent)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let content = MXLDirection.Kind.Content.coda([MXLCoda()])
        let otherContent = MXLDirection.Kind.Content.words(MXLFormattedTextID(value: "Allegro"))

        #expect(MXLDirection.Kind(content: content) != MXLDirection.Kind(content: otherContent))
    }

    @Test
    func init_defaultValues() {
        let content = MXLDirection.Kind.Content.coda([MXLCoda()])
        let value = MXLDirection.Kind(content: content)

        #expect(value.content == content)
        #expect(value.id == nil)
    }

    @Test
    func init_explicitValues() {
        let content = MXLDirection.Kind.Content.coda([MXLCoda()])
        let value = MXLDirection.Kind(id: "dt1", content: content)

        #expect(value.content == content)
        #expect(value.id == "dt1")
    }
}
