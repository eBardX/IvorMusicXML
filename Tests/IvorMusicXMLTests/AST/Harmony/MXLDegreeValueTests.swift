// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDegreeValueTests {
}

// MARK: -

extension MXLDegreeValueTests {
    @Test
    func equality() {
        #expect(MXLDegree.Value(value: 3) == MXLDegree.Value(value: 3))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLDegree.Value> = [MXLDegree.Value(value: 3), MXLDegree.Value(value: 3), MXLDegree.Value(value: 5)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLDegree.Value(value: 3) != MXLDegree.Value(value: 5))
    }

    @Test
    func init_defaultValues() {
        let value = MXLDegree.Value(value: 3)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.position == MXLPosition())
        #expect(value.symbol == nil)
        #expect(value.text == nil)
        #expect(value.value == 3)
    }

    @Test
    func init_explicitValues() {
        let value = MXLDegree.Value(value: 5,
                                    symbol: .major,
                                    text: "5",
                                    position: MXLPosition(defaultX: 10),
                                    font: MXLFont(style: .italic),
                                    color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.symbol == .major)
        #expect(value.text == "5")
        #expect(value.value == 5)
    }
}
