// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTapTests {
}

// MARK: -

extension MXLTapTests {
    @Test
    func equality() {
        #expect(MXLTap(value: "T") == MXLTap(value: "T"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLTap> = [MXLTap(value: "T"), MXLTap(value: "T"), MXLTap(value: "+")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTap(value: "T") != MXLTap(value: "+"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLTap(value: "T")

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.hand == nil)
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.value == "T")
    }

    @Test
    func init_explicitValues() {
        let value = MXLTap(value: "",
                           hand: .left,
                           position: MXLPosition(defaultX: 10),
                           font: MXLFont(style: .italic),
                           color: MXLColor(stringValue: "#800080"),
                           placement: .above)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.hand == .left)
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.value.isEmpty)
    }
}
