// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFanTests {
}

// MARK: -

extension MXLFanTests {
    @Test
    func equality() {
        #expect(MXLFan.steady == .steady)
    }

    @Test
    func hashable() {
        let values: Set<MXLFan> = [.steady, .steady, .accel]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLFan.steady != .accel)
    }
}
