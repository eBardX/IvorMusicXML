// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMeasureRepeatTests {
}

// MARK: -

extension MXLMeasureRepeatTests {
    @Test
    func equality() {
        #expect(MXLMeasureRepeat(kind: .start) == MXLMeasureRepeat(kind: .start))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLMeasureRepeat> = [MXLMeasureRepeat(kind: .start),
                                             MXLMeasureRepeat(kind: .start),
                                             MXLMeasureRepeat(kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMeasureRepeat(kind: .start) != MXLMeasureRepeat(kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let value = MXLMeasureRepeat(kind: .start)

        #expect(value.kind == .start)
        #expect(value.slashes == nil)
        #expect(value.value == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLMeasureRepeat(value: 2,
                                     kind: .stop,
                                     slashes: 3)

        #expect(value.kind == .stop)
        #expect(value.slashes == 3)
        #expect(value.value == 2)
    }
}
