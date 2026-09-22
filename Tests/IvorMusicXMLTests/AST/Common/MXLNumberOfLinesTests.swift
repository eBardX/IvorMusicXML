// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNumberOfLinesTests {
}

// MARK: -

extension MXLNumberOfLinesTests {
    @Test
    func equality() {
        #expect(MXLNumberOfLines(uintValue: 2) == MXLNumberOfLines(uintValue: 2))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLNumberOfLines(uintValue: 2) != MXLNumberOfLines(uintValue: 3))
    }

    @Test
    func initUintValue_invalid() {
        #expect(MXLNumberOfLines(uintValue: 4) == nil)
    }

    @Test
    func initUintValue_valid() {
        let value = MXLNumberOfLines(uintValue: 2)

        #expect(value?.uintValue == 2)
    }

    @Test
    func isValid() {
        #expect(MXLNumberOfLines.isValid(0))
        #expect(MXLNumberOfLines.isValid(3))
        #expect(!MXLNumberOfLines.isValid(4))
    }
}
