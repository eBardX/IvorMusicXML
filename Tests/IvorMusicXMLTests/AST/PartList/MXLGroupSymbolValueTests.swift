// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLGroupSymbolValueTests {
}

// MARK: -

extension MXLGroupSymbolValueTests {
    @Test
    func equality() {
        #expect(MXLGroupSymbolValue.brace == .brace)
    }

    @Test
    func hashable() {
        let values: Set<MXLGroupSymbolValue> = [.brace, .brace, .bracket]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLGroupSymbolValue.brace != .bracket)
    }
}
