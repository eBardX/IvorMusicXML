// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTimeSeparatorTests {
}

// MARK: -

extension MXLTimeSeparatorTests {
    @Test
    func equality() {
        #expect(MXLTimeSeparator.stacked == .stacked)
        #expect(MXLTimeSeparator.vertical == .vertical)
    }

    @Test
    func hashable() {
        let values: Set<MXLTimeSeparator> = [.adjacent, .adjacent, .diagonal, .horizontal, .stacked, .vertical]

        #expect(values.count == 5)
    }

    @Test
    func inequality() {
        #expect(MXLTimeSeparator.stacked != .vertical)
    }
}
