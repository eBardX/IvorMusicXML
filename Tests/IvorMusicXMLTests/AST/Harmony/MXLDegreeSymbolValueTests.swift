// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDegreeSymbolValueTests {
}

// MARK: -

extension MXLDegreeSymbolValueTests {
    @Test
    func equality() {
        #expect(MXLDegree.SymbolValue.major == .major)
    }

    @Test
    func hashable() {
        let values: Set<MXLDegree.SymbolValue> = [.major, .major, .minor]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLDegree.SymbolValue.major != .minor)
    }
}
