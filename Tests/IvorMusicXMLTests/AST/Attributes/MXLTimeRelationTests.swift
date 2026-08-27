// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTimeRelationTests {
}

// MARK: -

extension MXLTimeRelationTests {
    @Test
    func equality() {
        #expect(MXLTimeRelation.bracket == .bracket)
        #expect(MXLTimeRelation.slash == .slash)
    }

    @Test
    func hashable() {
        let values: Set<MXLTimeRelation> = [.bracket, .bracket, .equals, .hyphen, .parentheses, .slash, .space]

        #expect(values.count == 6)
    }

    @Test
    func inequality() {
        #expect(MXLTimeRelation.bracket != .slash)
    }
}
