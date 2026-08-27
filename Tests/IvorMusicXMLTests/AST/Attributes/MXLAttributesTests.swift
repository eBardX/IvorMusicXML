// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLAttributesTests {
}

// MARK: -

extension MXLAttributesTests {
    @Test
    func equality() {
        let content = MXLAttributes.Content.forPart([])

        #expect(MXLAttributes(content: content) == MXLAttributes(content: content))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let content1 = MXLAttributes.Content.forPart([])
        let content2 = MXLAttributes.Content.transpose([])
        let values: Set<MXLAttributes> = [MXLAttributes(content: content1),
                                          MXLAttributes(content: content1),
                                          MXLAttributes(content: content2)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let content1 = MXLAttributes.Content.forPart([])
        let content2 = MXLAttributes.Content.transpose([])

        #expect(MXLAttributes(content: content1) != MXLAttributes(content: content2))
    }

    @Test
    func init_defaultValues() {
        let content = MXLAttributes.Content.forPart([])
        let value = MXLAttributes(content: content)

        #expect(value.clef.isEmpty)
        #expect(value.content == content)
        #expect(value.directive.isEmpty)
        #expect(value.divisions == nil)
        #expect(value.footnote == nil)
        #expect(value.instruments == nil)
        #expect(value.key.isEmpty)
        #expect(value.level == nil)
        #expect(value.measureStyle.isEmpty)
        #expect(value.partSymbol == nil)
        #expect(value.staffDetails.isEmpty)
        #expect(value.staves == nil)
        #expect(value.time.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let content = MXLAttributes.Content.forPart([])
        let footnote = MXLFormattedText(value: "note")
        let level = MXLLevel(value: "1", display: MXLLevel.Display())
        let divisions = MXLPositiveDivisions(intValue: 4)
        let fifths = MXLFifths(intValue: 2)!    // swiftlint:disable:this force_unwrapping
        let key = [MXLKey(content: .traditionalKey(MXLTraditionalKey(fifths: fifths)))]
        let time = [MXLTime(content: .senzaMisura("X"))]
        let partSymbol = MXLPartSymbol(value: .brace)
        let clef = [MXLClef(content: MXLClef.Content(sign: .g))]
        let staffDetails = [MXLStaffDetails()]
        let directive = [MXLAttributes.Directive(value: "Allegro")]
        let measureStyle = [MXLMeasureStyle(content: .multipleRest(MXLMultipleRest(value: 4)))]
        let value = MXLAttributes(footnote: footnote,
                                  level: level,
                                  divisions: divisions,
                                  key: key,
                                  time: time,
                                  staves: 2,
                                  partSymbol: partSymbol,
                                  instruments: 2,
                                  clef: clef,
                                  staffDetails: staffDetails,
                                  content: content,
                                  directive: directive,
                                  measureStyle: measureStyle)

        #expect(value.clef == clef)
        #expect(value.content == content)
        #expect(value.directive == directive)
        #expect(value.divisions == divisions)
        #expect(value.footnote == footnote)
        #expect(value.instruments == 2)
        #expect(value.key == key)
        #expect(value.level == level)
        #expect(value.measureStyle == measureStyle)
        #expect(value.partSymbol == partSymbol)
        #expect(value.staffDetails == staffDetails)
        #expect(value.staves == 2)
        #expect(value.time == time)
    }
}
