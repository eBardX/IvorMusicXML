// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLWingedTests {
}

// MARK: -

extension MXLWingedTests {
    @Test
    func equality() {
        #expect(MXLWinged.curved == .curved)
        #expect(MXLWinged.wingless == .wingless)
    }

    @Test
    func hashable() {
        let values: Set<MXLWinged> = [.curved, .curved, .doubleCurved, .doubleStraight, .straight, .wingless]

        #expect(values.count == 5)
    }

    @Test
    func inequality() {
        #expect(MXLWinged.curved != .wingless)
    }
}
