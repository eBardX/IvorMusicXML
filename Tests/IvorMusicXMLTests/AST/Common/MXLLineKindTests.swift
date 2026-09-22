// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLineKindTests {
}

// MARK: -

extension MXLLineKindTests {
    @Test
    func equality() {
        #expect(MXLLineKind.dashed == .dashed)
        #expect(MXLLineKind.solid == .solid)
    }

    @Test
    func hashable() {
        let values: Set<MXLLineKind> = [.dashed, .dashed, .dotted, .solid, .wavy]

        #expect(values.count == 4)
    }

    @Test
    func inequality() {
        #expect(MXLLineKind.dashed != .solid)
    }
}
