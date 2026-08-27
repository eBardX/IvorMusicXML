// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

// Tests for the `MXLValidator` conformance checks — the `MXLValidator.Issue`
// catalogue and the fact that a well-formed score trips none of them.
struct MXLValidatorCheckerTests {
}

// MARK: -

extension MXLValidatorCheckerTests {
    @Test
    func message_isNeverEmpty() {
        let allCases: [MXLValidator.Issue] = [.danglingPartID("P1"),
                                              .durationBeforeDivisions(part: "P1", measure: "1"),
                                              .unbalancedPartGroup(number: "1"),
                                              .unknownInstrumentSound("keyboard.pianoforte"),
                                              .unpairedEnding(number: 1, part: "P1", measure: "1"),
                                              .unusedScorePart("P1")]

        for issue in allCases {
            #expect(!issue.message.isEmpty)
        }
    }

    @Test
    func validate_acceptsAbsentInstrumentSound() {
        let (validated, issues) = validate(instrumentSound: nil)

        #expect(issues.isEmpty)
        #expect(validated.isValidated)
    }

    @Test
    func validate_acceptsDivisionsBeforeDuration() {
        let attributes = MXLAttributes(divisions: 1,
                                       content: .transpose([]))
        let note = MXLNote(content: .regularNote(fullNote: MXLFullNote(isChord: false,
                                                                       content: .pitch(MXLPitch(step: .c,
                                                                                                octave: 4))),
                                                 duration: 4,
                                                 tie: []))
        let (validated, issues) = validate(items: [.attributes(attributes), .note(note)])

        #expect(issues.isEmpty)
        #expect(validated.isValidated)
    }

    @Test
    func validate_acceptsPairedEnding() {
        let start = MXLBarline(ending: MXLEnding(value: "1.",
                                                 number: [1],
                                                 kind: .start),
                               location: .left)
        let stop = MXLBarline(ending: MXLEnding(value: "1.",
                                                number: [1],
                                                kind: .stop),
                              location: .right)
        let (validated, issues) = validate(items: [.barline(start), .barline(stop)])

        #expect(issues.isEmpty)
        #expect(validated.isValidated)
    }

    @Test
    func validate_acceptsStandardInstrumentSound() {
        let (validated, issues) = validate(instrumentSound: "keyboard.piano")

        #expect(issues.isEmpty)
        #expect(validated.isValidated)
    }

    // These synthetic fixtures contain constructs the schema-diff proposal listed
    // as candidate checks but which cannot be decided soundly from the AST, so a
    // conforming-looking score with them validates clean. See `MXLValidator.Issue`.
    @Test(arguments: ["measure-duration-mismatch.musicxml",
                      "repeat-endings.musicxml",
                      "unmatched-slur.musicxml"])
    func validate_leavesDeferredConstructsClean(_ name: String) throws {
        let (validated, issues) = try validate(name)

        #expect(issues.isEmpty)
        #expect(validated.isValidated)
    }

    @Test
    func validate_reportsDanglingPartAndUnusedScorePart() throws {
        let (_, issues) = try validate("dangling-part-id.musicxml")

        #expect(issues.contains(.danglingPartID("P2")))
        #expect(issues.contains(.unusedScorePart("P1")))
    }

    @Test
    func validate_reportsDurationBeforeDivisions() {
        let note = MXLNote(content: .regularNote(fullNote: MXLFullNote(isChord: false,
                                                                       content: .pitch(MXLPitch(step: .c,
                                                                                                octave: 4))),
                                                 duration: 4,
                                                 tie: []))
        let (_, issues) = validate(items: [.note(note)])

        #expect(issues == [.durationBeforeDivisions(part: "P1", measure: "1")])
    }

    @Test
    func validate_reportsUnbalancedPartGroup() {
        let group = MXLPartGroup(stretchesTimeSignature: false,
                                 kind: .start,
                                 number: "1")
        let scorePart = MXLScorePart(id: "P1",
                                     name: MXLPartName(value: "Music",
                                                       text: MXLPartName.Text()))
        let score = MXLScorePartwise(partList: MXLPartList(items: [.partGroup(group),
                                                                   .scorePart(scorePart)]),
                                     parts: [MXLScorePartwise.Part(id: "P1",
                                                                   measures: [])])
        let (_, issues) = validate(score)

        #expect(issues == [.unbalancedPartGroup(number: "1")])
    }

    @Test
    func validate_reportsUnknownInstrumentSound() {
        let (_, issues) = validate(instrumentSound: "keyboard.pianoforte")

        #expect(issues == [.unknownInstrumentSound("keyboard.pianoforte")])
    }

    @Test
    func validate_reportsUnpairedEndingStart() {
        let barline = MXLBarline(ending: MXLEnding(value: "1.",
                                                   number: [1],
                                                   kind: .start),
                                 location: .left)
        let (_, issues) = validate(items: [.barline(barline)])

        #expect(issues == [.unpairedEnding(number: 1, part: "P1", measure: "1")])
    }

    @Test
    func validate_reportsUnpairedEndingStop() {
        let barline = MXLBarline(ending: MXLEnding(value: "1.",
                                                   number: [1],
                                                   kind: .stop),
                                 location: .right)
        let (_, issues) = validate(items: [.barline(barline)])

        #expect(issues == [.unpairedEnding(number: 1, part: "P1", measure: "1")])
    }
}
