// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLScorePartwisePartTests {
}

// MARK: -

extension MXLScorePartwisePartTests {
    @Test
    func equality() {
        #expect(MXLScorePartwise.Part(id: "P1") == MXLScorePartwise.Part(id: "P1"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLScorePartwise.Part> = [MXLScorePartwise.Part(id: "P1"), MXLScorePartwise.Part(id: "P1"), MXLScorePartwise.Part(id: "P2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLScorePartwise.Part(id: "P1") != MXLScorePartwise.Part(id: "P2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLScorePartwise.Part(id: "P1")

        #expect(value.id == "P1")
        #expect(value.measures.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let measures = [MXLScorePartwise.Part.Measure(number: "1")]
        let value = MXLScorePartwise.Part(id: "P1", measures: measures)

        #expect(value.id == "P1")
        #expect(value.measures == measures)
    }
}
