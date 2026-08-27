// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLScoreTimewiseMeasurePartTests {
}

// MARK: -

extension MXLScoreTimewiseMeasurePartTests {
    @Test
    func equality() {
        #expect(MXLScoreTimewise.Measure.Part(id: "P1") == MXLScoreTimewise.Measure.Part(id: "P1"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLScoreTimewise.Measure.Part> = [MXLScoreTimewise.Measure.Part(id: "P1"),
                                                          MXLScoreTimewise.Measure.Part(id: "P1"),
                                                          MXLScoreTimewise.Measure.Part(id: "P2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLScoreTimewise.Measure.Part(id: "P1") != MXLScoreTimewise.Measure.Part(id: "P2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLScoreTimewise.Measure.Part(id: "P1")

        #expect(value.id == "P1")
        #expect(value.items.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let items: [MXLMusicItem] = [.bookmark(MXLBookmark(id: "b1"))]
        let value = MXLScoreTimewise.Measure.Part(id: "P1", items: items)

        #expect(value.id == "P1")
        #expect(value.items == items)
    }
}
