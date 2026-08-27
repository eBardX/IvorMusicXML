// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLInversionTests {
}

// MARK: -

extension MXLInversionTests {
    @Test
    func equality() {
        #expect(MXLInversion(value: 1) == MXLInversion(value: 1))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLInversion> = [MXLInversion(value: 1), MXLInversion(value: 1), MXLInversion(value: 2)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLInversion(value: 1) != MXLInversion(value: 2))
    }

    @Test
    func init_defaultValues() {
        let value = MXLInversion(value: 1)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.position == MXLPosition())
        #expect(value.text == nil)
        #expect(value.value == 1)
    }

    @Test
    func init_explicitValues() {
        let value = MXLInversion(value: 2,
                                 text: "2nd",
                                 position: MXLPosition(defaultX: 10),
                                 font: MXLFont(style: .italic),
                                 color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.text == "2nd")
        #expect(value.value == 2)
    }
}
