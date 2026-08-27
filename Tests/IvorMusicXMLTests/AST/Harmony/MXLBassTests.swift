// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBassTests {
}

// MARK: -

extension MXLBassTests {
    @Test
    func equality() {
        let step = MXLBass.Step(value: .c)

        #expect(MXLBass(step: step) == MXLBass(step: step))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let step = MXLBass.Step(value: .c)
        let otherStep = MXLBass.Step(value: .d)
        let values: Set<MXLBass> = [MXLBass(step: step), MXLBass(step: step), MXLBass(step: otherStep)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let step = MXLBass.Step(value: .c)
        let otherStep = MXLBass.Step(value: .d)

        #expect(MXLBass(step: step) != MXLBass(step: otherStep))
    }

    @Test
    func init_defaultValues() {
        let step = MXLBass.Step(value: .c)
        let value = MXLBass(step: step)

        #expect(value.alter == nil)
        #expect(value.arrangement == nil)
        #expect(value.separator == nil)
        #expect(value.step == step)
    }

    @Test
    func init_explicitValues() {
        let step = MXLBass.Step(value: .d)
        let separator = MXLStyleText(value: "/", printStyle: MXLPrintStyle())
        let alter = MXLHarmonyAlter(value: 1)
        let value = MXLBass(separator: separator, step: step, alter: alter, arrangement: .horizontal)

        #expect(value.alter == alter)
        #expect(value.arrangement == .horizontal)
        #expect(value.separator == separator)
        #expect(value.step == step)
    }
}
