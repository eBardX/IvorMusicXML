// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDegreeKindTests {
}

// MARK: -

extension MXLDegreeKindTests {
    @Test
    func equality() {
        #expect(MXLDegree.Kind(value: .add) == MXLDegree.Kind(value: .add))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLDegree.Kind> = [MXLDegree.Kind(value: .add), MXLDegree.Kind(value: .add), MXLDegree.Kind(value: .alter)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLDegree.Kind(value: .add) != MXLDegree.Kind(value: .alter))
    }

    @Test
    func init_defaultValues() {
        let value = MXLDegree.Kind(value: .add)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.position == MXLPosition())
        #expect(value.text == nil)
        #expect(value.value == .add)
    }

    @Test
    func init_explicitValues() {
        let value = MXLDegree.Kind(value: .alter,
                                   text: "alt",
                                   position: MXLPosition(defaultX: 10),
                                   font: MXLFont(style: .italic),
                                   color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.text == "alt")
        #expect(value.value == .alter)
    }
}
