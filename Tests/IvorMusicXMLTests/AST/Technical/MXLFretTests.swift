// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFretTests {
}

// MARK: -

extension MXLFretTests {
    @Test
    func equality() {
        #expect(MXLFret(value: 3) == MXLFret(value: 3))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLFret> = [MXLFret(value: 3), MXLFret(value: 3), MXLFret(value: 5)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLFret(value: 3) != MXLFret(value: 5))
    }

    @Test
    func init_defaultValues() {
        let value = MXLFret(value: 3)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.value == 3)
    }

    @Test
    func init_explicitValues() {
        let value = MXLFret(value: 5, font: MXLFont(style: .italic), color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.value == 5)
    }
}
