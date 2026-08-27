// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSlurTests {
}

// MARK: -

extension MXLSlurTests {
    @Test
    func equality() {
        #expect(MXLSlur(kind: .start) == MXLSlur(kind: .start))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLSlur> = [MXLSlur(kind: .start), MXLSlur(kind: .start), MXLSlur(kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSlur(kind: .start) != MXLSlur(kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let value = MXLSlur(kind: .start)

        #expect(value.bezierOffset == nil)
        #expect(value.bezierOffset2 == nil)
        #expect(value.bezierX == nil)
        #expect(value.bezierX2 == nil)
        #expect(value.bezierY == nil)
        #expect(value.bezierY2 == nil)
        #expect(value.color == nil)
        #expect(value.dashLength == nil)
        #expect(value.id == nil)
        #expect(value.lineKind == nil)
        #expect(value.number == MXLNumberLevel(uintValue: 1))
        #expect(value.orientation == nil)
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.spaceLength == nil)
        #expect(value.kind == .start)
    }

    @Test
    func init_explicitValues() {
        let value = MXLSlur(id: "sl1",
                            kind: .stop,
                            number: MXLNumberLevel(uintValue: 2),
                            lineKind: .dashed,
                            dashLength: 4,
                            spaceLength: 2,
                            position: MXLPosition(defaultX: 10),
                            placement: .above,
                            orientation: .over,
                            bezierX: 1,
                            bezierY: 2,
                            bezierX2: 3,
                            bezierY2: 4,
                            bezierOffset: MXLDivisions(intValue: 5),
                            bezierOffset2: MXLDivisions(intValue: 6),
                            color: MXLColor(stringValue: "#800080"))

        #expect(value.bezierOffset == MXLDivisions(intValue: 5))
        #expect(value.bezierOffset2 == MXLDivisions(intValue: 6))
        #expect(value.bezierX == 1)
        #expect(value.bezierX2 == 3)
        #expect(value.bezierY == 2)
        #expect(value.bezierY2 == 4)
        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.dashLength == 4)
        #expect(value.id == "sl1")
        #expect(value.lineKind == .dashed)
        #expect(value.number == MXLNumberLevel(uintValue: 2))
        #expect(value.orientation == .over)
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.spaceLength == 2)
        #expect(value.kind == .stop)
    }
}
