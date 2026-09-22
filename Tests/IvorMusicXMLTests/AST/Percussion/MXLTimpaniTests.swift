// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTimpaniTests {
}

// MARK: -

extension MXLTimpaniTests {
    @Test
    func equality() {
        #expect(MXLTimpani() == MXLTimpani())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLTimpani> = [MXLTimpani(), MXLTimpani(), MXLTimpani(smufl: MXLSmuflPictogramGlyphName(stringValue: "pictTimpani"))]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTimpani() != MXLTimpani(smufl: MXLSmuflPictogramGlyphName(stringValue: "pictTimpani")))
    }

    @Test
    func init_defaultValues() {
        let value = MXLTimpani()

        #expect(value.smufl == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLTimpani(smufl: MXLSmuflPictogramGlyphName(stringValue: "pictTimpani"))

        #expect(value.smufl == MXLSmuflPictogramGlyphName(stringValue: "pictTimpani"))
    }
}
