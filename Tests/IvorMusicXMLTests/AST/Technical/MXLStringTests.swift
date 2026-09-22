// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStringTests {
}

// MARK: -

extension MXLStringTests {
    @Test
    func equality() {
        #expect(MXLString(value: 1) == MXLString(value: 1))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLString> = [MXLString(value: 1), MXLString(value: 1), MXLString(value: 2)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLString(value: 1) != MXLString(value: 2))
    }

    @Test
    func init_defaultValues() {
        let value = MXLString(value: 1)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.value == 1)
    }

    @Test
    func init_explicitValues() {
        let value = MXLString(value: 2,
                              position: MXLPosition(defaultX: 10),
                              font: MXLFont(style: .italic),
                              color: MXLColor(stringValue: "#800080"),
                              placement: .above)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.value == 2)
    }
}
