// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLeftRightTests {
}

// MARK: -

extension MXLLeftRightTests {
    @Test
    func equality() {
        #expect(MXLLeftRight.left == .left)
        #expect(MXLLeftRight.right == .right)
    }

    @Test
    func hashable() {
        let values: Set<MXLLeftRight> = [.left, .left, .right]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLLeftRight.left != .right)
    }
}
