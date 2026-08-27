// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStickKindTests {
}

// MARK: -

extension MXLStickKindTests {
    @Test
    func equality() {
        #expect(MXLStick.Kind.bassDrum == .bassDrum)
    }

    @Test
    func hashable() {
        let values: Set<MXLStick.Kind> = [.bassDrum, .bassDrum, .timpani]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLStick.Kind.bassDrum != .timpani)
    }
}
