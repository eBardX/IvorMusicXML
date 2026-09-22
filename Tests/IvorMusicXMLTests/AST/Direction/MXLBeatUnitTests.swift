// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBeatUnitTests {
}

// MARK: -

extension MXLBeatUnitTests {
    @Test
    func equality() {
        #expect(MXLBeatUnit(beatUnit: .quarter, dot: 0) == MXLBeatUnit(beatUnit: .quarter, dot: 0))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLBeatUnit> = [MXLBeatUnit(beatUnit: .quarter, dot: 0),
                                        MXLBeatUnit(beatUnit: .quarter, dot: 0),
                                        MXLBeatUnit(beatUnit: .eighth, dot: 1)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBeatUnit(beatUnit: .quarter, dot: 0) != MXLBeatUnit(beatUnit: .eighth, dot: 1))
    }

    @Test
    func init_values() {
        let value = MXLBeatUnit(beatUnit: .quarter, dot: 1)

        #expect(value.beatUnit == .quarter)
        #expect(value.dot == 1)
    }
}
