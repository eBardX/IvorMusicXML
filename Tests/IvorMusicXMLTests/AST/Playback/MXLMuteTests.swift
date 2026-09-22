// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMuteTests {
}

// MARK: -

extension MXLMuteTests {
    @Test
    func equality() {
        #expect(MXLMute.on == .on)
    }

    @Test
    func hashable() {
        let values: Set<MXLMute> = [.on, .on, .off]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMute.on != .off)
    }
}
