// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDivisionsTests {
}

// MARK: -

extension MXLDivisionsTests {
    @Test
    func equality() {
        #expect(MXLDivisions(intValue: 2) == MXLDivisions(intValue: 2))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLDivisions(intValue: 2) != MXLDivisions(intValue: 4))
    }

    @Test
    func initIntValue() {
        let value = MXLDivisions(intValue: 2)

        #expect(value?.intValue == 2)
    }

    @Test
    func initIntValue_zero() {
        let value = MXLDivisions(intValue: 0)

        #expect(value?.intValue == 0)
    }
}
