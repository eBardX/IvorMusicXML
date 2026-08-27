// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDashesTests {
}

// MARK: -

extension MXLDashesTests {
    @Test
    func equality() {
        #expect(MXLDashes(kind: .start) == MXLDashes(kind: .start))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLDashes> = [MXLDashes(kind: .start), MXLDashes(kind: .start), MXLDashes(kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLDashes(kind: .start) != MXLDashes(kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let value = MXLDashes(kind: .start)

        #expect(value.color == nil)
        #expect(value.dashLength == nil)
        #expect(value.id == nil)
        #expect(value.number == nil)
        #expect(value.position == MXLPosition())
        #expect(value.spaceLength == nil)
        #expect(value.kind == .start)
    }

    @Test
    func init_explicitValues() {
        let value = MXLDashes(id: "d1",
                              kind: .stop,
                              number: MXLNumberLevel(uintValue: 1),
                              dashLength: 4,
                              spaceLength: 2,
                              position: MXLPosition(defaultX: 10),
                              color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.dashLength == 4)
        #expect(value.id == "d1")
        #expect(value.number == MXLNumberLevel(uintValue: 1))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.spaceLength == 2)
        #expect(value.kind == .stop)
    }
}
