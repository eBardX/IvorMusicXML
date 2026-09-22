// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMillisecondsTests {
}

// MARK: -

extension MXLMillisecondsTests {
    @Test
    func equality() {
        #expect(MXLMilliseconds(uintValue: 500) == MXLMilliseconds(uintValue: 500))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLMilliseconds(uintValue: 500) != MXLMilliseconds(uintValue: 250))
    }

    @Test
    func initUintValue() {
        let value = MXLMilliseconds(uintValue: 500)

        #expect(value?.uintValue == 500)
    }

    @Test
    func initUintValue_zero() {
        let value = MXLMilliseconds(uintValue: 0)

        #expect(value?.uintValue == 0)
    }
}
