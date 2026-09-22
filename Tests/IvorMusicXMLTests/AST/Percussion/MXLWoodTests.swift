// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLWoodTests {
}

// MARK: -

extension MXLWoodTests {
    @Test
    func equality() {
        #expect(MXLWood(value: .claves) == MXLWood(value: .claves))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLWood> = [MXLWood(value: .claves), MXLWood(value: .claves), MXLWood(value: .guiro)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLWood(value: .claves) != MXLWood(value: .guiro))
    }

    @Test
    func init_defaultValues() {
        let value = MXLWood(value: .claves)

        #expect(value.smufl == nil)
        #expect(value.value == .claves)
    }

    @Test
    func init_explicitValues() {
        let value = MXLWood(value: .guiro, smufl: MXLSmuflPictogramGlyphName(stringValue: "pictGuiro"))

        #expect(value.smufl == MXLSmuflPictogramGlyphName(stringValue: "pictGuiro"))
        #expect(value.value == .guiro)
    }
}
