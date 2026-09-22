// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOtherDirectionTests {
}

// MARK: -

extension MXLOtherDirectionTests {
    @Test
    func equality() {
        #expect(MXLOtherDirection(value: "boo") == MXLOtherDirection(value: "boo"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLOtherDirection> = [MXLOtherDirection(value: "boo"),
                                              MXLOtherDirection(value: "boo"),
                                              MXLOtherDirection(value: "hiss")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLOtherDirection(value: "boo") != MXLOtherDirection(value: "hiss"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLOtherDirection(value: "boo")

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.halign == nil)
        #expect(value.id == nil)
        #expect(value.position == MXLPosition())
        #expect(value.printsObject == nil)
        #expect(value.smufl == nil)
        #expect(value.valign == nil)
        #expect(value.value == "boo")
    }

    @Test
    func init_explicitValues() {
        let value = MXLOtherDirection(id: "od1",
                                      value: "boo",
                                      printsObject: false,
                                      position: MXLPosition(defaultX: 10),
                                      font: MXLFont(style: .italic),
                                      color: MXLColor(stringValue: "#800080"),
                                      halign: .center,
                                      valign: .middle,
                                      smufl: MXLSmuflGlyphName(stringValue: "wiggleVIbratoLargeFaster"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.halign == .center)
        #expect(value.id == "od1")
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.printsObject == false)
        #expect(value.smufl == MXLSmuflGlyphName(stringValue: "wiggleVIbratoLargeFaster"))
        #expect(value.valign == .middle)
        #expect(value.value == "boo")
    }
}
