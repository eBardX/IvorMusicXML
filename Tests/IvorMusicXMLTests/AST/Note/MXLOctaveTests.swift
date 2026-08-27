// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOctaveTests {
}

// MARK: -

extension MXLOctaveTests {
    @Test
    func equality() {
        #expect(MXLOctave(uintValue: 4) == MXLOctave(uintValue: 4))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLOctave(uintValue: 4) != MXLOctave(uintValue: 5))
    }

    @Test
    func initUintValue_invalid() {
        #expect(MXLOctave(uintValue: 10) == nil)
    }

    @Test
    func initUintValue_valid() {
        let value = MXLOctave(uintValue: 4)

        #expect(value?.uintValue == 4)
    }

    @Test
    func isValid() {
        #expect(MXLOctave.isValid(0))
        #expect(MXLOctave.isValid(9))
        #expect(!MXLOctave.isValid(10))
    }
}
