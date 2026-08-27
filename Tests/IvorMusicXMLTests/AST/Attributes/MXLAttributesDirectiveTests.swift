// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLAttributesDirectiveTests {
}

// MARK: -

extension MXLAttributesDirectiveTests {
    @Test
    func equality() {
        #expect(MXLAttributes.Directive(value: "Allegro") ==    // swiftlint:disable:this identical_operands
                 MXLAttributes.Directive(value: "Allegro"))
    }

    @Test
    func hashable() {
        let values: Set<MXLAttributes.Directive> = [MXLAttributes.Directive(value: "Allegro"),
                                                    MXLAttributes.Directive(value: "Allegro"),
                                                    MXLAttributes.Directive(value: "Andante")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLAttributes.Directive(value: "Allegro") != MXLAttributes.Directive(value: "Andante"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLAttributes.Directive(value: "Allegro")

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.position == MXLPosition())
        #expect(value.value == "Allegro")
        #expect(value.xmlLang == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLAttributes.Directive(value: "Allegro",
                                            position: MXLPosition(defaultX: 10),
                                            font: MXLFont(style: .italic),
                                            color: MXLColor(stringValue: "#800080"),
                                            xmlLang: "en")

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.value == "Allegro")
        #expect(value.xmlLang == "en")
    }
}
