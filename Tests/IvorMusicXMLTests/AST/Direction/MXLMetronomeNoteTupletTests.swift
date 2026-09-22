// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMetronomeNoteTupletTests {
}

// MARK: -

extension MXLMetronomeNoteTupletTests {
    @Test
    func equality() {
        let timeModification = MXLTimeModification(actualNotes: 3, normalNotes: 2)

        #expect(MXLMetronome.Note.Tuplet(timeModification: timeModification, kind: .start) ==    // swiftlint:disable:this identical_operands
                 MXLMetronome.Note.Tuplet(timeModification: timeModification, kind: .start))
    }

    @Test
    func hashable() {
        let timeModification = MXLTimeModification(actualNotes: 3, normalNotes: 2)
        let values: Set<MXLMetronome.Note.Tuplet> = [MXLMetronome.Note.Tuplet(timeModification: timeModification, kind: .start),
                                                     MXLMetronome.Note.Tuplet(timeModification: timeModification, kind: .start),
                                                     MXLMetronome.Note.Tuplet(timeModification: timeModification, kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let timeModification = MXLTimeModification(actualNotes: 3, normalNotes: 2)

        #expect(MXLMetronome.Note.Tuplet(timeModification: timeModification, kind: .start) !=
                 MXLMetronome.Note.Tuplet(timeModification: timeModification, kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let timeModification = MXLTimeModification(actualNotes: 3, normalNotes: 2)
        let value = MXLMetronome.Note.Tuplet(timeModification: timeModification, kind: .start)

        #expect(value.hasBracket == nil)
        #expect(value.showNumber == nil)
        #expect(value.timeModification == timeModification)
        #expect(value.kind == .start)
    }

    @Test
    func init_explicitValues() {
        let timeModification = MXLTimeModification(actualNotes: 3, normalNotes: 2)
        let value = MXLMetronome.Note.Tuplet(timeModification: timeModification,
                                             kind: .stop,
                                             hasBracket: true,
                                             showNumber: .actual)

        #expect(value.hasBracket == true)
        #expect(value.showNumber == .actual)
        #expect(value.timeModification == timeModification)
        #expect(value.kind == .stop)
    }
}
