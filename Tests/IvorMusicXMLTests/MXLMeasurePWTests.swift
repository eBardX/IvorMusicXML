// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMeasurePWTests {
}

// MARK: -

extension MXLMeasurePWTests {
    @Test
    func test_initSetsItems() {
        let note = MXLNote(isChord: false,
                           value: .rest,
                           duration: 480,
                           ties: [])
        let measure = MXLMeasurePW(number: "1",
                                   items: [.note(note),
                                           .attributes(4)])

        #expect(measure.items.count == 2)
    }

    @Test
    func test_initSetsNumber() {
        let measure = MXLMeasurePW(number: "42",
                                   items: [])

        #expect(measure.number == "42")
    }

    @Test
    func test_initWithEmptyItems() {
        let measure = MXLMeasurePW(number: "1",
                                   items: [])

        #expect(measure.items.isEmpty)
    }
}
