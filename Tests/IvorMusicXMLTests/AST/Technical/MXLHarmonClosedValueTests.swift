// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHarmonClosedValueTests {
}

// MARK: -

extension MXLHarmonClosedValueTests {
    @Test
    func equality() {
        #expect(MXLHarmonClosed.Value.yes == .yes)
    }

    @Test
    func hashable() {
        let values: Set<MXLHarmonClosed.Value> = [.yes, .yes, .no]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHarmonClosed.Value.yes != .no)
    }
}
