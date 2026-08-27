// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLEnclosureShapeTests {
}

// MARK: -

extension MXLEnclosureShapeTests {
    @Test
    func equality() {
        #expect(MXLEnclosureShape.circle == .circle)
        #expect(MXLEnclosureShape.unenclosed == .unenclosed)
    }

    @Test
    func hashable() {
        let values: Set<MXLEnclosureShape> = [.bracket,
                                              .bracket,
                                              .circle,
                                              .decagon,
                                              .diamond,
                                              .heptagon,
                                              .hexagon,
                                              .invertedBracket,
                                              .nonagon,
                                              .octagon,
                                              .oval,
                                              .pentagon,
                                              .rectangle,
                                              .square,
                                              .triangle,
                                              .unenclosed]

        #expect(values.count == 15)
    }

    @Test
    func inequality() {
        #expect(MXLEnclosureShape.circle != .square)
    }
}
