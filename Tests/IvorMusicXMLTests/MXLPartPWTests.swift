// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPartPWTests {
}

// MARK: -

extension MXLPartPWTests {
    @Test
    func test_initSetsId() {
        let part = MXLPartPW(id: "P1",
                             measures: [])

        #expect(part.id == "P1")
    }

    @Test
    func test_initSetsMeasures() {
        let measure1 = MXLMeasurePW(number: "1",
                                    items: [])
        let measure2 = MXLMeasurePW(number: "2",
                                    items: [])
        let part = MXLPartPW(id: "P1",
                             measures: [measure1, measure2])

        #expect(part.measures.count == 2)
        #expect(part.measures[0].number == "1")
        #expect(part.measures[1].number == "2")
    }

    @Test
    func test_initWithEmptyMeasures() {
        let part = MXLPartPW(id: "P1",
                             measures: [])

        #expect(part.measures.isEmpty)
    }
}
