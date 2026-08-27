// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLineEndTests {
}

// MARK: -

extension MXLLineEndTests {
    @Test
    func equality() {
        #expect(MXLLineEnd.arrow == .arrow)
        #expect(MXLLineEnd.up == .up)
    }

    @Test
    func hashable() {
        let values: Set<MXLLineEnd> = [.arrow, .arrow, .both, .down, .plain, .up]

        #expect(values.count == 5)
    }

    @Test
    func inequality() {
        #expect(MXLLineEnd.arrow != .plain)
    }
}
