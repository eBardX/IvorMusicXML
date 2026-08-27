// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLeftCenterRightTests {
}

// MARK: -

extension MXLLeftCenterRightTests {
    @Test
    func equality() {
        #expect(MXLLeftCenterRight.center == .center)
        #expect(MXLLeftCenterRight.left == .left)
    }

    @Test
    func hashable() {
        let values: Set<MXLLeftCenterRight> = [.center, .center, .left, .right]

        #expect(values.count == 3)
    }

    @Test
    func inequality() {
        #expect(MXLLeftCenterRight.left != .right)
    }
}
