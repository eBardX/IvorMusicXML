// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStickLocationTests {
}

// MARK: -

extension MXLStickLocationTests {
    @Test
    func equality() {
        #expect(MXLStickLocation.center == .center)
    }

    @Test
    func hashable() {
        let values: Set<MXLStickLocation> = [.center, .center, .rim]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLStickLocation.center != .rim)
    }
}
