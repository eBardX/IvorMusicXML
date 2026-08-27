// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPedalTests {
}

// MARK: -

extension MXLPedalTests {
    @Test
    func equality() {
        #expect(MXLPedal(kind: .start) == MXLPedal(kind: .start))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLPedal> = [MXLPedal(kind: .start), MXLPedal(kind: .start), MXLPedal(kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPedal(kind: .start) != MXLPedal(kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let value = MXLPedal(kind: .start)

        #expect(value.isAbbreviated == nil)
        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.halign == nil)
        #expect(value.id == nil)
        #expect(value.usesLines == nil)
        #expect(value.number == nil)
        #expect(value.position == MXLPosition())
        #expect(value.usesSigns == nil)
        #expect(value.valign == nil)
        #expect(value.kind == .start)
    }

    @Test
    func init_explicitValues() {
        let value = MXLPedal(id: "p1",
                             kind: .stop,
                             number: MXLNumberLevel(uintValue: 1),
                             usesLines: true,
                             usesSigns: true,
                             isAbbreviated: true,
                             position: MXLPosition(defaultX: 10),
                             font: MXLFont(style: .italic),
                             color: MXLColor(stringValue: "#800080"),
                             halign: .center,
                             valign: .middle)

        #expect(value.isAbbreviated == true)
        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.halign == .center)
        #expect(value.id == "p1")
        #expect(value.usesLines == true)
        #expect(value.number == MXLNumberLevel(uintValue: 1))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.usesSigns == true)
        #expect(value.valign == .middle)
        #expect(value.kind == .stop)
    }
}
