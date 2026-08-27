// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBarlineStyleColorStyleTests {
}

// MARK: -

extension MXLBarlineStyleColorStyleTests {
    @Test
    func equality() {
        #expect(MXLBarline.StyleColor.Style.regular == .regular)
        #expect(MXLBarline.StyleColor.Style.tick == .tick)
    }

    @Test
    func hashable() {
        let values: Set<MXLBarline.StyleColor.Style> = [.dashed,
                                                        .dashed,
                                                        .dotted,
                                                        .heavy,
                                                        .heavyHeavy,
                                                        .heavyLight,
                                                        .invisible,
                                                        .lightHeavy,
                                                        .lightLight,
                                                        .regular,
                                                        .short,
                                                        .tick]

        #expect(values.count == 11)
    }

    @Test
    func inequality() {
        #expect(MXLBarline.StyleColor.Style.regular != .tick)
    }
}
