// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBeaterValueTests {
}

// MARK: -

extension MXLBeaterValueTests {
    @Test
    func equality() {
        #expect(MXLBeater.Value.bow == .bow)
    }

    @Test
    func hashable() {
        let values: Set<MXLBeater.Value> = [.bow, .bow, .hammer]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBeater.Value.bow != .hammer)
    }
}
