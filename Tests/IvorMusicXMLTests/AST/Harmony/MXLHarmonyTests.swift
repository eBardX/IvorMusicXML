// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHarmonyTests {
}

// MARK: -

extension MXLHarmonyTests {
    @Test
    func equality() {
        #expect(MXLHarmony() == MXLHarmony())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLHarmony> = [MXLHarmony(), MXLHarmony(), MXLHarmony(id: "h2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHarmony() != MXLHarmony(id: "h2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLHarmony()

        #expect(value.arrangement == nil)
        #expect(value.chord.isEmpty)
        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.footnote == nil)
        #expect(value.frame == nil)
        #expect(value.id == nil)
        #expect(value.kind == nil)
        #expect(value.level == nil)
        #expect(value.offset == nil)
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.printsFrame == nil)
        #expect(value.printsObject == nil)
        #expect(value.staff == nil)
        #expect(value.system == nil)
    }

    @Test
    func init_explicitValues() {
        let chord = [MXLHarmony.Chord(content: .root(MXLRoot(step: MXLRoot.Step(value: .c))), kind: MXLHarmony.Chord.Kind(value: .major))]
        let frame = MXLFrame(strings: 6, frets: 4)
        let footnote = MXLFormattedText(value: "note")
        let level = MXLLevel(value: "1", display: MXLLevel.Display())
        let value = MXLHarmony(id: "h1",
                               chord: chord,
                               frame: frame,
                               offset: MXLOffset(value: 4),
                               footnote: footnote,
                               level: level,
                               staff: MXLStaff(uintValue: 1),
                               kind: .explicit,
                               printsObject: false,
                               printsFrame: true,
                               arrangement: .vertical,
                               position: MXLPosition(defaultX: 10),
                               font: MXLFont(style: .italic),
                               color: MXLColor(stringValue: "#800080"),
                               placement: .above,
                               system: .onlyTop)

        #expect(value.arrangement == .vertical)
        #expect(value.chord == chord)
        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.footnote == footnote)
        #expect(value.frame == frame)
        #expect(value.id == "h1")
        #expect(value.kind == .explicit)
        #expect(value.level == level)
        #expect(value.offset == MXLOffset(value: 4))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.printsFrame == true)
        #expect(value.printsObject == false)
        #expect(value.staff == MXLStaff(uintValue: 1))
        #expect(value.system == .onlyTop)
    }
}
