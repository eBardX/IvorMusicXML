// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPageMarginsKindTests {
}

// MARK: -

extension MXLPageMarginsKindTests {
    @Test
    func equality() {
        #expect(MXLPageMargins.Kind.both == .both)
    }

    @Test
    func hashable() {
        let values: Set<MXLPageMargins.Kind> = [.both, .both, .even]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPageMargins.Kind.both != .even)
    }
}
