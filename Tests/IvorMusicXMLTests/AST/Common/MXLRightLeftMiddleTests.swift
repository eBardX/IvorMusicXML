// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLRightLeftMiddleTests {
}

// MARK: -

extension MXLRightLeftMiddleTests {
    @Test
    func equality() {
        #expect(MXLRightLeftMiddle.left == .left)
        #expect(MXLRightLeftMiddle.right == .right)
    }

    @Test
    func hashable() {
        let values: Set<MXLRightLeftMiddle> = [.left, .left, .middle, .right]

        #expect(values.count == 3)
    }

    @Test
    func inequality() {
        #expect(MXLRightLeftMiddle.left != .right)
    }
}
