// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOtherTextTests {
}

// MARK: -

extension MXLOtherTextTests {
    @Test
    func equality() {
        #expect(MXLOtherText(value: "custom") == MXLOtherText(value: "custom"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let smufl = MXLSmuflGlyphName(stringValue: "noteheadBlack")
        let values: Set<MXLOtherText> = [MXLOtherText(value: "custom"),
                                         MXLOtherText(value: "custom"),
                                         MXLOtherText(value: "custom", smufl: smufl)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let smufl = MXLSmuflGlyphName(stringValue: "noteheadBlack")

        #expect(MXLOtherText(value: "custom") != MXLOtherText(value: "custom", smufl: smufl))
    }

    @Test
    func init_defaultValues() {
        let value = MXLOtherText(value: "custom")

        #expect(value.smufl == nil)
        #expect(value.value == "custom")
    }

    @Test
    func init_explicitValues() {
        let smufl = MXLSmuflGlyphName(stringValue: "noteheadBlack")
        let value = MXLOtherText(value: "custom",
                                 smufl: smufl)

        #expect(value.smufl == smufl)
        #expect(value.value == "custom")
    }
}
