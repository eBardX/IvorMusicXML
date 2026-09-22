// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBeamLevelTests {
}

// MARK: -

extension MXLBeamLevelTests {
    @Test
    func equality() {
        #expect(MXLBeamLevel(uintValue: 2) == MXLBeamLevel(uintValue: 2))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLBeamLevel(uintValue: 2) != MXLBeamLevel(uintValue: 3))
    }

    @Test
    func initUintValue_invalid() {
        #expect(MXLBeamLevel(uintValue: 0) == nil)
        #expect(MXLBeamLevel(uintValue: 9) == nil)
    }

    @Test
    func initUintValue_valid() {
        let value = MXLBeamLevel(uintValue: 2)

        #expect(value?.uintValue == 2)
    }

    @Test
    func isValid() {
        #expect(MXLBeamLevel.isValid(1))
        #expect(MXLBeamLevel.isValid(8))
        #expect(!MXLBeamLevel.isValid(0))
        #expect(!MXLBeamLevel.isValid(9))
    }
}
