// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStemValueTests {
}

// MARK: -

extension MXLStemValueTests {
    @Test
    func equality() {
        #expect(MXLStem.Value.up == .up)
    }

    @Test
    func hashable() {
        let values: Set<MXLStem.Value> = [.up, .up, .down]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLStem.Value.up != .down)
    }
}
