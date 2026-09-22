// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPartGroupTests {
}

// MARK: -

extension MXLPartGroupTests {
    @Test
    func equality() {
        #expect(MXLPartGroup(stretchesTimeSignature: false, kind: .start) ==    // swiftlint:disable:this identical_operands
                 MXLPartGroup(stretchesTimeSignature: false, kind: .start))
    }

    @Test
    func hashable() {
        let values: Set<MXLPartGroup> = [MXLPartGroup(stretchesTimeSignature: false, kind: .start),
                                         MXLPartGroup(stretchesTimeSignature: false, kind: .start),
                                         MXLPartGroup(stretchesTimeSignature: true, kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPartGroup(stretchesTimeSignature: false, kind: .start) !=
                 MXLPartGroup(stretchesTimeSignature: true, kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let value = MXLPartGroup(stretchesTimeSignature: false, kind: .start)

        #expect(value.abbreviation == nil)
        #expect(value.abbreviationDisplay == nil)
        #expect(value.barline == nil)
        #expect(value.footnote == nil)
        #expect(value.kind == .start)
        #expect(value.level == nil)
        #expect(value.name == nil)
        #expect(value.nameDisplay == nil)
        #expect(value.number == "1")
        #expect(value.stretchesTimeSignature == false)
        #expect(value.symbol == nil)
    }

    @Test
    func init_explicitValues() {
        let name = MXLGroupName(value: "Strings", text: MXLGroupName.Text())
        let nameDisplay = MXLNameDisplay()
        let abbreviation = MXLGroupName(value: "Str.", text: MXLGroupName.Text())
        let abbreviationDisplay = MXLNameDisplay(printsObject: false)
        let symbol = MXLGroupSymbol(value: .brace)
        let barline = MXLGroupBarline(value: .yes)
        let footnote = MXLFormattedText(value: "note")
        let level = MXLLevel(value: "1", display: MXLLevel.Display())
        let value = MXLPartGroup(name: name,
                                 nameDisplay: nameDisplay,
                                 abbreviation: abbreviation,
                                 abbreviationDisplay: abbreviationDisplay,
                                 symbol: symbol,
                                 barline: barline,
                                 stretchesTimeSignature: true,
                                 footnote: footnote,
                                 level: level,
                                 kind: .stop,
                                 number: "2")

        #expect(value.abbreviation == abbreviation)
        #expect(value.abbreviationDisplay == abbreviationDisplay)
        #expect(value.barline == barline)
        #expect(value.footnote == footnote)
        #expect(value.kind == .stop)
        #expect(value.level == level)
        #expect(value.name == name)
        #expect(value.nameDisplay == nameDisplay)
        #expect(value.number == "2")
        #expect(value.stretchesTimeSignature == true)
        #expect(value.symbol == symbol)
    }
}
