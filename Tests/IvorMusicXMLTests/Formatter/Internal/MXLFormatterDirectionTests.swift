// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLFormatterDirectionTests {
}

// MARK: -

extension MXLFormatterDirectionTests {
    @Test
    func format_roundTripsDirectionWithDynamicsAndFormattedText() throws {
        let dynamics = MXLDynamics(id: "DYN1",
                                   items: [.f,
                                           .sfz,
                                           .otherDynamics(MXLOtherText(value: "custom",
                                                                       smufl: "dynamicFF"))],
                                   placement: .below,
                                   underline: 1,
                                   overline: 2,
                                   lineThrough: 1,
                                   enclosure: .oval)
        let rehearsal = MXLFormattedTextID(id: "R1",
                                           value: "A",
                                           justify: .center,
                                           halign: .center,
                                           valign: .top,
                                           underline: 1,
                                           rotation: 45,
                                           letterSpacing: .number(2),
                                           xmlLang: "en",
                                           xmlSpace: .preserve,
                                           dir: .rtl,
                                           enclosure: .rectangle)
        let symbol = MXLFormattedSymbolID(value: "segno",
                                          justify: .left,
                                          enclosure: .circle)
        let words = MXLFormattedTextID(value: "dolce")
        let direction = MXLDirection(kind: [MXLDirection.Kind(content: .dynamics([dynamics])),
                                            MXLDirection.Kind(content: .rehearsal([rehearsal])),
                                            MXLDirection.Kind(content: .symbol(symbol)),
                                            MXLDirection.Kind(content: .words(words))])

        try expectRoundTrip(items: [.direction(direction)])
    }

    @Test
    func format_roundTripsDirectionWithGraphicalTypes() throws {
        let accordionRegistration = MXLAccordionRegistration(hasHighDot: true,
                                                             accordionMiddle: 2,
                                                             hasLowDot: false,
                                                             position: MXLPosition(defaultX: 10),
                                                             halign: .center,
                                                             valign: .top)
        let bracket = MXLBracket(id: "B1",
                                 kind: .start,
                                 number: 1,
                                 lineEnd: .down,
                                 endLength: 12,
                                 lineKind: .dashed,
                                 dashLength: 3,
                                 spaceLength: 2,
                                 color: "#FF0000")
        let dashes = MXLDashes(kind: .stop,
                               number: 2,
                               dashLength: 4)
        let harpPedals = MXLHarpPedals(pedalTuning: [MXLPedalTuning(pedalStep: .c,
                                                                    pedalAlter: -1),
                                                     MXLPedalTuning(pedalStep: .d,
                                                                    pedalAlter: 0)])
        let octaveShift = MXLOctaveShift(kind: .up,
                                         number: 1,
                                         size: 15,
                                         dashLength: 5)
        let pedal = MXLPedal(kind: .start,
                             number: 1,
                             usesLines: true,
                             usesSigns: false,
                             isAbbreviated: false)
        let wedge = MXLWedge(kind: .crescendo,
                             number: 1,
                             spread: 0,
                             isNiente: true,
                             lineKind: .solid)
        let direction = MXLDirection(id: "D1",
                                     kind: [MXLDirection.Kind(content: .accordionRegistration(accordionRegistration)),
                                            MXLDirection.Kind(id: "K2", content: .bracket(bracket)),
                                            MXLDirection.Kind(content: .coda([MXLCoda(smufl: "codaSquare"), MXLCoda(id: "C2")])),
                                            MXLDirection.Kind(content: .dashes(dashes)),
                                            MXLDirection.Kind(content: .harpPedals(harpPedals)),
                                            MXLDirection.Kind(content: .octaveShift(octaveShift)),
                                            MXLDirection.Kind(content: .pedal(pedal)),
                                            MXLDirection.Kind(content: .segno([MXLSegno(smufl: "segno")])),
                                            MXLDirection.Kind(content: .wedge(wedge))],
                                     offset: MXLOffset(value: 2,
                                                       affectsPlayback: true),
                                     voice: MXLVoice(voice: "1"),
                                     staff: 2,
                                     placement: .above,
                                     isDirective: true,
                                     system: .onlyTop)

        try expectRoundTrip(items: [.direction(direction)])
    }

