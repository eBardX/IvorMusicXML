// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOtherNotationTests {
}

// MARK: -

extension MXLOtherNotationTests {
    @Test
    func equality() {
        #expect(MXLOtherNotation(value: "boo", kind: .single) == MXLOtherNotation(value: "boo", kind: .single))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLOtherNotation> = [MXLOtherNotation(value: "boo", kind: .single),
                                             MXLOtherNotation(value: "boo", kind: .single),
                                             MXLOtherNotation(value: "hiss", kind: .start)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLOtherNotation(value: "boo", kind: .single) != MXLOtherNotation(value: "hiss", kind: .start))
    }

    @Test
    func init_defaultValues() {
        let value = MXLOtherNotation(value: "boo", kind: .single)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.id == nil)
        #expect(value.number == MXLNumberLevel(uintValue: 1))
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.printsObject == nil)
        #expect(value.smufl == nil)
        #expect(value.kind == .single)
        #expect(value.value == "boo")
    }

    @Test
    func init_explicitValues() {
        let value = MXLOtherNotation(id: "on1",
                                     value: "hiss",
                                     kind: .start,
                                     number: MXLNumberLevel(uintValue: 2),
                                     printsObject: false,
                                     position: MXLPosition(defaultX: 10),
                                     font: MXLFont(style: .italic),
                                     color: MXLColor(stringValue: "#800080"),
                                     placement: .above,
                                     smufl: MXLSmuflGlyphName(stringValue: "wiggleVIbratoLargeFaster"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.id == "on1")
        #expect(value.number == MXLNumberLevel(uintValue: 2))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.printsObject == false)
        #expect(value.smufl == MXLSmuflGlyphName(stringValue: "wiggleVIbratoLargeFaster"))
        #expect(value.kind == .start)
        #expect(value.value == "hiss")
    }
}
