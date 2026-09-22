// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPedalTuningTests {
}

// MARK: -

extension MXLPedalTuningTests {
    @Test
    func equality() {
        #expect(MXLPedalTuning(pedalStep: .d, pedalAlter: 0) == MXLPedalTuning(pedalStep: .d, pedalAlter: 0))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLPedalTuning> = [MXLPedalTuning(pedalStep: .d, pedalAlter: 0),
                                           MXLPedalTuning(pedalStep: .d, pedalAlter: 0),
                                           MXLPedalTuning(pedalStep: .c, pedalAlter: 1)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPedalTuning(pedalStep: .d, pedalAlter: 0) != MXLPedalTuning(pedalStep: .c, pedalAlter: 1))
    }

    @Test
    func init_values() {
        let value = MXLPedalTuning(pedalStep: .d, pedalAlter: 1)

        #expect(value.pedalAlter == 1)
        #expect(value.pedalStep == .d)
    }
}
