// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLColorTests {
}

// MARK: -

extension MXLColorTests {
    @Test
    func equality() {
        #expect(MXLColor(stringValue: "#800080") == MXLColor(stringValue: "#800080"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func inequality() {
        #expect(MXLColor(stringValue: "#800080") != MXLColor(stringValue: "#40800080"))
    }

    @Test
    func initStringValue_invalid() {
        #expect(MXLColor(stringValue: "800080") == nil)
        #expect(MXLColor(stringValue: "#80008") == nil)
        #expect(MXLColor(stringValue: "#80008G") == nil)
    }

    @Test
    func initStringValue_valid() {
        let rgb = MXLColor(stringValue: "#800080")
        let argb = MXLColor(stringValue: "#40800080")

        #expect(rgb?.stringValue == "#800080")
        #expect(argb?.stringValue == "#40800080")
    }

    @Test
    func isValid() {
        #expect(MXLColor.isValid("#800080"))
        #expect(MXLColor.isValid("#40800080"))
        #expect(!MXLColor.isValid("800080"))
        #expect(!MXLColor.isValid("#80008"))
    }
}
