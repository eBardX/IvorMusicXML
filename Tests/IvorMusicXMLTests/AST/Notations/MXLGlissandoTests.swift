// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLGlissandoTests {
}

// MARK: -

extension MXLGlissandoTests {
    @Test
    func equality() {
        #expect(MXLGlissando(value: "gliss.", kind: .start) == MXLGlissando(value: "gliss.", kind: .start))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLGlissando> = [MXLGlissando(value: "gliss.", kind: .start),
                                         MXLGlissando(value: "gliss.", kind: .start),
                                         MXLGlissando(value: "gliss.", kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLGlissando(value: "gliss.", kind: .start) != MXLGlissando(value: "gliss.", kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let value = MXLGlissando(value: "gliss.", kind: .start)

        #expect(value.color == nil)
        #expect(value.dashLength == nil)
        #expect(value.font == MXLFont())
        #expect(value.id == nil)
        #expect(value.lineKind == nil)
        #expect(value.number == MXLNumberLevel(uintValue: 1))
        #expect(value.position == MXLPosition())
        #expect(value.spaceLength == nil)
        #expect(value.kind == .start)
        #expect(value.value == "gliss.")
    }

    @Test
    func init_explicitValues() {
        let value = MXLGlissando(id: "g1",
                                 value: "gliss.",
                                 kind: .stop,
                                 number: MXLNumberLevel(uintValue: 2),
                                 lineKind: .dashed,
                                 dashLength: 4,
                                 spaceLength: 2,
                                 position: MXLPosition(defaultX: 10),
                                 font: MXLFont(style: .italic),
                                 color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.dashLength == 4)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.id == "g1")
        #expect(value.lineKind == .dashed)
        #expect(value.number == MXLNumberLevel(uintValue: 2))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.spaceLength == 2)
        #expect(value.kind == .stop)
        #expect(value.value == "gliss.")
    }
}
