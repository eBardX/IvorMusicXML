// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMeasureTextTests {
}

// MARK: -

extension MXLMeasureTextTests {
    @Test
    func equality() {
        #expect(MXLMeasureText(stringValue: "A") == MXLMeasureText(stringValue: "A"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLMeasureText(stringValue: "A") != MXLMeasureText(stringValue: "B"))
    }

    @Test
    func initStringValue_invalid() {
        #expect(MXLMeasureText(stringValue: "") == nil)
    }

    @Test
    func initStringValue_valid() {
        let value = MXLMeasureText(stringValue: "A")

        #expect(value?.stringValue == "A")
    }
}
