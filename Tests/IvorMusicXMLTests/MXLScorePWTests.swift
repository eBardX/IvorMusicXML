// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLScorePWTests {
}

// MARK: -

extension MXLScorePWTests {
    @Test
    func test_initSetsMovementNumber() {
        let score = MXLScorePW(work: nil,
                               movementNumber: "1",
                               movementTitle: nil,
                               partList: MXLPartList(scoreParts: []),
                               parts: [])

        #expect(score.movementNumber == "1")
    }

    @Test
    func test_initSetsMovementTitle() {
        let score = MXLScorePW(work: nil,
                               movementNumber: nil,
                               movementTitle: "Allegro",
                               partList: MXLPartList(scoreParts: []),
                               parts: [])

        #expect(score.movementTitle == "Allegro")
    }

    @Test
    func test_initSetsPartList() {
        let scoreParts = [MXLScorePart(id: "P1",
                                       partName: "Piano")]
        let score = MXLScorePW(work: nil,
                               movementNumber: nil,
                               movementTitle: nil,
                               partList: MXLPartList(scoreParts: scoreParts),
                               parts: [])

        #expect(score.partList.scoreParts.count == 1)
        #expect(score.partList.scoreParts[0].id == "P1")
    }

    @Test
    func test_initSetsParts() {
        let measure = MXLMeasurePW(number: "1",
                                   items: [])
        let part = MXLPartPW(id: "P1",
                             measures: [measure])
        let score = MXLScorePW(work: nil,
                               movementNumber: nil,
                               movementTitle: nil,
                               partList: MXLPartList(scoreParts: []),
                               parts: [part])

        #expect(score.parts.count == 1)
        #expect(score.parts[0].id == "P1")
    }

    @Test
    func test_initSetsWork() {
        let work = MXLWork(workNumber: "Op. 1",
                           workTitle: "Test")
        let score = MXLScorePW(work: work,
                               movementNumber: nil,
                               movementTitle: nil,
                               partList: MXLPartList(scoreParts: []),
                               parts: [])

        #expect(score.work?.workNumber == "Op. 1")
    }

    @Test
    func test_initWithNilOptionals() {
        let score = MXLScorePW(work: nil,
                               movementNumber: nil,
                               movementTitle: nil,
                               partList: MXLPartList(scoreParts: []),
                               parts: [])

        #expect(score.work == nil)
        #expect(score.movementNumber == nil)
        #expect(score.movementTitle == nil)
    }
}
