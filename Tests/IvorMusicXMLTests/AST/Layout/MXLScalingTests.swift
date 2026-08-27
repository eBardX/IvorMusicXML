// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLScalingTests {
}

// MARK: -

extension MXLScalingTests {
    @Test
    func equality() {
        #expect(MXLScaling(millimeters: 7.2, tenths: 40) == MXLScaling(millimeters: 7.2, tenths: 40))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLScaling> = [MXLScaling(millimeters: 7.2, tenths: 40),
                                       MXLScaling(millimeters: 7.2, tenths: 40),
                                       MXLScaling(millimeters: 6.5, tenths: 40)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLScaling(millimeters: 7.2, tenths: 40) != MXLScaling(millimeters: 6.5, tenths: 40))
    }

    @Test
    func init_values() {
        let value = MXLScaling(millimeters: 7.2, tenths: 40)

        #expect(value.millimeters == 7.2)
        #expect(value.tenths == 40)
    }
}
