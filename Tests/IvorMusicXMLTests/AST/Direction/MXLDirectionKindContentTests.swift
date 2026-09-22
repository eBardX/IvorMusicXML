// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDirectionKindContentTests {
}

// MARK: -

extension MXLDirectionKindContentTests {
    @Test
    func equality() {
        #expect(MXLDirection.Kind.Content.coda([MXLCoda()]) == .coda([MXLCoda()]))
    }

    @Test
    func hashable() {
        let coda = MXLDirection.Kind.Content.coda([MXLCoda()])
        let words = MXLDirection.Kind.Content.words(MXLFormattedTextID(value: "Allegro"))
        let values: Set<MXLDirection.Kind.Content> = [coda, coda, words]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLDirection.Kind.Content.coda([MXLCoda()]) !=
                 .words(MXLFormattedTextID(value: "Allegro")))
    }
}
