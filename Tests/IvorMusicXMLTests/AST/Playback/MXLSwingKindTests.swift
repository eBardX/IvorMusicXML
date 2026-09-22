// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSwingKindTests {
}

// MARK: -

extension MXLSwingKindTests {
    @Test
    func equality() {
        #expect(MXLSwing.Kind.eighth == .eighth)
    }

    @Test
    func hashable() {
        let values: Set<MXLSwing.Kind> = [.eighth, .eighth, .n16th]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSwing.Kind.eighth != .n16th)
    }
}
