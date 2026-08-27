// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLCreditContentAlternativeGroupContentTests {
}

// MARK: -

extension MXLCreditContentAlternativeGroupContentTests {
    @Test
    func equality() {
        let words = MXLFormattedTextID(value: "Title")

        #expect(MXLCredit.Content.AlternativeGroup.Content.creditWords(words) == .creditWords(words))
    }

    @Test
    func hashable() {
        let words = MXLCredit.Content.AlternativeGroup.Content.creditWords(MXLFormattedTextID(value: "Title"))
        let symbol = MXLCredit.Content.AlternativeGroup.Content.creditSymbol(MXLFormattedSymbolID(value: "coda"))
        let values: Set<MXLCredit.Content.AlternativeGroup.Content> = [words, words, symbol]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let words = MXLCredit.Content.AlternativeGroup.Content.creditWords(MXLFormattedTextID(value: "Title"))
        let symbol = MXLCredit.Content.AlternativeGroup.Content.creditSymbol(MXLFormattedSymbolID(value: "coda"))

        #expect(words != symbol)
    }
}
