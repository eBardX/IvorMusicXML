// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLArrowStyleTests {
}

// MARK: -

extension MXLArrowStyleTests {
    @Test
    func equality() {
        #expect(MXLArrow.Style.single == .single)
    }

    @Test
    func hashable() {
        let values: Set<MXLArrow.Style> = [.single, .single, .double]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLArrow.Style.single != .double)
    }
}
