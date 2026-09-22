// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLFormatterHarmonyTests {
}

// MARK: -

extension MXLFormatterHarmonyTests {
    @Test
    func format_roundTripsChordSymbolHarmonyWithFrame() throws {
        let root = MXLRoot(step: MXLRoot.Step(value: .c,
                                              text: "C",
                                              color: "#112233"),
                           alter: MXLHarmonyAlter(value: 1,
                                                  printsObject: true,
                                                  location: .left))
        let bass = MXLBass(separator: MXLStyleText(value: "/",
                                                   printStyle: MXLPrintStyle()),
                           step: MXLBass.Step(value: .g),
                           alter: MXLHarmonyAlter(value: -1),
                           arrangement: .vertical)
        let degree = MXLDegree(value: MXLDegree.Value(value: 7,
                                                      symbol: .major,
                                                      text: "7"),
                               alter: MXLDegree.Alter(value: -1,
                                                      usesPlusMinus: true),
                               kind: MXLDegree.Kind(value: .add,
                                                    text: "add"),
                               printsObject: true)
        let kind1 = MXLHarmony.Chord.Kind(value: .major,
                                          usesSymbols: false,
                                          text: "maj",
                                          areDegreesStacked: true,
                                          areDegreesInParentheses: false,
                                          areDegreesBracketed: true,
                                          halign: .center,
                                          valign: .middle)
        let kind2 = MXLHarmony.Chord.Kind(value: .dominantNinth)
        let chord1 = MXLHarmony.Chord(content: .root(root),
                                      kind: kind1,
                                      inversion: MXLInversion(value: 1,
                                                              text: "1"),
                                      bass: bass,
                                      degree: [degree])
        let chord2 = MXLHarmony.Chord(content: .root(root),
                                      kind: kind2,
                                      inversion: MXLInversion(value: 1,
                                                              text: "1"),
                                      bass: bass,
                                      degree: [degree])
        let frameNote = MXLFrame.Note(string: MXLString(value: 6),
                                      fret: MXLFret(value: 0),
                                      fingering: MXLFingering(value: "1"),
                                      barre: MXLBarre(kind: .start,
                                                      color: "#445566"))
        let frame = MXLFrame(id: "F1",
                             strings: 6,
                             frets: 4,
                             firstFret: MXLFirstFret(value: 1,
                                                     text: "1",
                                                     location: .right),
                             note: [frameNote],
                             halign: .left,
                             valign: .top,
                             height: 20,
                             width: 15,
                             unplayed: "x")
        let harmony = MXLHarmony(id: "H1",
                                 chord: [chord1, chord2],
                                 frame: frame,
                                 offset: MXLOffset(value: 2,
                                                   affectsPlayback: true),
                                 staff: 1,
                                 kind: .explicit,
                                 printsObject: true,
                                 printsFrame: false,
                                 arrangement: .horizontal,
                                 color: "#778899",
                                 placement: .above,
                                 system: .onlyTop)

        try expectRoundTrip(items: [.harmony(harmony)])
    }

    @Test
    func format_roundTripsNumeralFunctionAndFiguredBass() throws {
        let numeral = MXLNumeral(root: MXLNumeral.Root(value: 5,
                                                       text: "V"),
                                 alter: MXLHarmonyAlter(value: 1),
                                 key: MXLNumeral.Key(fifths: -3,
                                                     mode: .naturalMinor,
                                                     printsObject: true))
        let numeralHarmony = MXLHarmony(chord: [MXLHarmony.Chord(content: .numeral(numeral),
                                                                 kind: MXLHarmony.Chord.Kind(value: .dominant))])
        let functionHarmony = MXLHarmony(chord: [MXLHarmony.Chord(content: .function(MXLStyleText(value: "V",
                                                                                                  printStyle: MXLPrintStyle())),
                                                                  kind: MXLHarmony.Chord.Kind(value: .major))])
        let figure = MXLFigure(prefix: MXLStyleText(value: "#",
                                                    printStyle: MXLPrintStyle()),
                               number: MXLStyleText(value: "6",
                                                    printStyle: MXLPrintStyle()),
                               suffix: MXLStyleText(value: "\\",
                                                    printStyle: MXLPrintStyle()),
                               extend: MXLExtend(kind: .start))
        let figuredBass = MXLFiguredBass(id: "FB1",
                                         figure: [figure],
                                         duration: 4,
                                         halign: .center,
                                         valign: .baseline,
                                         placement: .below,
                                         hasParentheses: true)

        try expectRoundTrip(items: [.harmony(numeralHarmony),
                                    .harmony(functionHarmony),
                                    .figuredBass(figuredBass)])
    }
}
