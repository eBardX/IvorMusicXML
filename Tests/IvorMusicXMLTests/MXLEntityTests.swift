// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLEntityTests {
}

// MARK: -

extension MXLEntityTests {
    @Test
    func test_caseContainer() {
        let container = MXLContainer(rootFiles: [])
        let entity = MXLEntity.container(container)

        if case let .container(value) = entity {
            #expect(value.rootFiles.isEmpty)
        } else {
            Issue.record("Expected .container case")
        }
    }

    @Test
    func test_caseOpus() {
        let opus = MXLOpus(title: "Test Opus",
                           items: [])
        let entity = MXLEntity.opus(opus)

        if case let .opus(value) = entity {
            #expect(value.title == "Test Opus")
        } else {
            Issue.record("Expected .opus case")
        }
    }

    @Test
    func test_caseScorePartwise() {
        let partList = MXLPartList(scoreParts: [])
        let score = MXLScorePW(work: nil,
                               movementNumber: nil,
                               movementTitle: nil,
                               partList: partList,
                               parts: [])
        let entity = MXLEntity.scorePartwise(score)

        if case let .scorePartwise(value) = entity {
            #expect(value.partList.scoreParts.isEmpty)
        } else {
            Issue.record("Expected .scorePartwise case")
        }
    }

    @Test
    func test_caseScoreTimewise() {
        let partList = MXLPartList(scoreParts: [])
        let score = MXLScoreTW(work: nil,
                               movementNumber: nil,
                               movementTitle: nil,
                               partList: partList,
                               measures: [])
        let entity = MXLEntity.scoreTimewise(score)

        if case let .scoreTimewise(value) = entity {
            #expect(value.measures.isEmpty)
        } else {
            Issue.record("Expected .scoreTimewise case")
        }
    }

    @Test
    func test_caseSounds() {
        let sounds = [MXLStandardSound(id: "piano"),
                      MXLStandardSound(id: "guitar")]
        let entity = MXLEntity.sounds(sounds)

        if case let .sounds(value) = entity {
            #expect(value.count == 2)
            #expect(value[0].id == "piano")
            #expect(value[1].id == "guitar")
        } else {
            Issue.record("Expected .sounds case")
        }
    }
}
