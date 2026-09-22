// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSystemRelationTests {
}

// MARK: -

extension MXLSystemRelationTests {
    @Test
    func equality() {
        #expect(MXLSystemRelation.onlyTop == .onlyTop)
    }

    @Test
    func hashable() {
        let values: Set<MXLSystemRelation> = [.onlyTop, .onlyTop, .alsoTop]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSystemRelation.onlyTop != .alsoTop)
    }
}
