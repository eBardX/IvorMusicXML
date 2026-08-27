// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLCaesuraTests {
}

// MARK: -

extension MXLCaesuraTests {
    @Test
    func equality() {
        #expect(MXLCaesura(value: .normal) == MXLCaesura(value: .normal))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLCaesura> = [MXLCaesura(value: .normal), MXLCaesura(value: .normal), MXLCaesura(value: .curved)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLCaesura(value: .normal) != MXLCaesura(value: .curved))
    }

    @Test
    func init_defaultValues() {
        let value = MXLCaesura(value: .normal)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.value == .normal)
    }

    @Test
    func init_explicitValues() {
        let value = MXLCaesura(value: .curved,
                               position: MXLPosition(defaultX: 10),
                               font: MXLFont(style: .italic),
                               color: MXLColor(stringValue: "#800080"),
                               placement: .above)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.value == .curved)
    }
}
