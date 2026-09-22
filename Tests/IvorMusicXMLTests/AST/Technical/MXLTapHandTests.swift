// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTapHandTests {
}

// MARK: -

extension MXLTapHandTests {
    @Test
    func equality() {
        #expect(MXLTap.Hand.left == .left)
    }

    @Test
    func hashable() {
        let values: Set<MXLTap.Hand> = [.left, .left, .right]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTap.Hand.left != .right)
    }
}
