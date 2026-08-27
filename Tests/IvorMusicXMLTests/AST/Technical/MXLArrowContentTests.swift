// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLArrowContentTests {
}

// MARK: -

extension MXLArrowContentTests {
    @Test
    func equality() {
        #expect(MXLArrow.Content.arrowDirection(.up, style: .single, hasArrowhead: true) ==
                 .arrowDirection(.up, style: .single, hasArrowhead: true))
    }

    @Test
    func hashable() {
        let arrowDirection = MXLArrow.Content.arrowDirection(.up, style: .single, hasArrowhead: true)
        let circularArrow = MXLArrow.Content.circularArrow(.clockwise)
        let values: Set<MXLArrow.Content> = [arrowDirection, arrowDirection, circularArrow]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let arrowDirection = MXLArrow.Content.arrowDirection(.up, style: .single, hasArrowhead: true)
        let circularArrow = MXLArrow.Content.circularArrow(.clockwise)

        #expect(arrowDirection != circularArrow)
    }
}
