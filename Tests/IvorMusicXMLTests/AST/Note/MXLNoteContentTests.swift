// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNoteContentTests {
}

// MARK: -

extension MXLNoteContentTests {
    @Test
    func equality() {
        let fullNote = MXLFullNote(isChord: false, content: .rest(MXLRest()))
        let grace = MXLGrace()

        #expect(MXLNote.Content.graceNote(fullNote: fullNote, grace: grace, tie: []) ==
                 .graceNote(fullNote: fullNote, grace: grace, tie: []))
    }

    @Test
    func hashable() {
        let fullNote = MXLFullNote(isChord: false, content: .rest(MXLRest()))
        let graceNoteCue = MXLNote.Content.graceNoteCue(fullNote: fullNote, grace: MXLGrace())
        let regularNoteCue = MXLNote.Content.regularNoteCue(fullNote: fullNote, duration: MXLPositiveDivisions(intValue: 4)!)    // swiftlint:disable:this force_unwrapping line_length
        let values: Set<MXLNote.Content> = [graceNoteCue, graceNoteCue, regularNoteCue]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let fullNote = MXLFullNote(isChord: false, content: .rest(MXLRest()))
        let graceNoteCue = MXLNote.Content.graceNoteCue(fullNote: fullNote, grace: MXLGrace())
        let regularNoteCue = MXLNote.Content.regularNoteCue(fullNote: fullNote, duration: MXLPositiveDivisions(intValue: 4)!)    // swiftlint:disable:this force_unwrapping line_length

        #expect(graceNoteCue != regularNoteCue)
    }
}
