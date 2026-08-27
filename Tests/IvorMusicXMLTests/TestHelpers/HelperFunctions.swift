// © 2026 John Gary Pusey (see LICENSE.md)

import Foundation
@testable import IvorMusicXML
import Testing
import XestiTools
import XestiXML

// MARK: -

func articulationsXML(_ articulations: String) -> String {
    measureXML("""
    <note>
      <pitch>
        <step>C</step>
        <octave>4</octave>
      </pitch>
      <duration>1</duration>
      <notations>
        <articulations>\(articulations)</articulations>
      </notations>
    </note>
    """)
}

func diagnostics(for xml: String) throws -> [MXLParser.Diagnostic] {
    try MXLParser().parse(Data(xml.utf8),
                          compressed: false).1
}

func displayValue(_ nameDisplay: MXLNameDisplay?) -> String? {
    guard case let .displayText(text) = nameDisplay?.items.first
    else { return nil }

    return text.value
}

func document(items: [MXLMusicItem]) -> MXLDocument {
    let measure = MXLScorePartwise.Part.Measure(number: "1",
                                                items: items)
    let part = MXLScorePartwise.Part(id: "P1",
                                     measures: [measure])
    let scorePart = MXLScorePart(id: "P1",
                                 name: MXLPartName(value: "Music",
                                                   text: MXLPartName.Text()))
    let score = MXLScorePartwise(partList: MXLPartList(items: [.scorePart(scorePart)]),
                                 parts: [part])

    return MXLDocument(content: .scorePartwise(score),
                       isNormalized: true,
                       isValidated: true)
}

func document(partListItems: [MXLPartList.Item]) -> MXLDocument {
    let measure = MXLScorePartwise.Part.Measure(number: "1",
                                                items: [])
    let part = MXLScorePartwise.Part(id: "P1",
                                     measures: [measure])
    let score = MXLScorePartwise(partList: MXLPartList(items: partListItems),
                                 parts: [part])

    return MXLDocument(content: .scorePartwise(score),
                       isNormalized: true,
                       isValidated: true)
}

func expectRoundTrip(_ fixture: FixtureLoader.Fixture,
                     compressed: Bool) throws {
    let validated = try validate(fixture)

    let data = try MXLFormatter().format(validated,
                                         compressed: compressed)
    let (reparsed, _) = try MXLParser().parse(data,
                                              compressed: compressed)

    #expect(reparsed.content == validated.content)
}

func expectRoundTrip(_ opus: MXLOpus) throws {
    let (reparsed, _) = try MXLParser().parse(format(opus),
                                              compressed: false)

    #expect(reparsed.content == .opus(opus))
}

func expectRoundTrip(items: [MXLMusicItem]) throws {
    let document = document(items: items)

    let data = try MXLFormatter().format(document,
                                         compressed: false)
    let (reparsed, _) = try MXLParser().parse(data,
                                              compressed: false)

    #expect(reparsed.content == document.content)
}

func expectRoundTrip(items: [MXLNotations.Item]) throws {
    let notations = MXLNotations(items: items)
    let pitch = MXLPitch(step: .c,
                         octave: 4)
    let note = MXLNote(content: .regularNote(fullNote: MXLFullNote(isChord: false,
                                                                   content: .pitch(pitch)),
                                             duration: 4,
                                             tie: []),
                       notations: [notations])
    let document = document(items: [.note(note)])

    let data = try MXLFormatter().format(document,
                                         compressed: false)
    let (reparsed, _) = try MXLParser().parse(data,
                                              compressed: false)

    #expect(reparsed.content == document.content)
}

func expectRoundTrip(lyric: [MXLLyric]) throws {
    let pitch = MXLPitch(step: .c,
                         octave: 4)
    let note = MXLNote(content: .regularNote(fullNote: MXLFullNote(isChord: false,
                                                                   content: .pitch(pitch)),
                                             duration: 4,
                                             tie: []),
                       lyric: lyric)
    let document = document(items: [.note(note)])

    let data = try MXLFormatter().format(document,
                                         compressed: false)
    let (reparsed, _) = try MXLParser().parse(data,
                                              compressed: false)

    #expect(reparsed.content == document.content)
}

func expectValidationIssues(_ fixture: FixtureLoader.Fixture) throws {
    let (normalized, _) = try MXLNormalizer().normalize(parse(fixture))
    let (validated, issues) = try MXLValidator().validate(normalized)

    #expect(!issues.isEmpty)
    #expect(!validated.isValidated)
}

