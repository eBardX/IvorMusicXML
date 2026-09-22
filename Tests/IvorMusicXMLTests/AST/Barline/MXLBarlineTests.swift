// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBarlineTests {
}

// MARK: -

extension MXLBarlineTests {
    @Test
    func equality() {
        #expect(MXLBarline() == MXLBarline())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLBarline> = [MXLBarline(), MXLBarline(), MXLBarline(id: "b2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBarline() != MXLBarline(id: "b2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLBarline()

        #expect(value.barStyle == nil)
        #expect(value.coda == nil)
        #expect(value.codaAttribute == nil)
        #expect(value.divisions == nil)
        #expect(value.ending == nil)
        #expect(value.fermata.isEmpty)
        #expect(value.footnote == nil)
        #expect(value.id == nil)
        #expect(value.level == nil)
        #expect(value.location == .right)
        #expect(value.repeat == nil)
        #expect(value.segno == nil)
        #expect(value.segnoAttribute == nil)
        #expect(value.wavyLine == nil)
    }

    @Test
    func init_explicitValues() {
        let barStyle = MXLBarline.StyleColor(value: .regular)
        let footnote = MXLFormattedText(value: "note")
        let level = MXLLevel(value: "1", display: MXLLevel.Display())
        let wavyLine = MXLWavyLine(kind: .start)
        let segno = MXLSegno()
        let coda = MXLCoda()
        let fermata = [MXLFermata(value: .normal)]
        let ending = MXLEnding(value: "1.", number: [1], kind: .start)
        let repeatMark = MXLRepeat(direction: .forward)
        let divisions = MXLDivisions(intValue: 4)
        let value = MXLBarline(id: "b1",
                               barStyle: barStyle,
                               footnote: footnote,
                               level: level,
                               wavyLine: wavyLine,
                               segno: segno,
                               coda: coda,
                               fermata: fermata,
                               ending: ending,
                               repeat: repeatMark,
                               location: .left,
                               segnoAttribute: "segno1",
                               codaAttribute: "coda1",
                               divisions: divisions)

        #expect(value.barStyle == barStyle)
        #expect(value.coda == coda)
        #expect(value.codaAttribute == "coda1")
        #expect(value.divisions == divisions)
        #expect(value.ending == ending)
        #expect(value.fermata == fermata)
        #expect(value.footnote == footnote)
        #expect(value.id == "b1")
        #expect(value.level == level)
        #expect(value.location == .left)
        #expect(value.repeat == repeatMark)
        #expect(value.segno == segno)
        #expect(value.segnoAttribute == "segno1")
        #expect(value.wavyLine == wavyLine)
    }
}
