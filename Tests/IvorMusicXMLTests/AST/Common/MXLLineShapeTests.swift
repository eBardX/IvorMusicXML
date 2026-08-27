// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLineShapeTests {
}

// MARK: -

extension MXLLineShapeTests {
    @Test
    func equality() {
        #expect(MXLLineShape.curved == .curved)
        #expect(MXLLineShape.straight == .straight)
    }

    @Test
    func hashable() {
        let values: Set<MXLLineShape> = [.curved, .curved, .straight]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLLineShape.curved != .straight)
    }
}