    @Test
    func format_roundTripsDirectionWithImageMuteAndSound() throws {
        let image = MXLImage(id: "IMG1",
                             attributes: MXLImage.Attributes(source: "cover.png",
                                                             kind: "application/png",
                                                             height: 100,
                                                             width: 200,
                                                             halign: .center,
                                                             valign: .middle))
        let otherDirection = MXLOtherDirection(value: "custom",
                                               printsObject: true,
                                               smufl: "wiggleTrill")
        let principalVoice = MXLPrincipalVoice(value: "Hauptstimme",
                                               kind: .start,
                                               symbol: .hauptstimme)
        let damp = MXLEmptyPrintStyleAlignID(id: "DA1",
                                             printStyleAlign: MXLPrintStyleAlign(printStyle: MXLPrintStyle(position: MXLPosition(defaultY: 5)),
                                                                                 halign: .left,
                                                                                 valign: .middle))
        let eyeglasses = MXLEmptyPrintStyleAlignID(printStyleAlign: MXLPrintStyleAlign(printStyle: MXLPrintStyle()))
        let direction = MXLDirection(kind: [MXLDirection.Kind(content: .image(image)),
                                            MXLDirection.Kind(content: .otherDirection(otherDirection)),
                                            MXLDirection.Kind(content: .principalVoice(principalVoice)),
                                            MXLDirection.Kind(content: .staffDivide(MXLStaffDivide(kind: .upDown))),
                                            MXLDirection.Kind(content: .stringMute(MXLStringMute(isOn: true))),
                                            MXLDirection.Kind(content: .damp(damp)),
                                            MXLDirection.Kind(content: .eyeglasses(eyeglasses))],
                                     sound: MXLSound(id: "S1",
                                                     tempo: 120),
                                     placement: .below)

        try expectRoundTrip(items: [.direction(direction)])
    }

    @Test
    func format_roundTripsDirectionWithMetronomeArrows() throws {
        let tuplet = MXLMetronome.Note.Tuplet(timeModification: MXLTimeModification(actualNotes: 3,
                                                                                    normalNotes: 2,
                                                                                    group: MXLTimeModification.Group(normalKind: .eighth,
                                                                                                                     normalDot: 1)),
                                              kind: .start,
                                              hasBracket: true,
                                              showNumber: .actual)
        let note = MXLMetronome.Note(kind: .eighth,
                                     dot: 1,
                                     beam: [MXLMetronome.Note.Beam(value: .begin,
                                                                   number: 2)],
                                     tied: MXLMetronome.Note.Tied(kind: .start),
                                     tuplet: tuplet)
        let metronome = MXLMetronome(content: .metronomeArrows(hasMetronomeArrows: true,
                                                               note: [note],
                                                               relation: "equals",
                                                               secondNote: [note]))
        let direction = MXLDirection(kind: [MXLDirection.Kind(content: .metronome(metronome))])

        try expectRoundTrip(items: [.direction(direction)])
    }

    @Test
    func format_roundTripsDirectionWithMetronomeModulation() throws {
        let first = MXLBeatUnit(beatUnit: .half,
                                dot: 1)
        let second = MXLBeatUnit(beatUnit: .quarter,
                                 dot: 0)
        let tied = MXLMetronome.BeatUnitTied(beatUnit: .eighth,
                                             beatUnitDot: 2)
        let metronome = MXLMetronome(content: .beatUnit(first,
                                                        tied: [tied],
                                                        content: .beatUnit(second,
                                                                           tied: [])))
        let direction = MXLDirection(kind: [MXLDirection.Kind(content: .metronome(metronome))])

        try expectRoundTrip(items: [.direction(direction)])
    }

