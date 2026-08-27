// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOctaveShiftTests {
}

// MARK: -

extension MXLOctaveShiftTests {
    @Test
    func equality() {
        #expect(MXLOctaveShift(kind: .up) == MXLOctaveShift(kind: .up))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLOctaveShift> = [MXLOctaveShift(kind: .up), MXLOctaveShift(kind: .up), MXLOctaveShift(kind: .down)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLOctaveShift(kind: .up) != MXLOctaveShift(kind: .down))
    }

    @Test
    func init_defaultValues() {
        let value = MXLOctaveShift(kind: .up)

        #expect(value.color == nil)
        #expect(value.dashLength == nil)
        #expect(value.font == MXLFont())
        #expect(value.id == nil)
        #expect(value.number == nil)
        #expect(value.position == MXLPosition())
        #expect(value.size == 8)
        #expect(value.spaceLength == nil)
        #expect(value.kind == .up)
    }

    @Test
    func init_explicitValues() {
        let value = MXLOctaveShift(id: "o1",
                                   kind: .down,
                                   number: MXLNumberLevel(uintValue: 1),
                                   size: 15,
                                   dashLength: 4,
                                   spaceLength: 2,
                                   position: MXLPosition(defaultX: 10),
                                   font: MXLFont(style: .italic),
                                   color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.dashLength == 4)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.id == "o1")
        #expect(value.number == MXLNumberLevel(uintValue: 1))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.size == 15)
        #expect(value.spaceLength == 2)
        #expect(value.kind == .down)
    }
}
