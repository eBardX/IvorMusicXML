// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDegreeAlterTests {
}

// MARK: -

extension MXLDegreeAlterTests {
    @Test
    func equality() {
        #expect(MXLDegree.Alter(value: 1) == MXLDegree.Alter(value: 1))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLDegree.Alter> = [MXLDegree.Alter(value: 1), MXLDegree.Alter(value: 1), MXLDegree.Alter(value: -1)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLDegree.Alter(value: 1) != MXLDegree.Alter(value: -1))
    }

    @Test
    func init_defaultValues() {
        let value = MXLDegree.Alter(value: 1)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.usesPlusMinus == nil)
        #expect(value.position == MXLPosition())
        #expect(value.value == 1)
    }

    @Test
    func init_explicitValues() {
        let value = MXLDegree.Alter(value: -1,
                                    position: MXLPosition(defaultX: 10),
                                    font: MXLFont(style: .italic),
                                    color: MXLColor(stringValue: "#800080"),
                                    usesPlusMinus: true)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.usesPlusMinus == true)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.value == -1)
    }
}
