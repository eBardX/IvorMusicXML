// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPrincipalVoiceSymbolTests {
}

// MARK: -

extension MXLPrincipalVoiceSymbolTests {
    @Test
    func equality() {
        #expect(MXLPrincipalVoice.Symbol.plain == .plain)
    }

    @Test
    func hashable() {
        let values: Set<MXLPrincipalVoice.Symbol> = [.plain, .plain, .invisible]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPrincipalVoice.Symbol.plain != .invisible)
    }
}
