// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHandbellValueTests {
}

// MARK: -

extension MXLHandbellValueTests {
    @Test
    func equality() {
        #expect(MXLHandbell.Value.damp == .damp)
    }

    @Test
    func hashable() {
        let values: Set<MXLHandbell.Value> = [.damp, .damp, .echo]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHandbell.Value.damp != .echo)
    }
}
