// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOrnamentsContentTests {
}

// MARK: -

extension MXLOrnamentsContentTests {
    @Test
    func equality() {
        let trillMark = MXLEmptyTrillSound()

        #expect(MXLOrnaments.Content.trillMark(trillMark) == .trillMark(trillMark))
    }

    @Test
    func hashable() {
        let trillMark = MXLOrnaments.Content.trillMark(MXLEmptyTrillSound())
        let mordent = MXLOrnaments.Content.mordent(MXLMordent())
        let values: Set<MXLOrnaments.Content> = [trillMark, trillMark, mordent]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let trillMark = MXLOrnaments.Content.trillMark(MXLEmptyTrillSound())
        let mordent = MXLOrnaments.Content.mordent(MXLMordent())

        #expect(trillMark != mordent)
    }
}
