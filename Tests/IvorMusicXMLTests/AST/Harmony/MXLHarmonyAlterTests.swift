// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHarmonyAlterTests {
}

// MARK: -

extension MXLHarmonyAlterTests {
    @Test
    func equality() {
        #expect(MXLHarmonyAlter(value: 1) == MXLHarmonyAlter(value: 1))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLHarmonyAlter> = [MXLHarmonyAlter(value: 1), MXLHarmonyAlter(value: 1), MXLHarmonyAlter(value: -1)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHarmonyAlter(value: 1) != MXLHarmonyAlter(value: -1))
    }

    @Test
    func init_defaultValues() {
        let value = MXLHarmonyAlter(value: 1)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.location == nil)
        #expect(value.position == MXLPosition())
        #expect(value.printsObject == nil)
        #expect(value.value == 1)
    }

    @Test
    func init_explicitValues() {
        let value = MXLHarmonyAlter(value: -1,
                                    printsObject: false,
                                    position: MXLPosition(defaultX: 10),
                                    font: MXLFont(style: .italic),
                                    color: MXLColor(stringValue: "#800080"),
                                    location: .left)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.location == .left)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.printsObject == false)
        #expect(value.value == -1)
    }
}
