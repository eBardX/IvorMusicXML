// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSymbolSizeTests {
}

// MARK: -

extension MXLSymbolSizeTests {
    @Test
    func equality() {
        #expect(MXLSymbolSize.cue == .cue)
        #expect(MXLSymbolSize.full == .full)
    }

    @Test
    func hashable() {
        let values: Set<MXLSymbolSize> = [.cue, .cue, .full, .graceCue, .large]

        #expect(values.count == 4)
    }

    @Test
    func inequality() {
        #expect(MXLSymbolSize.cue != .full)
    }
}
