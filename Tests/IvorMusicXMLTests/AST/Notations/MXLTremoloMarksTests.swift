// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTremoloMarksTests {
}

// MARK: -

extension MXLTremoloMarksTests {
    @Test
    func equality() {
        #expect(MXLTremoloMarks(uintValue: 2) == MXLTremoloMarks(uintValue: 2))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLTremoloMarks(uintValue: 2) != MXLTremoloMarks(uintValue: 3))
    }

    @Test
    func initUintValue_invalid() {
        #expect(MXLTremoloMarks(uintValue: 9) == nil)
    }

    @Test
    func initUintValue_valid() {
        let value = MXLTremoloMarks(uintValue: 2)

        #expect(value?.uintValue == 2)
    }

    @Test
    func isValid() {
        #expect(MXLTremoloMarks.isValid(0))
        #expect(MXLTremoloMarks.isValid(8))
        #expect(!MXLTremoloMarks.isValid(9))
    }
}
