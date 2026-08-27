// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLWedgeKindTests {
}

// MARK: -

extension MXLWedgeKindTests {
    @Test
    func equality() {
        #expect(MXLWedge.Kind.crescendo == .crescendo)
        #expect(MXLWedge.Kind.continue == .continue)
    }

    @Test
    func hashable() {
        let values: Set<MXLWedge.Kind> = [.crescendo, .crescendo, .diminuendo]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLWedge.Kind.crescendo != .diminuendo)
    }
}
