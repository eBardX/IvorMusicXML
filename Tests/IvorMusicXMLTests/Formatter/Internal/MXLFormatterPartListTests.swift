// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLFormatterPartListTests {
}

// MARK: -

extension MXLFormatterPartListTests {
    @Test
    func format_roundTripsRichPartGroup() throws {
        let nameDisplay = MXLNameDisplay(items: [.accidentalText(MXLAccidentalText(value: .sharp)),
                                                 .displayText(MXLFormattedText(value: "Str."))],
                                         printsObject: true)
        let partGroup = MXLPartGroup(name: MXLGroupName(value: "Strings",
                                                        text: MXLGroupName.Text()),
                                     nameDisplay: nameDisplay,
                                     abbreviation: MXLGroupName(value: "Str.",
                                                                text: MXLGroupName.Text()),
                                     symbol: MXLGroupSymbol(value: .bracket),
                                     barline: MXLGroupBarline(value: .yes),
                                     stretchesTimeSignature: true,
                                     footnote: MXLFormattedText(value: "editorial"),
                                     level: MXLLevel(value: "*",
                                                     display: MXLLevel.Display()),
                                     kind: .start,
                                     number: "2")
        let document = document(partListItems: [.partGroup(partGroup),
                                                scorePart(),
                                                .partGroup(MXLPartGroup(stretchesTimeSignature: false,
                                                                        kind: .stop,
                                                                        number: "2"))])

        let data = try MXLFormatter().format(document,
                                             compressed: false)
        let (reparsed, _) = try MXLParser().parse(data,
                                                  compressed: false)

        #expect(reparsed.content == document.content)
    }
}
