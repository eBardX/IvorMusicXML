// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPositiveDivisionsTests {
}

// MARK: -

extension MXLPositiveDivisionsTests {
    @Test
    func equality() {
        #expect(MXLPositiveDivisions(intValue: 4) == MXLPositiveDivisions(intValue: 4))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLPositiveDivisions(intValue: 4) != MXLPositiveDivisions(intValue: 8))
    }

    @Test
    func initIntValue_invalid() {
        #expect(MXLPositiveDivisions(intValue: 0) == nil)
        #expect(MXLPositiveDivisions(intValue: -1) == nil)
    }

    @Test
    func initIntValue_valid() {
        let value = MXLPositiveDivisions(intValue: 4)

        #expect(value?.intValue == 4)
    }

    @Test
    func isValid() {
        #expect(MXLPositiveDivisions.isValid(1))
        #expect(!MXLPositiveDivisions.isValid(0))
        #expect(!MXLPositiveDivisions.isValid(-1))
    }
}
