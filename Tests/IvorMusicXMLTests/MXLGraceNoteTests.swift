// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLGraceNoteTests {
}

// MARK: -

extension MXLGraceNoteTests {
    @Test
    func test_initSetsDuration() {
        let note = MXLGraceNote(isChord: false,
                                value: .rest,
                                duration: .unspecified,
                                tie: .neither)

        if case .unspecified = note.duration {
            // pass
        } else {
            Issue.record("Expected .unspecified duration")
        }
    }

    @Test
    func test_initSetsIsChord() {
        let note = MXLGraceNote(isChord: true,
                                value: .rest,
                                duration: .unspecified,
                                tie: .neither)

        #expect(note.isChord)
    }

    @Test
    func test_initSetsTie() {
        let note = MXLGraceNote(isChord: false,
                                value: .rest,
                                duration: .unspecified,
                                tie: .stop)

        #expect(note.tie == .stop)
    }

    @Test
    func test_initSetsValue() {
        let pitch = MXLPitch(letter: .d,
                             accidental: .sharp,
                             octave: 5)
        let note = MXLGraceNote(isChord: false,
                                value: .pitch(pitch),
                                duration: .makeTime(0.5),
                                tie: .neither)

        if case let .pitch(p) = note.value {
            #expect(p.letter == .d)
        } else {
            Issue.record("Expected .pitch value")
        }
    }

    @Test
    func test_initWithMakeTimeDuration() {
        let note = MXLGraceNote(isChord: false,
                                value: .rest,
                                duration: .makeTime(0.25),
                                tie: .neither)

        if case let .makeTime(value) = note.duration {
            #expect(value == 0.25)
        } else {
            Issue.record("Expected .makeTime duration")
        }
    }

    @Test
    func test_initWithStealTimeFollowingDuration() {
        let note = MXLGraceNote(isChord: false,
                                value: .rest,
                                duration: .stealTimeFollowing(33.0),
                                tie: .neither)

        if case let .stealTimeFollowing(value) = note.duration {
            #expect(value == 33.0)
        } else {
            Issue.record("Expected .stealTimeFollowing duration")
        }
    }

    @Test
    func test_initWithStealTimePreviousDuration() {
        let note = MXLGraceNote(isChord: false,
                                value: .rest,
                                duration: .stealTimePrevious(50.0),
                                tie: .neither)

        if case let .stealTimePrevious(value) = note.duration {
            #expect(value == 50.0)
        } else {
            Issue.record("Expected .stealTimePrevious duration")
        }
    }
}
