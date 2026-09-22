// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFermataTests {
}

// MARK: -

extension MXLFermataTests {
    @Test
    func equality() {
        #expect(MXLFermata(value: .normal) == MXLFermata(value: .normal))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLFermata> = [MXLFermata(value: .normal), MXLFermata(value: .normal), MXLFermata(value: .angled)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLFermata(value: .normal) != MXLFermata(value: .angled))
    }

    @Test
    func init_defaultValues() {
        let value = MXLFermata(value: .normal)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.id == nil)
        #expect(value.position == MXLPosition())
        #expect(value.kind == .upright)
        #expect(value.value == .normal)
    }

    @Test
    func init_explicitValues() {
        let value = MXLFermata(id: "f1",
                               value: .angled,
                               kind: .inverted,
                               position: MXLPosition(defaultX: 10),
                               font: MXLFont(style: .italic),
                               color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.id == "f1")
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.kind == .inverted)
        #expect(value.value == .angled)
    }
}
