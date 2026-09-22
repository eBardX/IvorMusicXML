// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLCreditContentAlternativeContentTests {
}

// MARK: -

extension MXLCreditContentAlternativeContentTests {
    @Test
    func equality() {
        let words = MXLFormattedTextID(value: "Title")

        #expect(MXLCredit.Content.AlternativeContent.creditWords(words) == .creditWords(words))
    }

    @Test
    func hashable() {
        let words = MXLCredit.Content.AlternativeContent.creditWords(MXLFormattedTextID(value: "Title"))
        let symbol = MXLCredit.Content.AlternativeContent.creditSymbol(MXLFormattedSymbolID(value: "coda"))
        let values: Set<MXLCredit.Content.AlternativeContent> = [words, words, symbol]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let words = MXLCredit.Content.AlternativeContent.creditWords(MXLFormattedTextID(value: "Title"))
        let symbol = MXLCredit.Content.AlternativeContent.creditSymbol(MXLFormattedSymbolID(value: "coda"))

        #expect(words != symbol)
    }
}
