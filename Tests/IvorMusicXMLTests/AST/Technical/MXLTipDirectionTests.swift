// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTipDirectionTests {
}

// MARK: -

extension MXLTipDirectionTests {
    @Test
    func equality() {
        #expect(MXLTipDirection.up == .up)
    }

    @Test
    func hashable() {
        let values: Set<MXLTipDirection> = [.up, .up, .down]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTipDirection.up != .down)
    }
}
