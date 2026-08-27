// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFifthsTests {
}

// MARK: -

extension MXLFifthsTests {
    @Test
    func equality() {
        #expect(MXLFifths(intValue: 2) == MXLFifths(intValue: 2))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLFifths(intValue: 2) != MXLFifths(intValue: -2))
    }

    @Test
    func initIntValue_negative() {
        let value = MXLFifths(intValue: -2)

        #expect(value?.intValue == -2)
    }

    @Test
    func initIntValue_positive() {
        let value = MXLFifths(intValue: 2)

        #expect(value?.intValue == 2)
    }
}
