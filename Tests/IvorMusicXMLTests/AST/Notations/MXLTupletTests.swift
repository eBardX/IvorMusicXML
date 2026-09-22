// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTupletTests {
}

// MARK: -

extension MXLTupletTests {
    @Test
    func equality() {
        #expect(MXLTuplet(kind: .start) == MXLTuplet(kind: .start))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLTuplet> = [MXLTuplet(kind: .start), MXLTuplet(kind: .start), MXLTuplet(kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTuplet(kind: .start) != MXLTuplet(kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let value = MXLTuplet(kind: .start)

        #expect(value.actual == nil)
        #expect(value.hasBracket == nil)
        #expect(value.id == nil)
        #expect(value.kind == .start)
        #expect(value.lineShape == nil)
        #expect(value.normal == nil)
        #expect(value.number == nil)
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.showNumber == nil)
        #expect(value.showType == nil)
    }

    @Test
    func init_explicitValues() {
        let actual = MXLTuplet.Portion(number: MXLTuplet.Portion.Number(value: 3))
        let normal = MXLTuplet.Portion(number: MXLTuplet.Portion.Number(value: 2))
        let value = MXLTuplet(id: "t1",
                              actual: actual,
                              normal: normal,
                              kind: .stop,
                              number: MXLNumberLevel(uintValue: 1),
                              hasBracket: true,
                              showNumber: .both,
                              showType: .actual,
                              lineShape: .curved,
                              position: MXLPosition(defaultX: 10),
                              placement: .above)

        #expect(value.actual == actual)
        #expect(value.hasBracket == true)
        #expect(value.id == "t1")
        #expect(value.kind == .stop)
        #expect(value.lineShape == .curved)
        #expect(value.normal == normal)
        #expect(value.number == MXLNumberLevel(uintValue: 1))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.showNumber == .both)
        #expect(value.showType == .actual)
    }
}
