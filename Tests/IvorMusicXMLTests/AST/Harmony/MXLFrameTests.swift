// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFrameTests {
}

// MARK: -

extension MXLFrameTests {
    @Test
    func equality() {
        #expect(MXLFrame(strings: 6, frets: 4) == MXLFrame(strings: 6, frets: 4))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLFrame> = [MXLFrame(strings: 6, frets: 4), MXLFrame(strings: 6, frets: 4), MXLFrame(strings: 6, frets: 5)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLFrame(strings: 6, frets: 4) != MXLFrame(strings: 6, frets: 5))
    }

    @Test
    func init_defaultValues() {
        let value = MXLFrame(strings: 6, frets: 4)

        #expect(value.color == nil)
        #expect(value.firstFret == nil)
        #expect(value.frets == 4)
        #expect(value.halign == nil)
        #expect(value.height == nil)
        #expect(value.id == nil)
        #expect(value.note.isEmpty)
        #expect(value.position == MXLPosition())
        #expect(value.strings == 6)
        #expect(value.unplayed == nil)
        #expect(value.valign == nil)
        #expect(value.width == nil)
    }

    @Test
    func init_explicitValues() {
        let note = [MXLFrame.Note(string: MXLString(value: 1), fret: MXLFret(value: 0))]
        let firstFret = MXLFirstFret(value: 2)
        let value = MXLFrame(id: "f1",
                             strings: 6,
                             frets: 5,
                             firstFret: firstFret,
                             note: note,
                             position: MXLPosition(defaultX: 10),
                             color: MXLColor(stringValue: "#800080"),
                             halign: .center,
                             valign: .middle,
                             height: 32,
                             width: 45,
                             unplayed: "x")

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.firstFret == firstFret)
        #expect(value.frets == 5)
        #expect(value.halign == .center)
        #expect(value.height == 32)
        #expect(value.id == "f1")
        #expect(value.note == note)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.strings == 6)
        #expect(value.unplayed == "x")
        #expect(value.valign == .middle)
        #expect(value.width == 45)
    }
}