func firstMusicItem<T>(_ score: MXLScorePartwise,
                       _ transform: (MXLMusicItem) -> T?) -> T? {
    musicItems(score).lazy.compactMap(transform).first
}

func firstScorePart(_ score: MXLScorePartwise) -> MXLScorePart? {
    score.partList.items.lazy.compactMap { item -> MXLScorePart? in
        guard case let .scorePart(scorePart) = item
        else { return nil }

        return scorePart
    }.first
}

func firstSound(_ score: MXLScorePartwise) -> MXLSound? {
    firstMusicItem(score) { item in
        switch item {
        case let .sound(sound):
            sound

        case let .direction(direction):
            direction.sound

        default:
            nil
        }
    }
}

func format(_ opus: MXLOpus) throws -> Data {
    var writer = MXLFormatter.Writer()

    writer.writeProlog(.opus,
                       version: opus.version)
    writer.writeOpus(opus)

    return try MXLFormatter.linkingFormatter.format(writer.document)
}

func hasFormatting(_ text: MXLPartName.Text) -> Bool {
    text.color != nil || text.justify != nil || text.printsObject != nil || text.font != MXLFont()
}

func measureXML(_ items: String) -> String {
    """
    <?xml version="1.0" encoding="UTF-8"?>
    <score-partwise version="4.0">
      <part-list>
        <score-part id="P1">
          <part-name>Perc</part-name>
        </score-part>
      </part-list>
      <part id="P1">
        <measure number="1">
          <attributes>
            <divisions>1</divisions>
          </attributes>
    \(items)
        </measure>
      </part>
    </score-partwise>
    """
}

func musicItems(_ score: MXLScorePartwise) -> [MXLMusicItem] {
    score.parts.flatMap { $0.measures.flatMap(\.items) }
}

func normalize(_ name: String) throws -> (MXLScorePartwise, [MXLNormalizer.Change]) {
    let fixture = try #require(FixtureLoader.allFixtures.first { $0.name == name })
    let (document, _) = try FixtureLoader.parse(fixture)
    let (normalized, changes) = MXLNormalizer().normalize(document)

    guard case let .scorePartwise(score) = normalized.content
    else { throw MXLNormalizerMigrationError.unsupportedContent }

    return (score, changes)
}

func normalizedDocument(_ name: String) throws -> MXLDocument {
    let fixture = try #require(FixtureLoader.allFixtures.first { $0.name == name })
    let (document, _) = try FixtureLoader.parse(fixture)

    return MXLNormalizer().normalize(document).0
}

func note(color: MXLColor? = nil,
          xPosition: MXLXPosition = MXLXPosition()) -> MXLNote {
    let pitch = MXLPitch(step: .c,
                         octave: 4)

    return MXLNote(content: .regularNote(fullNote: MXLFullNote(isChord: false,
                                                               content: .pitch(pitch)),
                                         duration: 4,
                                         tie: []),
                   xPosition: xPosition,
                   color: color)
}

func parse(_ fixture: FixtureLoader.Fixture) throws -> MXLDocument {
    try FixtureLoader.parse(fixture).0
}

func parse(_ name: String) throws -> MXLDocument {
    let fixture = try #require(FixtureLoader.allFixtures.first { $0.name == name })

    return try FixtureLoader.parse(fixture).0
}

func partwise(_ name: String) throws -> MXLScorePartwise {
    guard case let .scorePartwise(score) = try parse(name).content
    else { throw MXLScoreTransformTestError.unsupportedContent }

    return score
}

func partwiseDocument(note: MXLNote,
                      partNameText: MXLPartName.Text = MXLPartName.Text()) -> MXLDocument {
    let measure = MXLScorePartwise.Part.Measure(number: "1",
                                                items: [.note(note)])
    let part = MXLScorePartwise.Part(id: "P1",
                                     measures: [measure])
    let scorePart = MXLScorePart(id: "P1",
                                 name: MXLPartName(value: "Music",
                                                   text: partNameText))
    let score = MXLScorePartwise(partList: MXLPartList(items: [.scorePart(scorePart)]),
                                 parts: [part])

    return MXLDocument(content: .scorePartwise(score),
                       isNormalized: true,
                       isValidated: true)
}

