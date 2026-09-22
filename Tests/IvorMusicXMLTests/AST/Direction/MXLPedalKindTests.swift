// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPedalKindTests {
}

// MARK: -

extension MXLPedalKindTests {
    @Test
    func equality() {
        #expect(MXLPedal.Kind.start == .start)
        #expect(MXLPedal.Kind.continue == .continue)
    }

    @Test
    func hashable() {
        let values: Set<MXLPedal.Kind> = [.start, .start, .stop]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPedal.Kind.start != .stop)
    }
}
