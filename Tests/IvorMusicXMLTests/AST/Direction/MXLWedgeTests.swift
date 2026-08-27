// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLWedgeTests {
}

// MARK: -

extension MXLWedgeTests {
    @Test
    func equality() {
        #expect(MXLWedge(kind: .crescendo) == MXLWedge(kind: .crescendo))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLWedge> = [MXLWedge(kind: .crescendo), MXLWedge(kind: .crescendo), MXLWedge(kind: .diminuendo)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLWedge(kind: .crescendo) != MXLWedge(kind: .diminuendo))
    }

    @Test
    func init_defaultValues() {
        let value = MXLWedge(kind: .crescendo)

        #expect(value.color == nil)
        #expect(value.dashLength == nil)
        #expect(value.id == nil)
        #expect(value.lineKind == nil)
        #expect(value.isNiente == nil)
        #expect(value.number == nil)
        #expect(value.position == MXLPosition())
        #expect(value.spaceLength == nil)
        #expect(value.spread == nil)
        #expect(value.kind == .crescendo)
    }

    @Test
    func init_explicitValues() {
        let value = MXLWedge(id: "w1",
                             kind: .diminuendo,
                             number: MXLNumberLevel(uintValue: 1),
                             spread: 5,
                             isNiente: true,
                             lineKind: .dashed,
                             dashLength: 4,
                             spaceLength: 2,
                             position: MXLPosition(defaultX: 10),
                             color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.dashLength == 4)
        #expect(value.id == "w1")
        #expect(value.lineKind == .dashed)
        #expect(value.isNiente == true)
        #expect(value.number == MXLNumberLevel(uintValue: 1))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.spaceLength == 2)
        #expect(value.spread == 5)
        #expect(value.kind == .diminuendo)
    }
}
