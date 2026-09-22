// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTremoloKindTests {
}

// MARK: -

extension MXLTremoloKindTests {
    @Test
    func equality() {
        #expect(MXLTremolo.Kind.single == .single)
    }

    @Test
    func hashable() {
        let values: Set<MXLTremolo.Kind> = [.single, .single, .start]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTremolo.Kind.single != .start)
    }
}
