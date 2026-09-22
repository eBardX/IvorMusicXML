// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDynamicsTests {
}

// MARK: -

extension MXLDynamicsTests {
    @Test
    func equality() {
        #expect(MXLDynamics(items: [.f]) == MXLDynamics(items: [.f]))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLDynamics> = [MXLDynamics(items: [.f]), MXLDynamics(items: [.f]), MXLDynamics(items: [.ff])]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLDynamics(items: [.f]) != MXLDynamics(items: [.ff]))
    }

    @Test
    func init_defaultValues() {
        let value = MXLDynamics()

        #expect(value.color == nil)
        #expect(value.enclosure == nil)
        #expect(value.font == MXLFont())
        #expect(value.halign == nil)
        #expect(value.id == nil)
        #expect(value.items.isEmpty)
        #expect(value.lineThrough == nil)
        #expect(value.overline == nil)
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.underline == nil)
        #expect(value.valign == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLDynamics(id: "dy1",
                                items: [.f, .ff],
                                position: MXLPosition(defaultX: 10),
                                font: MXLFont(style: .italic),
                                color: MXLColor(stringValue: "#800080"),
                                halign: .center,
                                valign: .middle,
                                placement: .above,
                                underline: MXLNumberOfLines(uintValue: 1),
                                overline: MXLNumberOfLines(uintValue: 2),
                                lineThrough: MXLNumberOfLines(uintValue: 3),
                                enclosure: .circle)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.enclosure == .circle)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.halign == .center)
        #expect(value.id == "dy1")
        #expect(value.items == [.f, .ff])
        #expect(value.lineThrough == MXLNumberOfLines(uintValue: 3))
        #expect(value.overline == MXLNumberOfLines(uintValue: 2))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.underline == MXLNumberOfLines(uintValue: 1))
        #expect(value.valign == .middle)
    }
}
