// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLCodaTests {
}

// MARK: -

extension MXLCodaTests {
    @Test
    func equality() {
        #expect(MXLCoda() == MXLCoda())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLCoda> = [MXLCoda(), MXLCoda(), MXLCoda(id: "c2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLCoda() != MXLCoda(id: "c2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLCoda()

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.halign == nil)
        #expect(value.id == nil)
        #expect(value.position == MXLPosition())
        #expect(value.smufl == nil)
        #expect(value.valign == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLCoda(id: "c1",
                            position: MXLPosition(defaultX: 10),
                            font: MXLFont(style: .italic),
                            color: MXLColor(stringValue: "#800080"),
                            halign: .center,
                            valign: .middle,
                            smufl: MXLSmuflCodaGlyphName(stringValue: "coda"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.halign == .center)
        #expect(value.id == "c1")
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.smufl == MXLSmuflCodaGlyphName(stringValue: "coda"))
        #expect(value.valign == .middle)
    }
}
