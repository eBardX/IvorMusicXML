// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMetronomeContentTests {
}

// MARK: -

extension MXLMetronomeContentTests {
    @Test
    func equality() {
        let beatUnit = MXLBeatUnit(beatUnit: .quarter, dot: 0)
        let content = MXLMetronome.Content.BeatUnitContent.perMinute(MXLPerMinute(value: "80"))

        #expect(MXLMetronome.Content.beatUnit(beatUnit, tied: [], content: content) ==
                 .beatUnit(beatUnit, tied: [], content: content))
    }

    @Test
    func hashable() {
        let beatUnit = MXLBeatUnit(beatUnit: .quarter, dot: 0)
        let content = MXLMetronome.Content.BeatUnitContent.perMinute(MXLPerMinute(value: "80"))
        let beatUnitCase = MXLMetronome.Content.beatUnit(beatUnit, tied: [], content: content)
        let arrowsCase = MXLMetronome.Content.metronomeArrows(hasMetronomeArrows: true, note: [], relation: nil, secondNote: [])
        let values: Set<MXLMetronome.Content> = [beatUnitCase, beatUnitCase, arrowsCase]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let beatUnit = MXLBeatUnit(beatUnit: .quarter, dot: 0)
        let content = MXLMetronome.Content.BeatUnitContent.perMinute(MXLPerMinute(value: "80"))
        let beatUnitCase = MXLMetronome.Content.beatUnit(beatUnit, tied: [], content: content)
        let arrowsCase = MXLMetronome.Content.metronomeArrows(hasMetronomeArrows: true, note: [], relation: nil, secondNote: [])

        #expect(beatUnitCase != arrowsCase)
    }
}
