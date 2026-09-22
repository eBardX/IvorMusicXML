// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNameDisplayTests {
}

// MARK: -

extension MXLNameDisplayTests {
    @Test
    func equality() {
        #expect(MXLNameDisplay() == MXLNameDisplay())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLNameDisplay> = [MXLNameDisplay(), MXLNameDisplay(), MXLNameDisplay(printsObject: false)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLNameDisplay() != MXLNameDisplay(printsObject: false))
    }

    @Test
    func init_defaultValues() {
        let value = MXLNameDisplay()

        #expect(value.items.isEmpty)
        #expect(value.printsObject == nil)
    }

    @Test
    func init_explicitValues() {
        let items: [MXLNameDisplay.Item] = [.displayText(MXLFormattedText(value: "Violin"))]
        let value = MXLNameDisplay(items: items, printsObject: false)

        #expect(value.items == items)
        #expect(value.printsObject == false)
    }
}
