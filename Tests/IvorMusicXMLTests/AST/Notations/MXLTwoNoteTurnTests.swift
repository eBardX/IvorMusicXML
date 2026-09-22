// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTwoNoteTurnTests {
}

// MARK: -

extension MXLTwoNoteTurnTests {
    @Test
    func equality() {
        #expect(MXLTwoNoteTurn.whole == .whole)
    }

    @Test
    func hashable() {
        let values: Set<MXLTwoNoteTurn> = [.whole, .whole, .half]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTwoNoteTurn.whole != .half)
    }
}
