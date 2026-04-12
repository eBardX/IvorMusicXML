// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNoteValueTests {
}

// MARK: -

extension MXLNoteValueTests {
    @Test
    func test_casePitch() {
        let pitch = MXLPitch(letter: .e,
                             accidental: .flat,
                             octave: 3)
        let value = MXLNote.Value.pitch(pitch)

        if case let .pitch(p) = value {
            #expect(p.letter == .e)
            #expect(p.accidental == .flat)
            #expect(p.octave == 3)
        } else {
            Issue.record("Expected .pitch case")
        }
    }

    @Test
    func test_caseRest() {
        let value = MXLNote.Value.rest

        if case .rest = value {
            // pass
        } else {
            Issue.record("Expected .rest case")
        }
    }

    @Test
    func test_caseUnpitched() {
        let value = MXLNote.Value.unpitched

        if case .unpitched = value {
            // pass
        } else {
            Issue.record("Expected .unpitched case")
        }
    }
}
