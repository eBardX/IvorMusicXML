// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLScoreTimewiseMeasureTests {
}

// MARK: -

extension MXLScoreTimewiseMeasureTests {
    @Test
    func equality() {
        #expect(MXLScoreTimewise.Measure(number: "1") == MXLScoreTimewise.Measure(number: "1"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLScoreTimewise.Measure> = [MXLScoreTimewise.Measure(number: "1"),
                                                     MXLScoreTimewise.Measure(number: "1"),
                                                     MXLScoreTimewise.Measure(number: "2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLScoreTimewise.Measure(number: "1") != MXLScoreTimewise.Measure(number: "2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLScoreTimewise.Measure(number: "1")

        #expect(value.id == nil)
        #expect(value.isImplicit == false)
        #expect(value.isNonControlling == false)
        #expect(value.number == "1")
        #expect(value.parts.isEmpty)
        #expect(value.text == nil)
        #expect(value.width == nil)
    }

    @Test
    func init_explicitValues() {
        let parts = [MXLScoreTimewise.Measure.Part(id: "P1")]
        let text = MXLMeasureText(stringValue: "1a")
        let value = MXLScoreTimewise.Measure(id: "m1",
                                             number: "1",
                                             isImplicit: true,
                                             isNonControlling: true,
                                             text: text,
                                             width: 100,
                                             parts: parts)

        #expect(value.id == "m1")
        #expect(value.isImplicit == true)
        #expect(value.isNonControlling == true)
        #expect(value.number == "1")
        #expect(value.parts == parts)
        #expect(value.text == text)
        #expect(value.width == 100)
    }
}
