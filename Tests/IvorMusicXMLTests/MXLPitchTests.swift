// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPitchTests {
}

// MARK: -

extension MXLPitchTests {
    @Test
    func test_initSetsAccidental() {
        let pitch = MXLPitch(letter: .c,
                             accidental: .sharp,
                             octave: 4)

        #expect(pitch.accidental == .sharp)
    }

    @Test
    func test_initSetsLetter() {
        let pitch = MXLPitch(letter: .a,
                             accidental: .natural,
                             octave: 3)

        #expect(pitch.letter == .a)
    }

    @Test
    func test_initSetsOctave() {
        let pitch = MXLPitch(letter: .g,
                             accidental: .flat,
                             octave: 5)

        #expect(pitch.octave == 5)
    }

    @Test
    func test_variousAccidentals() {
        let doubleFlat = MXLPitch(letter: .b,
                                  accidental: .doubleFlat,
                                  octave: 3)
        let doubleSharp = MXLPitch(letter: .f,
                                   accidental: .doubleSharp,
                                   octave: 6)

        #expect(doubleFlat.accidental == .doubleFlat)
        #expect(doubleSharp.accidental == .doubleSharp)
    }

    @Test
    func test_variousLetters() {
        let letters: [MXLPitch.Letter] = [.a, .b, .c, .d, .e, .f, .g]

        for letter in letters {
            let pitch = MXLPitch(letter: letter,
                                 accidental: .natural,
                                 octave: 4)

            #expect(pitch.letter == letter)
        }
    }
}
