// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHoleTests {
}

// MARK: -

extension MXLHoleTests {
    @Test
    func equality() {
        let closed = MXLHole.Closed(value: .yes)

        #expect(MXLHole(closed: closed) == MXLHole(closed: closed))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let closed = MXLHole.Closed(value: .yes)
        let otherClosed = MXLHole.Closed(value: .no)
        let values: Set<MXLHole> = [MXLHole(closed: closed), MXLHole(closed: closed), MXLHole(closed: otherClosed)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let closed = MXLHole.Closed(value: .yes)
        let otherClosed = MXLHole.Closed(value: .no)

        #expect(MXLHole(closed: closed) != MXLHole(closed: otherClosed))
    }

    @Test
    func init_defaultValues() {
        let closed = MXLHole.Closed(value: .yes)
        let value = MXLHole(closed: closed)

        #expect(value.closed == closed)
        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.kind == nil)
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.shape == "circle")
    }

    @Test
    func init_explicitValues() {
        let closed = MXLHole.Closed(value: .half, location: .top)
        let value = MXLHole(kind: "woodwind-open",
                            closed: closed,
                            shape: "square",
                            position: MXLPosition(defaultX: 10),
                            font: MXLFont(style: .italic),
                            color: MXLColor(stringValue: "#800080"),
                            placement: .above)

        #expect(value.closed == closed)
        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.kind == "woodwind-open")
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.shape == "square")
    }
}
