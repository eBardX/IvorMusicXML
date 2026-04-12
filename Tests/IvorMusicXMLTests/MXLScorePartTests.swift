// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLScorePartTests {
}

// MARK: -

extension MXLScorePartTests {
    @Test
    func test_initSetsId() {
        let part = MXLScorePart(id: "P1",
                                partName: "Piano")

        #expect(part.id == "P1")
    }

    @Test
    func test_initSetsPartName() {
        let part = MXLScorePart(id: "P1",
                                partName: "Violin")

        #expect(part.partName == "Violin")
    }
}
