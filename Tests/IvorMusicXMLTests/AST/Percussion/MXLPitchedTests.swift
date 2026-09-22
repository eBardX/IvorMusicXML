// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPitchedTests {
}

// MARK: -

extension MXLPitchedTests {
    @Test
    func equality() {
        #expect(MXLPitched(value: .marimba) == MXLPitched(value: .marimba))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLPitched> = [MXLPitched(value: .marimba), MXLPitched(value: .marimba), MXLPitched(value: .xylophone)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPitched(value: .marimba) != MXLPitched(value: .xylophone))
    }

    @Test
    func init_defaultValues() {
        let value = MXLPitched(value: .marimba)

        #expect(value.smufl == nil)
        #expect(value.value == .marimba)
    }

    @Test
    func init_explicitValues() {
        let value = MXLPitched(value: .xylophone, smufl: MXLSmuflPictogramGlyphName(stringValue: "pictXylophone"))

        #expect(value.smufl == MXLSmuflPictogramGlyphName(stringValue: "pictXylophone"))
        #expect(value.value == .xylophone)
    }
}
