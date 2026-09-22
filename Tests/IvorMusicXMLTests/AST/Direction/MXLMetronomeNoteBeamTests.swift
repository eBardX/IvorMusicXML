// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMetronomeNoteBeamTests {
}

// MARK: -

extension MXLMetronomeNoteBeamTests {
    @Test
    func equality() {
        #expect(MXLMetronome.Note.Beam(value: .begin) == MXLMetronome.Note.Beam(value: .begin))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLMetronome.Note.Beam> = [MXLMetronome.Note.Beam(value: .begin),
                                                   MXLMetronome.Note.Beam(value: .begin),
                                                   MXLMetronome.Note.Beam(value: .end)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMetronome.Note.Beam(value: .begin) != MXLMetronome.Note.Beam(value: .end))
    }

    @Test
    func init_defaultValues() {
        let value = MXLMetronome.Note.Beam(value: .begin)

        #expect(value.number == MXLBeamLevel(uintValue: 1))
        #expect(value.value == .begin)
    }

    @Test
    func init_explicitValues() {
        let value = MXLMetronome.Note.Beam(value: .end, number: MXLBeamLevel(uintValue: 2))

        #expect(value.number == MXLBeamLevel(uintValue: 2))
        #expect(value.value == .end)
    }
}
