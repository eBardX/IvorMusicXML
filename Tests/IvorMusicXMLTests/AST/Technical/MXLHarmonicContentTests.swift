// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHarmonicContentTests {
}

// MARK: -

extension MXLHarmonicContentTests {
    @Test
    func equality() {
        #expect(MXLHarmonic.Content.natural == .natural)
    }

    @Test
    func hashable() {
        let values: Set<MXLHarmonic.Content> = [.natural, .natural, .artificial]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHarmonic.Content.natural != .artificial)
    }
}
