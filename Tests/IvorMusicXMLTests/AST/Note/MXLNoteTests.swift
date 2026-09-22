// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNoteTests {
}

// MARK: -

extension MXLNoteTests {
    @Test
    func equality() {
        let content = MXLNote.Content.regularNoteCue(fullNote: MXLFullNote(isChord: false, content: .rest(MXLRest())),
                                                     duration: MXLPositiveDivisions(intValue: 4)!)    // swiftlint:disable:this force_unwrapping

        #expect(MXLNote(content: content) == MXLNote(content: content))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let content = MXLNote.Content.regularNoteCue(fullNote: MXLFullNote(isChord: false, content: .rest(MXLRest())),
                                                     duration: MXLPositiveDivisions(intValue: 4)!)    // swiftlint:disable:this force_unwrapping
        let values: Set<MXLNote> = [MXLNote(content: content), MXLNote(content: content), MXLNote(id: "n2", content: content)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let content = MXLNote.Content.regularNoteCue(fullNote: MXLFullNote(isChord: false, content: .rest(MXLRest())),
                                                     duration: MXLPositiveDivisions(intValue: 4)!)    // swiftlint:disable:this force_unwrapping

        #expect(MXLNote(content: content) != MXLNote(id: "n2", content: content))
    }

    @Test
    func init_defaultValues() {
        let content = MXLNote.Content.regularNoteCue(fullNote: MXLFullNote(isChord: false, content: .rest(MXLRest())),
                                                     duration: MXLPositiveDivisions(intValue: 4)!)    // swiftlint:disable:this force_unwrapping
        let value = MXLNote(content: content)

        #expect(value.accidental == nil)
        #expect(value.attack == nil)
        #expect(value.beam.isEmpty)
        #expect(value.color == nil)
        #expect(value.content == content)
        #expect(value.dot.isEmpty)
        #expect(value.dynamics == nil)
        #expect(value.endDynamics == nil)
        #expect(value.font == MXLFont())
        #expect(value.footnote == nil)
        #expect(value.id == nil)
        #expect(value.instrument.isEmpty)
        #expect(value.level == nil)
        #expect(value.listen == nil)
        #expect(value.lyric.isEmpty)
        #expect(value.notations.isEmpty)
        #expect(value.notehead == nil)
        #expect(value.noteheadText == nil)
        #expect(value.isPizzicato == nil)
        #expect(value.play == nil)
        #expect(value.printsLeger == true)
        #expect(value.printout == MXLPrintout())
        #expect(value.release == nil)
        #expect(value.staff == nil)
        #expect(value.stem == nil)
        #expect(value.timeModification == nil)
        #expect(value.timeOnly == nil)
        #expect(value.kind == nil)
        #expect(value.voice == nil)
        #expect(value.xPosition == MXLXPosition())
    }

