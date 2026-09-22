// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMetronomeNoteTests {
}

// MARK: -

extension MXLMetronomeNoteTests {
    @Test
    func equality() {
        #expect(MXLMetronome.Note(kind: .quarter, dot: 0) == MXLMetronome.Note(kind: .quarter, dot: 0))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLMetronome.Note> = [MXLMetronome.Note(kind: .quarter, dot: 0),
                                              MXLMetronome.Note(kind: .quarter, dot: 0),
                                              MXLMetronome.Note(kind: .eighth, dot: 1)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMetronome.Note(kind: .quarter, dot: 0) != MXLMetronome.Note(kind: .eighth, dot: 1))
    }

    @Test
    func init_defaultValues() {
        let value = MXLMetronome.Note(kind: .quarter, dot: 0)

        #expect(value.beam.isEmpty)
        #expect(value.dot == 0)
        #expect(value.kind == .quarter)
        #expect(value.tied == nil)
        #expect(value.tuplet == nil)
    }

    @Test
    func init_explicitValues() {
        let beam = [MXLMetronome.Note.Beam(value: .begin)]
        let tied = MXLMetronome.Note.Tied(kind: .start)
        let tuplet = MXLMetronome.Note.Tuplet(timeModification: MXLTimeModification(actualNotes: 3, normalNotes: 2), kind: .start)
        let value = MXLMetronome.Note(kind: .eighth, dot: 1, beam: beam, tied: tied, tuplet: tuplet)

        #expect(value.beam == beam)
        #expect(value.dot == 1)
        #expect(value.kind == .eighth)
        #expect(value.tied == tied)
        #expect(value.tuplet == tuplet)
    }
}
