// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTimeSymbolTests {
}

// MARK: -

extension MXLTimeSymbolTests {
    @Test
    func equality() {
        #expect(MXLTimeSymbol.normal == .normal)
        #expect(MXLTimeSymbol.singleNumber == .singleNumber)
    }

    @Test
    func hashable() {
        let values: Set<MXLTimeSymbol> = [.common, .common, .cut, .dottedNote, .normal, .note, .singleNumber]

        #expect(values.count == 6)
    }

    @Test
    func inequality() {
        #expect(MXLTimeSymbol.normal != .singleNumber)
    }
}
