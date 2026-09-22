// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLShowTupletTests {
}

// MARK: -

extension MXLShowTupletTests {
    @Test
    func equality() {
        #expect(MXLShowTuplet.actual == .actual)
        #expect(MXLShowTuplet.both == .both)
    }

    @Test
    func hashable() {
        let values: Set<MXLShowTuplet> = [.actual, .actual, .both, .neither]

        #expect(values.count == 3)
    }

    @Test
    func inequality() {
        #expect(MXLShowTuplet.actual != .neither)
    }
}
