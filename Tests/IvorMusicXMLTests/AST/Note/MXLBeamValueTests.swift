// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBeamValueTests {
}

// MARK: -

extension MXLBeamValueTests {
    @Test
    func equality() {
        #expect(MXLBeamValue.begin == .begin)
        #expect(MXLBeamValue.continue == .continue)
    }

    @Test
    func hashable() {
        let values: Set<MXLBeamValue> = [.begin, .begin, .end]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBeamValue.begin != .end)
    }
}
