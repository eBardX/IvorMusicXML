// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNotationsTests {
}

// MARK: -

extension MXLNotationsTests {
    @Test
    func equality() {
        #expect(MXLNotations() == MXLNotations())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLNotations> = [MXLNotations(), MXLNotations(), MXLNotations(id: "n2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLNotations() != MXLNotations(id: "n2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLNotations()

        #expect(value.footnote == nil)
        #expect(value.id == nil)
        #expect(value.items.isEmpty)
        #expect(value.level == nil)
        #expect(value.printsObject == nil)
    }

    @Test
    func init_explicitValues() {
        let footnote = MXLFormattedText(value: "note")
        let level = MXLLevel(value: "1", display: MXLLevel.Display())
        let items: [MXLNotations.Item] = [.arpeggiate(MXLArpeggiate())]
        let value = MXLNotations(id: "n1", footnote: footnote, level: level, items: items, printsObject: false)

        #expect(value.footnote == footnote)
        #expect(value.id == "n1")
        #expect(value.items == items)
        #expect(value.level == level)
        #expect(value.printsObject == false)
    }
}
