// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMetronomeContentBeatUnitContentTests {
}

// MARK: -

extension MXLMetronomeContentBeatUnitContentTests {
    @Test
    func equality() {
        let beatUnit = MXLBeatUnit(beatUnit: .quarter, dot: 0)

        #expect(MXLMetronome.Content.BeatUnitContent.beatUnit(beatUnit, tied: []) == .beatUnit(beatUnit, tied: []))
    }

    @Test
    func hashable() {
        let beatUnit = MXLMetronome.Content.BeatUnitContent.beatUnit(MXLBeatUnit(beatUnit: .quarter, dot: 0), tied: [])
        let perMinute = MXLMetronome.Content.BeatUnitContent.perMinute(MXLPerMinute(value: "80"))
        let values: Set<MXLMetronome.Content.BeatUnitContent> = [beatUnit, beatUnit, perMinute]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let beatUnit = MXLMetronome.Content.BeatUnitContent.beatUnit(MXLBeatUnit(beatUnit: .quarter, dot: 0), tied: [])
        let perMinute = MXLMetronome.Content.BeatUnitContent.perMinute(MXLPerMinute(value: "80"))

        #expect(beatUnit != perMinute)
    }
}
