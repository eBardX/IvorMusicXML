// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHoleClosedValueTests {
}

// MARK: -

extension MXLHoleClosedValueTests {
    @Test
    func equality() {
        #expect(MXLHole.Closed.Value.yes == .yes)
    }

    @Test
    func hashable() {
        let values: Set<MXLHole.Closed.Value> = [.yes, .yes, .no]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHole.Closed.Value.yes != .no)
    }
}
