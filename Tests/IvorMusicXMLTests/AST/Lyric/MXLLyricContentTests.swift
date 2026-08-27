// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLyricContentTests {
}

// MARK: -

extension MXLLyricContentTests {
    @Test
    func equality() {
        #expect(MXLLyric.Content.humming == .humming)
    }

    @Test
    func hashable() {
        let extend = MXLLyric.Content.extend(MXLExtend())
        let humming = MXLLyric.Content.humming
        let values: Set<MXLLyric.Content> = [extend, extend, humming]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLLyric.Content.humming != .laughing)
    }
}
