// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHarmonyChordKindValueTests {
}

// MARK: -

extension MXLHarmonyChordKindValueTests {
    @Test
    func equality() {
        #expect(MXLHarmony.Chord.Kind.Value.major == .major)
    }

    @Test
    func hashable() {
        let values: Set<MXLHarmony.Chord.Kind.Value> = [.major, .major, .minor]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHarmony.Chord.Kind.Value.major != .minor)
    }
}
