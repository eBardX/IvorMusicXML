// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLAccordionMiddleTests {
}

// MARK: -

extension MXLAccordionMiddleTests {
    @Test
    func equality() {
        #expect(MXLAccordionMiddle(uintValue: 2) == MXLAccordionMiddle(uintValue: 2))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLAccordionMiddle(uintValue: 2) != MXLAccordionMiddle(uintValue: 3))
    }

    @Test
    func initUintValue_invalid() {
        #expect(MXLAccordionMiddle(uintValue: 0) == nil)
        #expect(MXLAccordionMiddle(uintValue: 4) == nil)
    }

    @Test
    func initUintValue_valid() {
        let value = MXLAccordionMiddle(uintValue: 2)

        #expect(value?.uintValue == 2)
    }

    @Test
    func isValid() {
        #expect(MXLAccordionMiddle.isValid(1))
        #expect(MXLAccordionMiddle.isValid(3))
        #expect(!MXLAccordionMiddle.isValid(0))
        #expect(!MXLAccordionMiddle.isValid(4))
    }
}
