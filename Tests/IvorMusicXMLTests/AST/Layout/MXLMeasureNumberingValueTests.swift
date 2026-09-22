// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMeasureNumberingValueTests {
}

// MARK: -

extension MXLMeasureNumberingValueTests {
    @Test
    func equality() {
        #expect(MXLMeasureNumbering.Value.system == .system)
    }

    @Test
    func hashable() {
        let values: Set<MXLMeasureNumbering.Value> = [.system, .system, .measure]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMeasureNumbering.Value.system != .measure)
    }
}
