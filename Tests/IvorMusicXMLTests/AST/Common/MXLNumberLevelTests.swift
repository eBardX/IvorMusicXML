// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNumberLevelTests {
}

// MARK: -

extension MXLNumberLevelTests {
    @Test
    func equality() {
        #expect(MXLNumberLevel(uintValue: 3) == MXLNumberLevel(uintValue: 3))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLNumberLevel(uintValue: 3) != MXLNumberLevel(uintValue: 4))
    }

    @Test
    func initUintValue_invalid() {
        #expect(MXLNumberLevel(uintValue: 0) == nil)
        #expect(MXLNumberLevel(uintValue: 17) == nil)
    }

    @Test
    func initUintValue_valid() {
        let value = MXLNumberLevel(uintValue: 3)

        #expect(value?.uintValue == 3)
    }

    @Test
    func isValid() {
        #expect(MXLNumberLevel.isValid(1))
        #expect(MXLNumberLevel.isValid(16))
        #expect(!MXLNumberLevel.isValid(0))
        #expect(!MXLNumberLevel.isValid(17))
    }
}
