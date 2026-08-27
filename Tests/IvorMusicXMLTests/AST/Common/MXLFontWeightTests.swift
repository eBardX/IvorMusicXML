// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFontWeightTests {
}

// MARK: -

extension MXLFontWeightTests {
    @Test
    func equality() {
        #expect(MXLFont.Weight.bold == .bold)
        #expect(MXLFont.Weight.normal == .normal)
    }

    @Test
    func hashable() {
        let values: Set<MXLFont.Weight> = [.bold, .bold, .normal]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLFont.Weight.bold != .normal)
    }
}
