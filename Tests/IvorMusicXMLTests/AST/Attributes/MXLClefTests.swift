// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLClefTests {
}

// MARK: -

extension MXLClefTests {
    @Test
    func equality() {
        #expect(MXLClef(content: MXLClef.Content(sign: .g)) ==    // swiftlint:disable:this identical_operands
                 MXLClef(content: MXLClef.Content(sign: .g)))
    }

    @Test
    func hashable() {
        let values: Set<MXLClef> = [MXLClef(content: MXLClef.Content(sign: .g)),
                                    MXLClef(content: MXLClef.Content(sign: .g)),
                                    MXLClef(content: MXLClef.Content(sign: .f))]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLClef(content: MXLClef.Content(sign: .g)) != MXLClef(content: MXLClef.Content(sign: .f)))
    }

    @Test
    func init_defaultValues() {
        let value = MXLClef(content: MXLClef.Content(sign: .g))

        #expect(value.color == nil)
        #expect(value.content == MXLClef.Content(sign: .g))
        #expect(value.font == MXLFont())
        #expect(value.id == nil)
        #expect(value.isAdditional == nil)
        #expect(value.isAfterBarline == nil)
        #expect(value.number == nil)
        #expect(value.position == MXLPosition())
        #expect(value.printsObject == nil)
        #expect(value.size == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLClef(id: "clef1",
                            content: MXLClef.Content(sign: .g),
                            number: MXLStaffNumber(uintValue: 1),
                            isAdditional: true,
                            size: .cue,
                            isAfterBarline: true,
                            position: MXLPosition(defaultX: 10),
                            font: MXLFont(style: .italic),
                            color: MXLColor(stringValue: "#800080"),
                            printsObject: false)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.content == MXLClef.Content(sign: .g))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.id == "clef1")
        #expect(value.isAdditional == true)
        #expect(value.isAfterBarline == true)
        #expect(value.number == MXLStaffNumber(uintValue: 1))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.printsObject == false)
        #expect(value.size == .cue)
    }
}
