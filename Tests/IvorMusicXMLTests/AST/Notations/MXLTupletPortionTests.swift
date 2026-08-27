// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTupletPortionTests {
}

// MARK: -

extension MXLTupletPortionTests {
    @Test
    func equality() {
        #expect(MXLTuplet.Portion() == MXLTuplet.Portion())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let number = MXLTuplet.Portion.Number(value: 3)
        let values: Set<MXLTuplet.Portion> = [MXLTuplet.Portion(), MXLTuplet.Portion(), MXLTuplet.Portion(number: number)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let number = MXLTuplet.Portion.Number(value: 3)

        #expect(MXLTuplet.Portion() != MXLTuplet.Portion(number: number))
    }

    @Test
    func init_defaultValues() {
        let value = MXLTuplet.Portion()

        #expect(value.dot.isEmpty)
        #expect(value.kind == nil)
        #expect(value.number == nil)
    }

    @Test
    func init_explicitValues() {
        let number = MXLTuplet.Portion.Number(value: 3)
        let kind = MXLTuplet.Portion.Kind(value: .eighth)
        let dot = [MXLTuplet.Portion.Dot()]
        let value = MXLTuplet.Portion(number: number, kind: kind, dot: dot)

        #expect(value.dot == dot)
        #expect(value.kind == kind)
        #expect(value.number == number)
    }
}
