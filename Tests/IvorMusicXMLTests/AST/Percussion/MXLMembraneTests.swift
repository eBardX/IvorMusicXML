// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMembraneTests {
}

// MARK: -

extension MXLMembraneTests {
    @Test
    func equality() {
        #expect(MXLMembrane(value: .bassDrum) == MXLMembrane(value: .bassDrum))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLMembrane> = [MXLMembrane(value: .bassDrum), MXLMembrane(value: .bassDrum), MXLMembrane(value: .tambourine)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMembrane(value: .bassDrum) != MXLMembrane(value: .tambourine))
    }

    @Test
    func init_defaultValues() {
        let value = MXLMembrane(value: .bassDrum)

        #expect(value.smufl == nil)
        #expect(value.value == .bassDrum)
    }

    @Test
    func init_explicitValues() {
        let value = MXLMembrane(value: .tambourine, smufl: MXLSmuflPictogramGlyphName(stringValue: "pictTambourine"))

        #expect(value.smufl == MXLSmuflPictogramGlyphName(stringValue: "pictTambourine"))
        #expect(value.value == .tambourine)
    }
}
