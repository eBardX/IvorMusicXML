// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSwingContentTests {
}

// MARK: -

extension MXLSwingContentTests {
    @Test
    func equality() {
        #expect(MXLSwing.Content.straight == .straight)
    }

    @Test
    func hashable() {
        let straight = MXLSwing.Content.straight
        let first = MXLSwing.Content.first(2, second: 1, kind: .eighth)
        let values: Set<MXLSwing.Content> = [straight, straight, first]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let straight = MXLSwing.Content.straight
        let first = MXLSwing.Content.first(2, second: 1, kind: .eighth)

        #expect(straight != first)
    }
}
