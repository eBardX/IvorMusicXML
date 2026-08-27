// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOrnamentsTests {
}

// MARK: -

extension MXLOrnamentsTests {
    @Test
    func equality() {
        let content = MXLOrnaments.Content.trillMark(MXLEmptyTrillSound())

        #expect(MXLOrnaments(content: content) == MXLOrnaments(content: content))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let content = MXLOrnaments.Content.trillMark(MXLEmptyTrillSound())
        let values: Set<MXLOrnaments> = [MXLOrnaments(content: content), MXLOrnaments(content: content), MXLOrnaments(id: "o2", content: content)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let content = MXLOrnaments.Content.trillMark(MXLEmptyTrillSound())

        #expect(MXLOrnaments(content: content) != MXLOrnaments(id: "o2", content: content))
    }

    @Test
    func init_defaultValues() {
        let content = MXLOrnaments.Content.trillMark(MXLEmptyTrillSound())
        let value = MXLOrnaments(content: content)

        #expect(value.accidentalMark.isEmpty)
        #expect(value.content == content)
        #expect(value.id == nil)
    }

    @Test
    func init_explicitValues() {
        let content = MXLOrnaments.Content.trillMark(MXLEmptyTrillSound())
        let accidentalMark = [MXLAccidentalMark(value: .sharp)]
        let value = MXLOrnaments(id: "o1", content: content, accidentalMark: accidentalMark)

        #expect(value.accidentalMark == accidentalMark)
        #expect(value.content == content)
        #expect(value.id == "o1")
    }
}
