// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHarmonClosedLocationTests {
}

// MARK: -

extension MXLHarmonClosedLocationTests {
    @Test
    func equality() {
        #expect(MXLHarmonClosed.Location.top == .top)
    }

    @Test
    func hashable() {
        let values: Set<MXLHarmonClosed.Location> = [.top, .top, .bottom]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHarmonClosed.Location.top != .bottom)
    }
}
