// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMetronomeBeatUnitTiedTests {
}

// MARK: -

extension MXLMetronomeBeatUnitTiedTests {
    @Test
    func equality() {
        #expect(MXLMetronome.BeatUnitTied(beatUnit: .quarter, beatUnitDot: 0) ==    // swiftlint:disable:this identical_operands
                 MXLMetronome.BeatUnitTied(beatUnit: .quarter, beatUnitDot: 0))
    }

    @Test
    func hashable() {
        let values: Set<MXLMetronome.BeatUnitTied> = [MXLMetronome.BeatUnitTied(beatUnit: .quarter, beatUnitDot: 0),
                                                      MXLMetronome.BeatUnitTied(beatUnit: .quarter, beatUnitDot: 0),
                                                      MXLMetronome.BeatUnitTied(beatUnit: .eighth, beatUnitDot: 1)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMetronome.BeatUnitTied(beatUnit: .quarter, beatUnitDot: 0) !=
                 MXLMetronome.BeatUnitTied(beatUnit: .eighth, beatUnitDot: 1))
    }

    @Test
    func init_values() {
        let value = MXLMetronome.BeatUnitTied(beatUnit: .quarter, beatUnitDot: 1)

        #expect(value.beatUnit == .quarter)
        #expect(value.beatUnitDot == 1)
    }
}
