// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFullNoteContentTests {
}

// MARK: -

extension MXLFullNoteContentTests {
    @Test
    func equality() {
        let pitch = MXLPitch(step: .c, octave: MXLOctave(uintValue: 4)!)    // swiftlint:disable:this force_unwrapping

        #expect(MXLFullNote.Content.pitch(pitch) == .pitch(pitch))
    }

    @Test
    func hashable() {
        let pitch = MXLFullNote.Content.pitch(MXLPitch(step: .c, octave: MXLOctave(uintValue: 4)!))    // swiftlint:disable:this force_unwrapping
        let rest = MXLFullNote.Content.rest(MXLRest())
        let values: Set<MXLFullNote.Content> = [pitch, pitch, rest]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let pitch = MXLFullNote.Content.pitch(MXLPitch(step: .c, octave: MXLOctave(uintValue: 4)!))    // swiftlint:disable:this force_unwrapping
        let rest = MXLFullNote.Content.rest(MXLRest())

        #expect(pitch != rest)
    }
}
