// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNoteTests {
}

// MARK: -

extension MXLNoteTests {
    @Test
    func test_initSetsDuration() {
        let note = MXLNote(isChord: false,
                           value: .rest,
                           duration: 480,
                           tie: .neither)

        #expect(note.duration == 480)
    }

    @Test
    func test_initSetsIsChord() {
        let note = MXLNote(isChord: true,
                           value: .rest,
                           duration: 240,
                           tie: .neither)

        #expect(note.isChord)
    }

    @Test
    func test_initSetsIsNotChord() {
        let note = MXLNote(isChord: false,
                           value: .rest,
                           duration: 240,
                           tie: .neither)

        #expect(!note.isChord)
    }

    @Test
    func test_initSetsTie() {
        let note = MXLNote(isChord: false,
                           value: .rest,
                           duration: 120,
                           tie: .start)

        #expect(note.tie == .start)
    }

    @Test
    func test_initSetsValuePitch() {
        let pitch = MXLPitch(letter: .c,
                             accidental: .natural,
                             octave: 4)
        let note = MXLNote(isChord: false,
                           value: .pitch(pitch),
                           duration: 960,
                           tie: .neither)

        if case let .pitch(value) = note.value {
            #expect(value.letter == .c)
            #expect(value.octave == 4)
        } else {
            Issue.record("Expected .pitch value")
        }
    }

    @Test
    func test_initSetsValueRest() {
        let note = MXLNote(isChord: false,
                           value: .rest,
                           duration: 480,
                           tie: .neither)

        if case .rest = note.value {
            // pass
        } else {
            Issue.record("Expected .rest value")
        }
    }

    @Test
    func test_initSetsValueUnpitched() {
        let note = MXLNote(isChord: false,
                           value: .unpitched,
                           duration: 480,
                           tie: .neither)

        if case .unpitched = note.value {
            // pass
        } else {
            Issue.record("Expected .unpitched value")
        }
    }
}
