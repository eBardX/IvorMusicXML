// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSystemRelationNumberTests {
}

// MARK: -

extension MXLSystemRelationNumberTests {
    @Test
    func equality() {
        #expect(MXLSystemRelationNumber.onlyTop == .onlyTop)
    }

    @Test
    func hashable() {
        let values: Set<MXLSystemRelationNumber> = [.onlyTop, .onlyTop, .alsoTop]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSystemRelationNumber.onlyTop != .alsoTop)
    }
}
