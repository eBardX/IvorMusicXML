// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLScorePartwisePartMeasureTests {
}

// MARK: -

extension MXLScorePartwisePartMeasureTests {
    @Test
    func equality() {
        #expect(MXLScorePartwise.Part.Measure(number: "1") == MXLScorePartwise.Part.Measure(number: "1"))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLScorePartwise.Part.Measure> = [MXLScorePartwise.Part.Measure(number: "1"),
                                                          MXLScorePartwise.Part.Measure(number: "1"),
                                                          MXLScorePartwise.Part.Measure(number: "2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLScorePartwise.Part.Measure(number: "1") != MXLScorePartwise.Part.Measure(number: "2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLScorePartwise.Part.Measure(number: "1")

        #expect(value.id == nil)
        #expect(value.isImplicit == false)
        #expect(value.isNonControlling == false)
        #expect(value.items.isEmpty)
        #expect(value.number == "1")
        #expect(value.text == nil)
        #expect(value.width == nil)
    }

    @Test
    func init_explicitValues() {
        let items: [MXLMusicItem] = [.bookmark(MXLBookmark(id: "b1"))]
        let text = MXLMeasureText(stringValue: "1a")
        let value = MXLScorePartwise.Part.Measure(id: "m1",
                                                  number: "1",
                                                  isImplicit: true,
                                                  isNonControlling: true,
                                                  text: text,
                                                  width: 100,
                                                  items: items)

        #expect(value.id == "m1")
        #expect(value.isImplicit == true)
        #expect(value.isNonControlling == true)
        #expect(value.items == items)
        #expect(value.number == "1")
        #expect(value.text == text)
        #expect(value.width == 100)
    }
}
