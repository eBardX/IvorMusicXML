// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHarmonyArrangementTests {
}

// MARK: -

extension MXLHarmonyArrangementTests {
    @Test
    func equality() {
        #expect(MXLHarmonyArrangement.vertical == .vertical)
    }

    @Test
    func hashable() {
        let values: Set<MXLHarmonyArrangement> = [.vertical, .vertical, .horizontal]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHarmonyArrangement.vertical != .horizontal)
    }
}
