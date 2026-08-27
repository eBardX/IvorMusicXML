// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDiatonicStepsTests {
}

// MARK: -

extension MXLDiatonicStepsTests {
    @Test
    func equality() {
        #expect(MXLDiatonicSteps(intValue: 3) == MXLDiatonicSteps(intValue: 3))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLDiatonicSteps(intValue: 3) != MXLDiatonicSteps(intValue: -3))
    }

    @Test
    func initIntValue_negative() {
        let value = MXLDiatonicSteps(intValue: -3)

        #expect(value?.intValue == -3)
    }

    @Test
    func initIntValue_positive() {
        let value = MXLDiatonicSteps(intValue: 3)

        #expect(value?.intValue == 3)
    }
}
