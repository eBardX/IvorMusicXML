// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHeelToeTests {
}

// MARK: -

extension MXLHeelToeTests {
    @Test
    func equality() {
        #expect(MXLHeelToe() == MXLHeelToe())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLHeelToe> = [MXLHeelToe(), MXLHeelToe(), MXLHeelToe(isSubstitute: true)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHeelToe() != MXLHeelToe(isSubstitute: true))
    }

    @Test
    func init_defaultValues() {
        let value = MXLHeelToe()

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.isSubstitute == false)
    }

    @Test
    func init_explicitValues() {
        let value = MXLHeelToe(position: MXLPosition(defaultX: 10),
                               font: MXLFont(style: .italic),
                               color: MXLColor(stringValue: "#800080"),
                               placement: .above,
                               isSubstitute: true)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.isSubstitute == true)
    }
}
