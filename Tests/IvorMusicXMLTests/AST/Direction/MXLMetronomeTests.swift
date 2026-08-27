// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMetronomeTests {
}

// MARK: -

extension MXLMetronomeTests {
    @Test
    func equality() {
        let content = MXLMetronome.Content.metronomeArrows(hasMetronomeArrows: true, note: [], relation: nil, secondNote: [])

        #expect(MXLMetronome(content: content) == MXLMetronome(content: content))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let content = MXLMetronome.Content.metronomeArrows(hasMetronomeArrows: true, note: [], relation: nil, secondNote: [])
        let values: Set<MXLMetronome> = [MXLMetronome(content: content), MXLMetronome(content: content), MXLMetronome(id: "m2", content: content)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let content = MXLMetronome.Content.metronomeArrows(hasMetronomeArrows: true, note: [], relation: nil, secondNote: [])

        #expect(MXLMetronome(content: content) != MXLMetronome(id: "m2", content: content))
    }

    @Test
    func init_defaultValues() {
        let content = MXLMetronome.Content.metronomeArrows(hasMetronomeArrows: true, note: [], relation: nil, secondNote: [])
        let value = MXLMetronome(content: content)

        #expect(value.color == nil)
        #expect(value.content == content)
        #expect(value.font == MXLFont())
        #expect(value.halign == nil)
        #expect(value.id == nil)
        #expect(value.justify == nil)
        #expect(value.hasParentheses == false)
        #expect(value.position == MXLPosition())
        #expect(value.printsObject == nil)
        #expect(value.valign == nil)
    }

    @Test
    func init_explicitValues() {
        let content = MXLMetronome.Content.metronomeArrows(hasMetronomeArrows: true, note: [], relation: nil, secondNote: [])
        let value = MXLMetronome(id: "m1",
                                 content: content,
                                 position: MXLPosition(defaultX: 10),
                                 font: MXLFont(style: .italic),
                                 color: MXLColor(stringValue: "#800080"),
                                 halign: .center,
                                 valign: .middle,
                                 printsObject: false,
                                 justify: .right,
                                 hasParentheses: true)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.content == content)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.halign == .center)
        #expect(value.id == "m1")
        #expect(value.justify == .right)
        #expect(value.hasParentheses == true)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.printsObject == false)
        #expect(value.valign == .middle)
    }
}
