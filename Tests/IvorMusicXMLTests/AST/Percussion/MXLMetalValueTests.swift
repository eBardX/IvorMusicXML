// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMetalValueTests {
}

// MARK: -

extension MXLMetalValueTests {
    @Test
    func equality() {
        #expect(MXLMetal.Value.bell == .bell)
    }

    @Test
    func hashable() {
        let values: Set<MXLMetal.Value> = [.bell, .bell, .cowbell]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMetal.Value.bell != .cowbell)
    }
}
