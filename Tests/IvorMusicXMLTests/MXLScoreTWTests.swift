// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLScoreTWTests {
}

// MARK: -

extension MXLScoreTWTests {
    @Test
    func test_initSetsMeasures() {
        let partTW = MXLPartTW(id: "P1",
                               items: [])
        let measure = MXLMeasureTW(number: "1",
                                   parts: [partTW])
        let score = MXLScoreTW(work: nil,
                               movementNumber: nil,
                               movementTitle: nil,
                               partList: MXLPartList(scoreParts: []),
                               measures: [measure])

        #expect(score.measures.count == 1)
        #expect(score.measures[0].number == "1")
    }

    @Test
    func test_initSetsMovementNumber() {
        let score = MXLScoreTW(work: nil,
                               movementNumber: "3",
                               movementTitle: nil,
                               partList: MXLPartList(scoreParts: []),
                               measures: [])

        #expect(score.movementNumber == "3")
    }

    @Test
    func test_initSetsMovementTitle() {
        let score = MXLScoreTW(work: nil,
                               movementNumber: nil,
                               movementTitle: "Presto",
                               partList: MXLPartList(scoreParts: []),
                               measures: [])

        #expect(score.movementTitle == "Presto")
    }

    @Test
    func test_initSetsWork() {
        let work = MXLWork(workNumber: nil,
                           workTitle: "Concerto")
        let score = MXLScoreTW(work: work,
                               movementNumber: nil,
                               movementTitle: nil,
                               partList: MXLPartList(scoreParts: []),
                               measures: [])

        #expect(score.work?.workTitle == "Concerto")
    }

    @Test
    func test_initWithNilOptionals() {
        let score = MXLScoreTW(work: nil,
                               movementNumber: nil,
                               movementTitle: nil,
                               partList: MXLPartList(scoreParts: []),
                               measures: [])

        #expect(score.work == nil)
        #expect(score.movementNumber == nil)
        #expect(score.movementTitle == nil)
    }
}
