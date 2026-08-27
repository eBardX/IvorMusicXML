// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPrintStyleTests {
}

// MARK: -

extension MXLPrintStyleTests {
    @Test
    func equality() {
        #expect(MXLPrintStyle(color: MXLColor(stringValue: "#800080")) ==    // swiftlint:disable:this identical_operands
                 MXLPrintStyle(color: MXLColor(stringValue: "#800080")))
    }

    @Test
    func hashable() {
        let values: Set<MXLPrintStyle> = [MXLPrintStyle(color: MXLColor(stringValue: "#800080")),
                                          MXLPrintStyle(color: MXLColor(stringValue: "#800080")),
                                          MXLPrintStyle()]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPrintStyle(color: MXLColor(stringValue: "#800080")) != MXLPrintStyle())
    }

    @Test
    func init_defaultValues() {
        let value = MXLPrintStyle()

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.position == MXLPosition())
    }

    @Test
    func init_explicitValues() {
        let position = MXLPosition(defaultX: 10)
        let font = MXLFont(style: .italic)
        let color = MXLColor(stringValue: "#800080")
        let value = MXLPrintStyle(position: position,
                                  font: font,
                                  color: color)

        #expect(value.color == color)
        #expect(value.font == font)
        #expect(value.position == position)
    }
}