    @Test
    func init_explicitValues() {
        let content = MXLNote.Content.regularNoteCue(fullNote: MXLFullNote(isChord: false, content: .rest(MXLRest())),
                                                     duration: MXLPositiveDivisions(intValue: 4)!)    // swiftlint:disable:this force_unwrapping
        let instrument = [MXLInstrument(id: "i1")]
        let footnote = MXLFormattedText(value: "note")
        let level = MXLLevel(value: "1", display: MXLLevel.Display())
        let voice = MXLVoice(voice: "1")
        let kind = MXLNote.Kind(value: .eighth, size: .cue)
        let dot = [MXLEmptyPlacement(printStyle: MXLPrintStyle())]
        let accidental = MXLAccidental(value: .sharp)
        let timeModification = MXLTimeModification(actualNotes: 3, normalNotes: 2)
        let stem = MXLStem(value: .up)
        let notehead = MXLNote.Notehead(value: .diamond, isFilled: true)
        let noteheadText = MXLNote.NoteheadText(items: [.displayText(MXLFormattedText(value: "1"))])
        let staff = MXLStaff(uintValue: 1)
        let beam = [MXLBeam(value: .begin)]
        let notations = [MXLNotations()]
        let lyric = [MXLLyric(content: .humming, endsLine: false, endsParagraph: false)]
        let play = MXLPlay()
        let listen = MXLListen()
        let xPosition = MXLXPosition(defaultX: 10)
        let printout = MXLPrintout(printsObject: false)
        let value = MXLNote(id: "n1",
                            content: content,
                            instrument: instrument,
                            footnote: footnote,
                            level: level,
                            voice: voice,
                            kind: kind,
                            dot: dot,
                            accidental: accidental,
                            timeModification: timeModification,
                            stem: stem,
                            notehead: notehead,
                            noteheadText: noteheadText,
                            staff: staff,
                            beam: beam,
                            notations: notations,
                            lyric: lyric,
                            play: play,
                            listen: listen,
                            xPosition: xPosition,
                            font: MXLFont(style: .italic),
                            color: MXLColor(stringValue: "#800080"),
                            printout: printout,
                            printsLeger: false,
                            dynamics: 90,
                            endDynamics: 80,
                            attack: MXLDivisions(intValue: 1),
                            release: MXLDivisions(intValue: 2),
                            timeOnly: [1],
                            isPizzicato: true)

        #expect(value.accidental == accidental)
        #expect(value.attack == MXLDivisions(intValue: 1))
        #expect(value.beam == beam)
        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.content == content)
        #expect(value.dot == dot)
        #expect(value.dynamics == 90)
        #expect(value.endDynamics == 80)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.footnote == footnote)
        #expect(value.id == "n1")
        #expect(value.instrument == instrument)
        #expect(value.level == level)
        #expect(value.listen == listen)
        #expect(value.lyric == lyric)
        #expect(value.notations == notations)
        #expect(value.notehead == notehead)
        #expect(value.noteheadText == noteheadText)
        #expect(value.isPizzicato == true)
        #expect(value.play == play)
        #expect(value.printsLeger == false)
        #expect(value.printout == printout)
        #expect(value.release == MXLDivisions(intValue: 2))
        #expect(value.staff == staff)
        #expect(value.stem == stem)
        #expect(value.timeModification == timeModification)
        #expect(value.timeOnly == [1])
        #expect(value.kind == kind)
        #expect(value.voice == voice)
        #expect(value.xPosition == xPosition)
    }

    @Test
    func init_kindDefaultSize_derivedFromGraceNoteContent() {
        let content = MXLNote.Content.graceNote(fullNote: MXLFullNote(isChord: false, content: .rest(MXLRest())),
                                                grace: MXLGrace(),
                                                tie: [])
        let value = MXLNote(content: content, kind: MXLNote.Kind(value: .eighth))

        #expect(value.kind?.size == .cue)
    }

    @Test
    func init_kindDefaultSize_derivedFromGraceNoteCueContent() {
        let content = MXLNote.Content.graceNoteCue(fullNote: MXLFullNote(isChord: false, content: .rest(MXLRest())), grace: MXLGrace())
        let value = MXLNote(content: content, kind: MXLNote.Kind(value: .eighth))

        #expect(value.kind?.size == .graceCue)
    }

    @Test
    func init_kindDefaultSize_derivedFromRegularNoteContent() {
        let content = MXLNote.Content.regularNote(fullNote: MXLFullNote(isChord: false, content: .rest(MXLRest())),
                                                  duration: MXLPositiveDivisions(intValue: 4)!,    // swiftlint:disable:this force_unwrapping
                                                  tie: [])
        let value = MXLNote(content: content, kind: MXLNote.Kind(value: .eighth))

        #expect(value.kind?.size == .full)
    }

    @Test
    func init_kindDefaultSize_derivedFromRegularNoteCueContent() {
        let content = MXLNote.Content.regularNoteCue(fullNote: MXLFullNote(isChord: false, content: .rest(MXLRest())),
                                                     duration: MXLPositiveDivisions(intValue: 4)!)    // swiftlint:disable:this force_unwrapping
        let value = MXLNote(content: content, kind: MXLNote.Kind(value: .eighth))

        #expect(value.kind?.size == .cue)
    }

    @Test
    func init_kindExplicitSize_preserved() {
        let content = MXLNote.Content.regularNoteCue(fullNote: MXLFullNote(isChord: false, content: .rest(MXLRest())),
                                                     duration: MXLPositiveDivisions(intValue: 4)!)    // swiftlint:disable:this force_unwrapping
        let value = MXLNote(content: content, kind: MXLNote.Kind(value: .eighth, size: .large))

        #expect(value.kind?.size == .large)
    }

    @Test
    func init_noteheadDefaultIsFilled_filledForShortNotes() {
        let content = MXLNote.Content.regularNoteCue(fullNote: MXLFullNote(isChord: false, content: .rest(MXLRest())),
                                                     duration: MXLPositiveDivisions(intValue: 4)!)    // swiftlint:disable:this force_unwrapping
        let value = MXLNote(content: content, kind: MXLNote.Kind(value: .quarter), notehead: MXLNote.Notehead(value: .normal))

        #expect(value.notehead?.isFilled == true)
    }

    @Test
    func init_noteheadDefaultIsFilled_hollowForLongNotes() {
        let content = MXLNote.Content.regularNoteCue(fullNote: MXLFullNote(isChord: false, content: .rest(MXLRest())),
                                                     duration: MXLPositiveDivisions(intValue: 4)!)    // swiftlint:disable:this force_unwrapping
        let value = MXLNote(content: content, kind: MXLNote.Kind(value: .whole), notehead: MXLNote.Notehead(value: .normal))

        #expect(value.notehead?.isFilled == false)
    }

    @Test
    func init_noteheadExplicitIsFilled_preserved() {
        let content = MXLNote.Content.regularNoteCue(fullNote: MXLFullNote(isChord: false, content: .rest(MXLRest())),
                                                     duration: MXLPositiveDivisions(intValue: 4)!)    // swiftlint:disable:this force_unwrapping
        let value = MXLNote(content: content, kind: MXLNote.Kind(value: .whole), notehead: MXLNote.Notehead(value: .normal, isFilled: true))

        #expect(value.notehead?.isFilled == true)
    }
}
