// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBreathMarkValueTests {
}

// MARK: -

extension MXLBreathMarkValueTests {
    @Test
    func equality() {
        #expect(MXLBreathMark.Value.comma == .comma)
    }

    @Test
    func hashable() {
        let values: Set<MXLBreathMark.Value> = [.comma, .comma, .tick]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBreathMark.Value.comma != .tick)
    }
}
