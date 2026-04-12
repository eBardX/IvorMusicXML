// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPartListTests {
}

// MARK: -

extension MXLPartListTests {
    @Test
    func test_initSetsScoreParts() {
        let parts = [MXLScorePart(id: "P1",
                                  partName: "Piano"),
                     MXLScorePart(id: "P2",
                                  partName: "Violin")]
        let partList = MXLPartList(scoreParts: parts)

        #expect(partList.scoreParts.count == 2)
        #expect(partList.scoreParts[0].id == "P1")
        #expect(partList.scoreParts[1].partName == "Violin")
    }

    @Test
    func test_initWithEmptyScoreParts() {
        let partList = MXLPartList(scoreParts: [])

        #expect(partList.scoreParts.isEmpty)
    }
}
