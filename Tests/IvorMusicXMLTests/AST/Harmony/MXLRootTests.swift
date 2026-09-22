// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLRootTests {
}

// MARK: -

extension MXLRootTests {
    @Test
    func equality() {
        #expect(MXLRoot(step: MXLRoot.Step(value: .c)) == MXLRoot(step: MXLRoot.Step(value: .c)))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLRoot> = [MXLRoot(step: MXLRoot.Step(value: .c)),
                                    MXLRoot(step: MXLRoot.Step(value: .c)),
                                    MXLRoot(step: MXLRoot.Step(value: .d))]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLRoot(step: MXLRoot.Step(value: .c)) != MXLRoot(step: MXLRoot.Step(value: .d)))
    }

    @Test
    func init_defaultValues() {
        let step = MXLRoot.Step(value: .c)
        let value = MXLRoot(step: step)

        #expect(value.alter == nil)
        #expect(value.step == step)
    }

    @Test
    func init_explicitValues() {
        let step = MXLRoot.Step(value: .d)
        let alter = MXLHarmonyAlter(value: 1)
        let value = MXLRoot(step: step, alter: alter)

        #expect(value.alter == alter)
        #expect(value.step == step)
    }
}
