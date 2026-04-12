// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMeasureTWTests {
}

// MARK: -

extension MXLMeasureTWTests {
    @Test
    func test_initSetsNumber() {
        let measure = MXLMeasureTW(number: "7",
                                   parts: [])

        #expect(measure.number == "7")
    }

    @Test
    func test_initSetsParts() {
        let part1 = MXLPartTW(id: "P1",
                              items: [])
        let part2 = MXLPartTW(id: "P2",
                              items: [])
        let measure = MXLMeasureTW(number: "1",
                                   parts: [part1, part2])

        #expect(measure.parts.count == 2)
        #expect(measure.parts[0].id == "P1")
        #expect(measure.parts[1].id == "P2")
    }

    @Test
    func test_initWithEmptyParts() {
        let measure = MXLMeasureTW(number: "1",
                                   parts: [])

        #expect(measure.parts.isEmpty)
    }
}
