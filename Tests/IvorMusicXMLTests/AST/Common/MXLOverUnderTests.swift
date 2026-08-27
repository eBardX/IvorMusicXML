// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOverUnderTests {
}

// MARK: -

extension MXLOverUnderTests {
    @Test
    func equality() {
        #expect(MXLOverUnder.over == .over)
        #expect(MXLOverUnder.under == .under)
    }

    @Test
    func hashable() {
        let values: Set<MXLOverUnder> = [.over, .over, .under]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLOverUnder.over != .under)
    }
}
