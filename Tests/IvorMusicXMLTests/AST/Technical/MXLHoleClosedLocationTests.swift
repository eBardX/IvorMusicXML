// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHoleClosedLocationTests {
}

// MARK: -

extension MXLHoleClosedLocationTests {
    @Test
    func equality() {
        #expect(MXLHole.Closed.Location.top == .top)
    }

    @Test
    func hashable() {
        let values: Set<MXLHole.Closed.Location> = [.top, .top, .bottom]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHole.Closed.Location.top != .bottom)
    }
}
