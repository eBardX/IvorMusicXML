// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSegnoTests {
}

// MARK: -

extension MXLSegnoTests {
    @Test
    func equality() {
        #expect(MXLSegno() == MXLSegno())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLSegno> = [MXLSegno(), MXLSegno(), MXLSegno(id: "s2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSegno() != MXLSegno(id: "s2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLSegno()

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
        let value = MXLSegno(id: "s1",
                             position: MXLPosition(defaultX: 10),
                             font: MXLFont(style: .italic),
                             color: MXLColor(stringValue: "#800080"),
                             halign: .center,
                             valign: .middle,
                             smufl: MXLSmuflSegnoGlyphName(stringValue: "segno"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.halign == .center)
        #expect(value.id == "s1")
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.smufl == MXLSmuflSegnoGlyphName(stringValue: "segno"))
        #expect(value.valign == .middle)
    }
}
