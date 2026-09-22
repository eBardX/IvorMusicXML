// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLArrowDirectionTests {
}

// MARK: -

extension MXLArrowDirectionTests {
    @Test
    func equality() {
        #expect(MXLArrow.Direction.up == .up)
    }

    @Test
    func hashable() {
        let values: Set<MXLArrow.Direction> = [.up, .up, .down]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLArrow.Direction.up != .down)
    }
}
