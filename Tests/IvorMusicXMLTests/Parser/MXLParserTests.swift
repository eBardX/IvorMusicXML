// © 2026 John Gary Pusey (see LICENSE.md)

import Foundation
@testable import IvorMusicXML
import Testing

struct MXLParserTests {
}

// MARK: -

extension MXLParserTests {
    @Test
    func parse_articulationWithEmptyValueIsAllowed() throws {
        let (entity, _) = try MXLParser().parse(Data(articulationsXML("<caesura/><breath-mark/>").utf8),
                                                compressed: false)

        guard case let .scorePartwise(score) = entity.content,
              case let .note(note) = score.parts[0].measures[0].items[1],
              case let .articulations(articulations) = note.notations[0].items[0],
              case let .caesura(caesura) = articulations.items[0],
              case let .breathMark(breathMark) = articulations.items[1]
        else {
            Issue.record("Expected articulations with caesura and breath mark")

            return
        }

        #expect(caesura.value == .empty)
        #expect(breathMark.value == .empty)
    }

    @Test
    func parse_articulationWithInvalidValueThrows() {
        #expect(throws: (any Error).self) {
            try MXLParser().parse(Data(articulationsXML("<caesura>bogus</caesura>").utf8),
                                  compressed: false)
        }
    }

    @Test
    func parse_container() throws {
        let xml = """
        <?xml version="1.0" encoding="UTF-8"?>
        <container>
          <rootfiles>
            <rootfile full-path="score.musicxml" media-type="application/vnd.recordare.musicxml+xml"/>
          </rootfiles>
        </container>
        """

        let container = try MXLParser.parseContainer(Data(xml.utf8))

        #expect(container.rootfiles.count == 1)
        #expect(container.rootfiles[0].fullPath == "score.musicxml")
    }

    @Test
    func parse_effectWithInvalidValueThrows() {
        #expect(throws: (any Error).self) {
            try MXLParser().parse(Data(percussionXML("<effect>lion's roar</effect>").utf8),
                                  compressed: false)
        }
    }

    @Test
    func parse_effectWithValidValue() throws {
        let (entity, _) = try MXLParser().parse(Data(percussionXML("<effect>lions roar</effect>").utf8),
                                                compressed: false)

        guard case let .scorePartwise(score) = entity.content,
              case let .direction(direction) = score.parts[0].measures[0].items[1],
              case let .percussion(percussion) = direction.kind[0].content,
              case let .effect(effect) = percussion[0].content
        else {
            Issue.record("Expected percussion effect")

            return
        }

        #expect(effect.value == .lionsRoar)
    }

    @Test
    func parse_figuredBassWithDuration() throws {
        let xml = """
        <?xml version="1.0" encoding="UTF-8"?>
        <score-partwise version="4.0">
          <part-list>
            <score-part id="P1">
              <part-name>Continuo</part-name>
            </score-part>
          </part-list>
          <part id="P1">
            <measure number="1">
              <attributes>
                <divisions>2</divisions>
              </attributes>
              <figured-bass>
                <figure>
                  <figure-number>6</figure-number>
                </figure>
                <duration>1</duration>
              </figured-bass>
              <note>
                <pitch>
                  <step>C</step>
                  <octave>3</octave>
                </pitch>
                <duration>2</duration>
              </note>
            </measure>
          </part>
        </score-partwise>
        """

        let (entity, _) = try MXLParser().parse(Data(xml.utf8), compressed: false)

        guard case let .scorePartwise(score) = entity.content
        else {
            Issue.record("Expected scorePartwise entity")

            return
        }

        let figuredBass = score.parts[0].measures[0].items.compactMap { if case let .figuredBass(item) = $0 { item } else { nil } }.first

        #expect(figuredBass?.figure.count == 1)
        #expect(figuredBass?.duration == MXLPositiveDivisions(intValue: 1))
    }

    @Test(arguments: FixtureLoader.allFixtures)
    func parse_fixtureMatchesItsExpectation(_ fixture: FixtureLoader.Fixture) throws {
        guard case .parseFailure = fixture.expectation
        else {
            let (document, _) = try FixtureLoader.parse(fixture)

            try verify(document,
                       against: fixture)

            return
        }

        // These surface as XestiXML's own `XMLNode.Error`, not `MXLParser.Error` —
        // the attribute readers reject the value before the parser sees it.
        #expect(throws: (any Error).self) {
            try FixtureLoader.parse(fixture)
        }
    }

    @Test
    func parse_opus() throws {
        let xml = """
        <?xml version="1.0" encoding="UTF-8"?>
        <opus version="4.0">
          <title>Collected Works</title>
          <opus-link xlink:href="movement1.musicxml" xmlns:xlink="http://www.w3.org/1999/xlink"/>
          <score xlink:href="movement2.musicxml" xmlns:xlink="http://www.w3.org/1999/xlink"/>
          <opus>
            <title>Nested Opus</title>
          </opus>
        </opus>
        """

        let (entity, _) = try MXLParser().parse(Data(xml.utf8), compressed: false)

        guard case let .opus(opus) = entity.content
        else {
            Issue.record("Expected opus entity")

            return
        }

        #expect(opus.title == "Collected Works")
        #expect(opus.items.count == 3)

        if case let .opus(nested) = opus.items[2] {
            #expect(nested.title == "Nested Opus")
        } else {
            Issue.record("Expected nested opus content")
        }
    }

    @Test
    func parse_scorePartwise() throws {
        let xml = """
        <?xml version="1.0" encoding="UTF-8"?>
        <score-partwise version="4.0">
          <work>
            <work-title>Test Work</work-title>
          </work>
          <identification>
            <creator type="composer">A. Composer</creator>
            <encoding>
              <software>IvorMusicXML</software>
            </encoding>
          </identification>
          <defaults>
            <scaling>
              <millimeters>7</millimeters>
              <tenths>40</tenths>
            </scaling>
          </defaults>
          <credit page="1">
            <credit-words default-x="500" default-y="1400" justify="center" valign="top" font-size="24">Test Work</credit-words>
          </credit>
          <part-list>
            <score-part id="P1">
              <part-name>Piano</part-name>
              <score-instrument id="P1-I1">
                <instrument-name>Piano</instrument-name>
              </score-instrument>
              <midi-instrument id="P1-I1">
                <midi-channel>1</midi-channel>
                <midi-program>1</midi-program>
              </midi-instrument>
            </score-part>
          </part-list>
          <part id="P1">
            <measure number="1">
              <attributes>
                <divisions>1</divisions>
                <key>
                  <fifths>0</fifths>
                </key>
                <time>
                  <beats>4</beats>
                  <beat-type>4</beat-type>
                </time>
                <clef>
                  <sign>G</sign>
                  <line>2</line>
                </clef>
              </attributes>
              <direction placement="above">
                <direction-type>
                  <words>Allegro</words>
                </direction-type>
                <sound tempo="120"/>
              </direction>
              <note>
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations>
                    <staccato/>
                  </articulations>
                  <fermata>normal</fermata>
                </notations>
              </note>
              <harmony>
                <root>
                  <root-step>C</root-step>
                </root>
                <kind>major</kind>
              </harmony>
              <note>
                <rest/>
                <duration>3</duration>
                <voice>1</voice>
              </note>
              <barline location="right">
                <bar-style>light-heavy</bar-style>
              </barline>
            </measure>
          </part>
        </score-partwise>
        """

        let (entity, _) = try MXLParser().parse(Data(xml.utf8), compressed: false)

        guard case let .scorePartwise(score) = entity.content
        else {
            Issue.record("Expected scorePartwise entity")

            return
        }

        let scorePart = score.partList.items.compactMap { if case let .scorePart(scorePart) = $0 { scorePart } else { nil } }.first

        #expect(score.work?.title == "Test Work")
        #expect(scorePart?.name.value == "Piano")
        #expect(score.parts.count == 1)
        #expect(score.parts[0].measures.count == 1)
        #expect(score.parts[0].measures[0].items.count == 6)
    }

    @Test
    func parse_scoreTimewise() throws {
        let xml = """
        <?xml version="1.0" encoding="UTF-8"?>
        <score-timewise version="4.0">
          <part-list>
            <score-part id="P1">
              <part-name>Violin</part-name>
            </score-part>
          </part-list>
          <measure number="1">
            <part id="P1">
              <attributes>
                <divisions>1</divisions>
              </attributes>
              <note>
                <pitch>
                  <step>A</step>
                  <octave>4</octave>
                </pitch>
                <duration>4</duration>
                <voice>1</voice>
              </note>
            </part>
          </measure>
        </score-timewise>
        """

        let (entity, _) = try MXLParser().parse(Data(xml.utf8), compressed: false)

        guard case let .scoreTimewise(score) = entity.content
        else {
            Issue.record("Expected scoreTimewise entity")

            return
        }

        #expect(score.measures.count == 1)
        #expect(score.measures[0].parts.count == 1)
        #expect(score.measures[0].parts[0].items.count == 2)
    }

    @Test
    func parse_soundsRootIsRejected() {
        let xml = """
        <?xml version="1.0" encoding="UTF-8"?>
        <sounds>
          <sound id="wind.reed.oboe"/>
        </sounds>
        """

        #expect(throws: (any Error).self) {
            try MXLParser().parse(Data(xml.utf8), compressed: false)
        }
    }
}
