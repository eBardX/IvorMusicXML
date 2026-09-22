// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLFormatterAttributesTests {
}

// MARK: -

extension MXLFormatterAttributesTests {
    @Test
    func format_roundTripsForPartContentAndMeasureStyleSlash() throws {
        let forPart = try MXLForPart(id: "P1",
                                     clef: MXLClef.Content(sign: .f,
                                                           line: 4),
                                     transpose: MXLTranspose.Content(chromatic: 0),
                                     number: staffNumber(1))
        let slash = MXLSlash(content: MXLSlashContent(group: MXLSlashContent.Group(slashKind: .eighth,
                                                                                   slashDot: 1),
                                                      exceptVoice: ["1", "2"]),
                             kind: .start,
                             usesDots: true,
                             usesStems: false)
        let attributes = MXLAttributes(content: .forPart([forPart]),
                                       measureStyle: [MXLMeasureStyle(content: .slash(slash))])
        let document = document(items: [.attributes(attributes)])

        let data = try MXLFormatter().format(document,
                                             compressed: false)
        let (reparsed, _) = try MXLParser().parse(data,
                                                  compressed: false)

        #expect(reparsed.content == document.content)
    }

    @Test
    func format_roundTripsNonTraditionalKey() throws {
        let key = try MXLKey(content: .nonTraditionalKey(MXLNonTraditionalKey(step: .g,
                                                                              alter: 0.5,
                                                                              accidental: MXLKeyAccidental(value: .sharp,
                                                                                                           smufl: "accidentalSharp"))),
                             number: staffNumber(1))
        let attributes = MXLAttributes(key: [key],
                                       content: .transpose([]))
        let document = document(items: [.attributes(attributes)])

        let data = try MXLFormatter().format(document,
                                             compressed: false)
        let (reparsed, _) = try MXLParser().parse(data,
                                                  compressed: false)

        #expect(reparsed.content == document.content)
    }

    @Test
    func format_roundTripsRichAttributes() throws {
        let key = try MXLKey(content: .traditionalKey(MXLTraditionalKey(cancel: MXLCancel(value: -1,
                                                                                          location: .left),
                                                                        fifths: 2,
                                                                        mode: "major")),
                             octave: [MXLKey.Octave(value: 4,
                                                    number: 1,
                                                    isCancelling: true)],
                             number: staffNumber(1))
        let time = MXLTime(content: .timeSignature([MXLTimeSignature(beats: "3", beatType: "4"),
                                                    MXLTimeSignature(beats: "2", beatType: "8")],
                                                   interchangeable: MXLInterchangeable(timeRelation: .parentheses,
                                                                                       timeSignature: [MXLTimeSignature(beats: "6", beatType: "8")],
                                                                                       symbol: .normal,
                                                                                       separator: .horizontal)),
                           symbol: .common,
                           separator: .vertical)
        let clef = try MXLClef(content: MXLClef.Content(sign: .g,
                                                        line: 2,
                                                        octaveChange: -1),
                               number: staffNumber(1),
                               size: .cue)
        let staffDetails = try MXLStaffDetails(staffKind: .regular,
                                               group: MXLStaffDetails.Group(staffLines: 5,
                                                                            lineDetail: [MXLLineDetail(line: 1,
                                                                                                       width: 2.5,
                                                                                                       lineKind: .solid,
                                                                                                       printsObject: true)]),
                                               staffTuning: [MXLStaffTuning(tuning: MXLTuning(step: .e,
                                                                                              alter: 0.5,
                                                                                              octave: 4),
                                                                            line: 1)],
                                               capo: 3,
                                               staffSize: MXLStaffSize(value: 80, scaling: 90),
                                               number: staffNumber(1),
                                               showFrets: .letters)
        let transpose = try MXLTranspose(content: MXLTranspose.Content(diatonic: -1,
                                                                       chromatic: -2,
                                                                       octaveChange: -1,
                                                                       double: MXLDouble(isAbove: true)),
                                         number: staffNumber(1))
        let measureStyle = try MXLMeasureStyle(content: .multipleRest(MXLMultipleRest(value: 4,
                                                                                      usesSymbols: true)),
                                               number: staffNumber(1))
        let attributes = MXLAttributes(divisions: 4,
                                       key: [key],
                                       time: [time],
                                       staves: 2,
                                       instruments: 1,
                                       clef: [clef],
                                       staffDetails: [staffDetails],
                                       content: .transpose([transpose]),
                                       directive: [MXLAttributes.Directive(value: "Andante",
                                                                           xmlLang: "en")],
                                       measureStyle: [measureStyle])
        let document = document(items: [.attributes(attributes)])

        let data = try MXLFormatter().format(document,
                                             compressed: false)
        let (reparsed, _) = try MXLParser().parse(data,
                                                  compressed: false)

        #expect(reparsed.content == document.content)
    }
}
