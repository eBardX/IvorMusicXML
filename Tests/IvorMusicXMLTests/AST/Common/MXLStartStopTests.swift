// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStartStopTests {
}

// MARK: -

extension MXLStartStopTests {
    @Test
    func equality() {
        #expect(MXLStartStop.start == .start)
        #expect(MXLStartStop.stop == .stop)
    }

    @Test
    func hashable() {
        let values: Set<MXLStartStop> = [.start, .start, .stop]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLStartStop.start != .stop)
    }
}
