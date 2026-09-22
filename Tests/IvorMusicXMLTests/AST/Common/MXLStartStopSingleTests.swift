// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStartStopSingleTests {
}

// MARK: -

extension MXLStartStopSingleTests {
    @Test
    func equality() {
        #expect(MXLStartStopSingle.single == .single)
        #expect(MXLStartStopSingle.start == .start)
    }

    @Test
    func hashable() {
        let values: Set<MXLStartStopSingle> = [.single, .single, .start, .stop]

        #expect(values.count == 3)
    }

    @Test
    func inequality() {
        #expect(MXLStartStopSingle.start != .stop)
    }
}
