// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFrameNoteTests {
}

// MARK: -

extension MXLFrameNoteTests {
    @Test
    func equality() {
        #expect(MXLFrame.Note(string: MXLString(value: 1), fret: MXLFret(value: 0)) ==    // swiftlint:disable:this identical_operands
                 MXLFrame.Note(string: MXLString(value: 1), fret: MXLFret(value: 0)))
    }

    @Test
    func hashable() {
        let values: Set<MXLFrame.Note> = [MXLFrame.Note(string: MXLString(value: 1), fret: MXLFret(value: 0)),
                                          MXLFrame.Note(string: MXLString(value: 1), fret: MXLFret(value: 0)),
                                          MXLFrame.Note(string: MXLString(value: 2), fret: MXLFret(value: 2))]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLFrame.Note(string: MXLString(value: 1), fret: MXLFret(value: 0)) !=
                 MXLFrame.Note(string: MXLString(value: 2), fret: MXLFret(value: 2)))
    }

    @Test
    func init_defaultValues() {
        let value = MXLFrame.Note(string: MXLString(value: 1), fret: MXLFret(value: 0))

        #expect(value.barre == nil)
        #expect(value.fingering == nil)
        #expect(value.fret == MXLFret(value: 0))
        #expect(value.string == MXLString(value: 1))
    }

    @Test
    func init_explicitValues() {
        let fingering = MXLFingering(value: "1")
        let barre = MXLBarre(kind: .start)
        let value = MXLFrame.Note(string: MXLString(value: 2), fret: MXLFret(value: 2), fingering: fingering, barre: barre)

        #expect(value.barre == barre)
        #expect(value.fingering == fingering)
        #expect(value.fret == MXLFret(value: 2))
        #expect(value.string == MXLString(value: 2))
    }
}
