// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOctaveChangeTests {
}

// MARK: -

extension MXLOctaveChangeTests {
    @Test
    func equality() {
        #expect(MXLOctaveChange(intValue: -1) == MXLOctaveChange(intValue: -1))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLOctaveChange(intValue: -1) != MXLOctaveChange(intValue: 1))
    }

    @Test
    func initIntValue_negative() {
        let value = MXLOctaveChange(intValue: -1)

        #expect(value?.intValue == -1)
    }

    @Test
    func initIntValue_positive() {
        let value = MXLOctaveChange(intValue: 1)

        #expect(value?.intValue == 1)
    }
}
