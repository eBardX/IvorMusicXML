// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBracketTests {
}

// MARK: -

extension MXLBracketTests {
    @Test
    func equality() {
        #expect(MXLBracket(kind: .start, lineEnd: .down) == MXLBracket(kind: .start, lineEnd: .down))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLBracket> = [MXLBracket(kind: .start, lineEnd: .down),
                                       MXLBracket(kind: .start, lineEnd: .down),
                                       MXLBracket(kind: .stop, lineEnd: .up)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBracket(kind: .start, lineEnd: .down) != MXLBracket(kind: .stop, lineEnd: .up))
    }

    @Test
    func init_defaultValues() {
        let value = MXLBracket(kind: .start, lineEnd: .down)

        #expect(value.color == nil)
        #expect(value.dashLength == nil)
        #expect(value.endLength == nil)
        #expect(value.id == nil)
        #expect(value.lineEnd == .down)
        #expect(value.lineKind == nil)
        #expect(value.number == nil)
        #expect(value.position == MXLPosition())
        #expect(value.spaceLength == nil)
        #expect(value.kind == .start)
    }

    @Test
    func init_explicitValues() {
        let value = MXLBracket(id: "b1",
                               kind: .stop,
                               number: MXLNumberLevel(uintValue: 1),
                               lineEnd: .arrow,
                               endLength: 10,
                               lineKind: .dashed,
                               dashLength: 4,
                               spaceLength: 2,
                               position: MXLPosition(defaultX: 10),
                               color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.dashLength == 4)
        #expect(value.endLength == 10)
        #expect(value.id == "b1")
        #expect(value.lineEnd == .arrow)
        #expect(value.lineKind == .dashed)
        #expect(value.number == MXLNumberLevel(uintValue: 1))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.spaceLength == 2)
        #expect(value.kind == .stop)
    }
}
