// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLCaesuraValueTests {
}

// MARK: -

extension MXLCaesuraValueTests {
    @Test
    func equality() {
        #expect(MXLCaesura.Value.normal == .normal)
    }

    @Test
    func hashable() {
        let values: Set<MXLCaesura.Value> = [.normal, .normal, .curved]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLCaesura.Value.normal != .curved)
    }
}
