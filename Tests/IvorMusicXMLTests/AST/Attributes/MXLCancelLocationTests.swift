// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLCancelLocationTests {
}

// MARK: -

extension MXLCancelLocationTests {
    @Test
    func equality() {
        #expect(MXLCancel.Location.left == .left)
        #expect(MXLCancel.Location.right == .right)
    }

    @Test
    func hashable() {
        let values: Set<MXLCancel.Location> = [.beforeBarline, .beforeBarline, .left, .right]

        #expect(values.count == 3)
    }

    @Test
    func inequality() {
        #expect(MXLCancel.Location.left != .right)
    }
}
