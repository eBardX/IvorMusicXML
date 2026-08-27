// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFermataShapeTests {
}

// MARK: -

extension MXLFermataShapeTests {
    @Test
    func equality() {
        #expect(MXLFermata.Shape.normal == .normal)
    }

    @Test
    func hashable() {
        let values: Set<MXLFermata.Shape> = [.normal, .normal, .angled]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLFermata.Shape.normal != .angled)
    }
}
