// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStaffDetailsKindTests {
}

// MARK: -

extension MXLStaffDetailsKindTests {
    @Test
    func equality() {
        #expect(MXLStaffDetails.Kind.cue == .cue)
        #expect(MXLStaffDetails.Kind.regular == .regular)
    }

    @Test
    func hashable() {
        let values: Set<MXLStaffDetails.Kind> = [.alternate, .alternate, .cue, .editorial, .ossia, .regular]

        #expect(values.count == 5)
    }

    @Test
    func inequality() {
        #expect(MXLStaffDetails.Kind.cue != .regular)
    }
}
