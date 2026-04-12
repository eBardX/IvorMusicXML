// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPitchAccidentalTests {
}

// MARK: -

extension MXLPitchAccidentalTests {
    @Test
    func test_allCases() {
        let doubleFlat = MXLPitch.Accidental.doubleFlat
        let flat = MXLPitch.Accidental.flat
        let natural = MXLPitch.Accidental.natural
        let sharp = MXLPitch.Accidental.sharp
        let doubleSharp = MXLPitch.Accidental.doubleSharp

        #expect(doubleFlat != flat)
        #expect(flat != natural)
        #expect(natural != sharp)
        #expect(sharp != doubleSharp)
        #expect(doubleSharp != doubleFlat)
    }

    @Test
    func test_equality() {
        #expect(MXLPitch.Accidental.natural == .natural)
        #expect(MXLPitch.Accidental.sharp == .sharp)
    }

    @Test
    func test_inequality() {
        #expect(MXLPitch.Accidental.flat != .sharp)
        #expect(MXLPitch.Accidental.doubleFlat != .doubleSharp)
    }
}
