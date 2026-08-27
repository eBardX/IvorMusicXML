// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLAboveBelowTests {
}

// MARK: -

extension MXLAboveBelowTests {
    @Test
    func equality() {
        #expect(MXLAboveBelow.above == .above)
        #expect(MXLAboveBelow.below == .below)
    }

    @Test
    func hashable() {
        let values: Set<MXLAboveBelow> = [.above, .above, .below]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLAboveBelow.above != .below)
    }
}
