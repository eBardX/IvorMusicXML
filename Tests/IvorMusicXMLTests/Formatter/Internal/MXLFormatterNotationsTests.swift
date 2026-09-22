// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLFormatterNotationsTests {
}

// MARK: -

extension MXLFormatterNotationsTests {
    @Test
    func format_roundTripsArticulationsAndSpanners() throws {
        let otherArticulation = MXLOtherPlacementText(value: "art", printStyle: MXLPrintStyle(), placement: .above)
        let articulationItems: [MXLArticulations.Item] = [.accent(position: MXLPosition(), font: MXLFont(), color: nil, placement: .above),
                                                          .staccato(position: MXLPosition(), font: MXLFont(), color: "#112233", placement: .below),
                                                          .doit(MXLEmptyLine(kind: .dashed, length: .medium, printStyle: MXLPrintStyle())),
                                                          .otherArticulation(otherArticulation),
                                                          .strongAccent(MXLStrongAccent(kind: .up)),
                                                          .breathMark(MXLBreathMark(value: .comma)),
                                                          .caesura(MXLCaesura(value: .normal))]
        let articulations = MXLArticulations(items: articulationItems)
        let actual = MXLTuplet.Portion(number: MXLTuplet.Portion.Number(value: 3),
                                       kind: MXLTuplet.Portion.Kind(value: .eighth),
                                       dot: [MXLTuplet.Portion.Dot()])
        let normal = MXLTuplet.Portion(number: MXLTuplet.Portion.Number(value: 2),
                                       kind: MXLTuplet.Portion.Kind(value: .eighth))
        let tuplet = MXLTuplet(actual: actual,
                               normal: normal,
                               kind: .start,
                               hasBracket: true,
                               showNumber: .both,
                               lineShape: .curved)
        let bendSound = MXLBendSound(accelerates: true,
                                     beats: 3)
        let items: [MXLNotations.Item] = [.articulations(articulations),
                                          .tied(MXLTied(kind: .start, orientation: .over)),
                                          .slur(MXLSlur(kind: .start, lineKind: .dotted, placement: .above)),
                                          .glissando(MXLGlissando(value: "gliss", kind: .start, lineKind: .wavy)),
                                          .slide(MXLSlide(value: "", kind: .start, bendSound: bendSound)),
                                          .tuplet(tuplet),
                                          .fermata(MXLFermata(value: .normal, kind: .inverted)),
                                          .arpeggiate(MXLArpeggiate(direction: .up, isUnbroken: true)),
                                          .nonArpeggiate(MXLNonArpeggiate(kind: .bottom)),
                                          .accidentalMark(MXLAccidentalMark(value: .sharp, placement: .above)),
                                          .otherNotation(MXLOtherNotation(value: "on", kind: .single))]

        try expectRoundTrip(items: items)
    }

    @Test
    func format_roundTripsOrnaments() throws {
        let trillSound = MXLTrillSound(startNote: .main,
                                       trillStep: .whole,
                                       twoNoteTurn: .half,
                                       accelerates: true,
                                       beats: 4,
                                       secondBeat: 50,
                                       lastBeat: 75)
        let mordent = MXLMordent(placement: .above,
                                 isLong: true,
                                 approach: .above,
                                 departure: .below)
        let tremoloMarks: MXLTremoloMarks = 3
        let tremolo = MXLTremolo(value: tremoloMarks,
                                 kind: .single)
        let schleifer = MXLOrnaments.Content.schleifer(position: MXLPosition(), font: MXLFont(), color: nil, placement: .below)
        let otherOrnament = MXLOrnaments.Content.otherOrnament(MXLOtherPlacementText(value: "orn", printStyle: MXLPrintStyle()))
        let items: [MXLNotations.Item] = [.ornaments(MXLOrnaments(content: .mordent(mordent),
                                                                  accidentalMark: [MXLAccidentalMark(value: .flat)])),
                                          .ornaments(MXLOrnaments(content: .invertedMordent(MXLMordent(isLong: false)))),
                                          .ornaments(MXLOrnaments(content: .tremolo(tremolo))),
                                          .ornaments(MXLOrnaments(content: .wavyLine(MXLWavyLine(kind: .start, trillSound: trillSound)))),
                                          .ornaments(MXLOrnaments(content: .turn(MXLHorizontalTurn(isSlashed: true)))),
                                          .ornaments(MXLOrnaments(content: .delayedTurn(MXLHorizontalTurn()))),
                                          .ornaments(MXLOrnaments(content: .haydn(MXLEmptyTrillSound()))),
                                          .ornaments(MXLOrnaments(content: .trillMark(MXLEmptyTrillSound(placement: .above)))),
                                          .ornaments(MXLOrnaments(content: schleifer)),
                                          .ornaments(MXLOrnaments(content: otherOrnament))]

        try expectRoundTrip(items: items)
    }

    @Test
    func format_roundTripsTechnical() throws {
        let release = MXLRelease(offset: 2)
        let bend = MXLBend(alter: 1,
                           content: .release(release),
                           withBar: MXLPlacementText(value: "bar", printStyle: MXLPrintStyle()),
                           shape: .angled,
                           sound: MXLBendSound(accelerates: true))
        let hole = MXLHole(kind: "circle",
                           closed: MXLHole.Closed(value: .half, location: .top),
                           shape: "circle")
        let items: [MXLTechnical.Item] = [.arrow(MXLArrow(content: .arrowDirection(.up, style: .single, hasArrowhead: true))),
                                          .arrow(MXLArrow(content: .circularArrow(.clockwise))),
                                          .bend(bend),
                                          .brassBend(position: MXLPosition(), font: MXLFont(), color: nil, placement: .above),
                                          .doubleTongue(position: MXLPosition(), font: MXLFont(), color: nil, placement: nil),
                                          .fingering(MXLFingering(value: "1", isSubstitute: true, isAlternate: false)),
                                          .fret(MXLFret(value: 5)),
                                          .halfMuted(position: MXLPosition(), font: MXLFont(), color: nil, placement: .above, smufl: nil),
                                          .hammerOn(MXLHammerOnPullOff(value: "H", kind: .start)),
                                          .handbell(MXLHandbell(value: .echo)),
                                          .harmonMute(MXLHarmonMute(harmonClosed: MXLHarmonClosed(value: .yes, location: .top))),
                                          .harmonic(MXLHarmonic(content: .natural, content2: .soundingPitch, printsObject: true)),
                                          .heel(MXLHeelToe(isSubstitute: true)),
                                          .hole(hole),
                                          .open(position: MXLPosition(), font: MXLFont(), color: nil, placement: nil, smufl: nil),
                                          .otherTechnical(MXLOtherPlacementText(value: "tech", printStyle: MXLPrintStyle())),
                                          .pluck(MXLPlacementText(value: "p", printStyle: MXLPrintStyle())),
                                          .pullOff(MXLHammerOnPullOff(value: "P", kind: .stop)),
                                          .string(MXLString(value: 3)),
                                          .tap(MXLTap(value: "T", hand: .left)),
                                          .toe(MXLHeelToe()),
                                          .upBow(position: MXLPosition(), font: MXLFont(), color: nil, placement: .above)]

        try expectRoundTrip(items: [.technical(MXLTechnical(items: items))])
    }
}
