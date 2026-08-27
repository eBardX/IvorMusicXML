// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSyllabicTests {
}

// MARK: -

extension MXLSyllabicTests {
    @Test
    func equality() {
        #expect(MXLSyllabic.begin == .begin)
    }

    @Test
    func hashable() {
        let values: Set<MXLSyllabic> = [.begin, .begin, .end]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSyllabic.begin != .end)
    }
}
