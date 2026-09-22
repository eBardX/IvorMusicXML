// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPitchedValueTests {
}

// MARK: -

extension MXLPitchedValueTests {
    @Test
    func equality() {
        #expect(MXLPitched.Value.marimba == .marimba)
    }

    @Test
    func hashable() {
        let values: Set<MXLPitched.Value> = [.marimba, .marimba, .xylophone]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPitched.Value.marimba != .xylophone)
    }
}
