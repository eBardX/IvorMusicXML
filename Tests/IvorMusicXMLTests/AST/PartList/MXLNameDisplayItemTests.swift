// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNameDisplayItemTests {
}

// MARK: -

extension MXLNameDisplayItemTests {
    @Test
    func equality() {
        let displayText = MXLFormattedText(value: "Violin")

        #expect(MXLNameDisplay.Item.displayText(displayText) == .displayText(displayText))
    }

    @Test
    func hashable() {
        let displayText = MXLNameDisplay.Item.displayText(MXLFormattedText(value: "Violin"))
        let accidentalText = MXLNameDisplay.Item.accidentalText(MXLAccidentalText(value: .sharp))
        let values: Set<MXLNameDisplay.Item> = [displayText, displayText, accidentalText]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let displayText = MXLNameDisplay.Item.displayText(MXLFormattedText(value: "Violin"))
        let accidentalText = MXLNameDisplay.Item.accidentalText(MXLAccidentalText(value: .sharp))

        #expect(displayText != accidentalText)
    }
}