    @Test
    func format_roundTripsDirectionWithMetronomePerMinute() throws {
        let metronome = MXLMetronome(id: "M1",
                                     content: .beatUnit(MXLBeatUnit(beatUnit: .quarter,
                                                                    dot: 1),
                                                        tied: [],
                                                        content: .perMinute(MXLPerMinute(value: "120"))),
                                     position: MXLPosition(defaultX: 4),
                                     halign: .left,
                                     valign: .top,
                                     printsObject: true,
                                     justify: .center,
                                     hasParentheses: false)
        let direction = MXLDirection(kind: [MXLDirection.Kind(content: .metronome(metronome))])

        try expectRoundTrip(items: [.direction(direction)])
    }

    @Test
    func format_roundTripsDirectionWithPercussion() throws {
        let beater = MXLPercussion(id: "PC1",
                                   content: .beater(MXLBeater(value: .snareStick,
                                                              tip: .up)),
                                   position: MXLPosition(defaultX: 3),
                                   halign: .center,
                                   valign: .middle,
                                   enclosure: .oval)
        let effect = MXLPercussion(content: .effect(MXLEffect(value: .siren,
                                                              smufl: "pictSiren")))
        let glass = MXLPercussion(content: .glass(MXLGlass(value: .windChimes)))
        let membrane = MXLPercussion(content: .membrane(MXLMembrane(value: .congaDrum)))
        let metal = MXLPercussion(content: .metal(MXLMetal(value: .tamTamWithBeater)))
        let other = MXLPercussion(content: .otherPercussion(MXLOtherText(value: "custom",
                                                                         smufl: "pictOpen")))
        let pitched = MXLPercussion(content: .pitched(MXLPitched(value: .vibraphone)))
        let stick = MXLPercussion(content: .stick(MXLStick(kind: .yarn,
                                                           material: .medium,
                                                           tip: .northeast,
                                                           hasParentheses: true,
                                                           hasDashedCircle: false)))
        let stickLocation = MXLPercussion(content: .stickLocation(.cymbalBell))
        let timpani = MXLPercussion(content: .timpani(MXLTimpani(smufl: "pictTimpani")))
        let wood = MXLPercussion(content: .wood(MXLWood(value: .templeBlock)))
        let direction = MXLDirection(kind: [MXLDirection.Kind(content: .percussion([beater,
                                                                                    effect,
                                                                                    glass,
                                                                                    membrane,
                                                                                    metal,
                                                                                    other,
                                                                                    pitched,
                                                                                    stick,
                                                                                    stickLocation,
                                                                                    timpani,
                                                                                    wood]))])

        try expectRoundTrip(items: [.direction(direction)])
    }

    @Test
    func format_roundTripsDirectionWithScordatura() throws {
        let scordatura = MXLScordatura(id: "SC1",
                                       accord: [MXLAccord(tuning: MXLTuning(step: .e,
                                                                            alter: -1,
                                                                            octave: 4),
                                                          string: 1),
                                                MXLAccord(tuning: MXLTuning(step: .a,
                                                                            octave: 3))])
        let direction = MXLDirection(kind: [MXLDirection.Kind(content: .scordatura(scordatura))])

        try expectRoundTrip(items: [.direction(direction)])
    }

    @Test
    func format_roundTripsNoteNotationsDynamics() throws {
        let dynamics = MXLDynamics(items: [.mf,
                                           .otherDynamics(MXLOtherText(value: "x"))])
        let note = MXLNote(content: .regularNote(fullNote: MXLFullNote(isChord: false,
                                                                       content: .pitch(MXLPitch(step: .c,
                                                                                                octave: 4))),
                                                 duration: 4,
                                                 tie: []),
                           notations: [MXLNotations(items: [.dynamics(dynamics)])])

        try expectRoundTrip(items: [.note(note)])
    }
}
