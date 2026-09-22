// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMeasureLayoutTests {
}

// MARK: -

extension MXLMeasureLayoutTests {
    @Test
    func equality() {
        #expect(MXLMeasureLayout() == MXLMeasureLayout())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLMeasureLayout> = [MXLMeasureLayout(), MXLMeasureLayout(), MXLMeasureLayout(measureDistance: 20)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMeasureLayout() != MXLMeasureLayout(measureDistance: 20))
    }

    @Test
    func init_defaultValues() {
        let value = MXLMeasureLayout()

        #expect(value.measureDistance == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLMeasureLayout(measureDistance: 20)

        #expect(value.measureDistance == 20)
    }
}
