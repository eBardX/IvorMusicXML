// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLEffectTests {
}

// MARK: -

extension MXLEffectTests {
    @Test
    func equality() {
        #expect(MXLEffect(value: .anvil) == MXLEffect(value: .anvil))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLEffect> = [MXLEffect(value: .anvil), MXLEffect(value: .anvil), MXLEffect(value: .siren)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLEffect(value: .anvil) != MXLEffect(value: .siren))
    }

    @Test
    func init_defaultValues() {
        let value = MXLEffect(value: .anvil)

        #expect(value.smufl == nil)
        #expect(value.value == .anvil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLEffect(value: .siren, smufl: MXLSmuflPictogramGlyphName(stringValue: "pictSiren"))

        #expect(value.smufl == MXLSmuflPictogramGlyphName(stringValue: "pictSiren"))
        #expect(value.value == .siren)
    }
}
