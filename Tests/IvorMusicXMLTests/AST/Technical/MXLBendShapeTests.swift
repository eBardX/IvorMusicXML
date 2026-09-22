// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBendShapeTests {
}

// MARK: -

extension MXLBendShapeTests {
    @Test
    func equality() {
        #expect(MXLBend.Shape.curved == .curved)
    }

    @Test
    func hashable() {
        let values: Set<MXLBend.Shape> = [.curved, .curved, .angled]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBend.Shape.curved != .angled)
    }
}