func percussionXML(_ percussion: String) -> String {
    measureXML("""
    <direction>
      <direction-type>
        <percussion>\(percussion)</percussion>
      </direction-type>
    </direction>
    """)
}

func scorePart() -> MXLPartList.Item {
    .scorePart(MXLScorePart(id: "P1",
                            name: MXLPartName(value: "Music",
                                              text: MXLPartName.Text())))
}

func scoreXML(_ rootAttributes: String) -> String {
    """
    <?xml version="1.0" encoding="UTF-8"?>
    <score-partwise \(rootAttributes)>
      <part-list>
        <score-part id="P1">
          <part-name>Music</part-name>
        </score-part>
      </part-list>
      <part id="P1">
        <measure number="1">
          <attributes>
            <divisions>1</divisions>
          </attributes>
        </measure>
      </part>
    </score-partwise>
    """
}

func staffNumber(_ value: UInt) throws -> MXLStaffNumber {
    try #require(MXLStaffNumber(uintValue: value))
}

func timewise(_ name: String) throws -> MXLScoreTimewise {
    guard case let .scoreTimewise(score) = try parse(name).content
    else { throw MXLScoreTransformTestError.unsupportedContent }

    return score
}

func validate(_ fixture: FixtureLoader.Fixture) throws -> MXLDocument {
    let (normalized, _) = try MXLNormalizer().normalize(parse(fixture))
    let (validated, _) = try MXLValidator().validate(normalized)

    return validated
}

func validate(_ name: String) throws -> (MXLDocument, [MXLValidator.Issue]) {
    let fixture = try #require(FixtureLoader.allFixtures.first { $0.name == name })
    let (document, _) = try FixtureLoader.parse(fixture)
    let (normalized, _) = MXLNormalizer().normalize(document)

    return try MXLValidator().validate(normalized)
}

func validate(_ score: MXLScorePartwise) -> (MXLDocument, [MXLValidator.Issue]) {
    let document = MXLDocument(content: .scorePartwise(score),
                               isNormalized: true,
                               isValidated: false)

    // The hand-built documents are already normalized (part-wise, version
    // current), so `validate(_:)` never throws here.
    return (try? MXLValidator().validate(document)) ?? (document, [])
}

func validate(instrumentSound: String?) -> (MXLDocument, [MXLValidator.Issue]) {
    let instrument = MXLScoreInstrument(id: "P1-I1",
                                        name: "Piano",
                                        virtualInstrumentData: MXLVirtualInstrumentData(instrumentSound: instrumentSound))
    let scorePart = MXLScorePart(id: "P1",
                                 name: MXLPartName(value: "Music",
                                                   text: MXLPartName.Text()),
                                 instrument: [instrument])
    let score = MXLScorePartwise(partList: MXLPartList(items: [.scorePart(scorePart)]),
                                 parts: [MXLScorePartwise.Part(id: "P1",
                                                               measures: [])])

    return validate(score)
}

func validate(items: [MXLMusicItem]) -> (MXLDocument, [MXLValidator.Issue]) {
    let measure = MXLScorePartwise.Part.Measure(number: "1",
                                                items: items)
    let scorePart = MXLScorePart(id: "P1",
                                 name: MXLPartName(value: "Music",
                                                   text: MXLPartName.Text()))
    let score = MXLScorePartwise(partList: MXLPartList(items: [.scorePart(scorePart)]),
                                 parts: [MXLScorePartwise.Part(id: "P1",
                                                               measures: [measure])])

    return validate(score)
}

func verify(_ document: MXLDocument,
            against fixture: FixtureLoader.Fixture) throws {
    switch (document.content, fixture.expectation) {
    case (.opus, .opus):
        break

    case let (.scorePartwise(score), .scorePartwise(version, partCount, itemCount)):
        #expect(score.version == version)
        #expect(score.parts.count == partCount)
        #expect(try #require(score.parts.first).measures.first?.items.count == itemCount)

    case let (.scoreTimewise(score), .scoreTimewise(version, partCount, itemCount)):
        #expect(score.version == version)
        #expect(try #require(score.measures.first).parts.count == partCount)
        #expect(try #require(score.measures.first).parts.first?.items.count == itemCount)

    default:
        Issue.record("\(fixture.testDescription) parsed as an unexpected root kind")
    }
}

func xml(_ opus: MXLOpus) throws -> String {
    try #require(String(bytes: format(opus),
                        encoding: .utf8))
}
