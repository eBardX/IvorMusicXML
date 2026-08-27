// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHarmonicContent2Tests {
}

// MARK: -

extension MXLHarmonicContent2Tests {
    @Test
    func equality() {
        #expect(MXLHarmonic.Content2.basePitch == .basePitch)
    }

    @Test
    func hashable() {
        let values: Set<MXLHarmonic.Content2> = [.basePitch, .basePitch, .soundingPitch]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHarmonic.Content2.basePitch != .soundingPitch)
    }
}
