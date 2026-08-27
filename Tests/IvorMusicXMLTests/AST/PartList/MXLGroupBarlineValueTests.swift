// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLGroupBarlineValueTests {
}

// MARK: -

extension MXLGroupBarlineValueTests {
    @Test
    func equality() {
        #expect(MXLGroupBarline.Value.yes == .yes)
    }

    @Test
    func hashable() {
        let values: Set<MXLGroupBarline.Value> = [.yes, .yes, .no]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLGroupBarline.Value.yes != .no)
    }
}
