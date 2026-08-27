// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSemiPitchedTests {
}

// MARK: -

extension MXLSemiPitchedTests {
    @Test
    func equality() {
        #expect(MXLSemiPitched.medium == .medium)
    }

    @Test
    func hashable() {
        let values: Set<MXLSemiPitched> = [.medium, .medium, .high]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSemiPitched.medium != .high)
    }
}
