// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLCircularArrowTests {
}

// MARK: -

extension MXLCircularArrowTests {
    @Test
    func equality() {
        #expect(MXLCircularArrow.clockwise == .clockwise)
    }

    @Test
    func hashable() {
        let values: Set<MXLCircularArrow> = [.clockwise, .clockwise, .anticlockwise]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLCircularArrow.clockwise != .anticlockwise)
    }
}
