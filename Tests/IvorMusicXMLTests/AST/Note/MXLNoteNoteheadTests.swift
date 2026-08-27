// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNoteNoteheadTests {
}

// MARK: -

extension MXLNoteNoteheadTests {
    @Test
    func equality() {
        #expect(MXLNote.Notehead(value: .normal) == MXLNote.Notehead(value: .normal))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLNote.Notehead> = [MXLNote.Notehead(value: .normal), MXLNote.Notehead(value: .normal), MXLNote.Notehead(value: .diamond)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLNote.Notehead(value: .normal) != MXLNote.Notehead(value: .diamond))
    }

    @Test
    func init_defaultValues() {
        let value = MXLNote.Notehead(value: .normal)

        #expect(value.color == nil)
        #expect(value.isFilled == nil)
        #expect(value.font == MXLFont())
        #expect(value.hasParentheses == false)
        #expect(value.smufl == nil)
        #expect(value.value == .normal)
    }

    @Test
    func init_explicitValues() {
        let value = MXLNote.Notehead(value: .diamond,
                                     isFilled: true,
                                     hasParentheses: true,
                                     font: MXLFont(style: .italic),
                                     color: MXLColor(stringValue: "#800080"),
                                     smufl: MXLSmuflGlyphName(stringValue: "noteheadDiamondBlack"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.isFilled == true)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.hasParentheses == true)
        #expect(value.smufl == MXLSmuflGlyphName(stringValue: "noteheadDiamondBlack"))
        #expect(value.value == .diamond)
    }
}
