// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLGlassValueTests {
}

// MARK: -

extension MXLGlassValueTests {
    @Test
    func equality() {
        #expect(MXLGlass.Value.windChimes == .windChimes)
    }

    @Test
    func hashable() {
        let values: Set<MXLGlass.Value> = [.windChimes, .windChimes, .glassHarp]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLGlass.Value.windChimes != .glassHarp)
    }
}
