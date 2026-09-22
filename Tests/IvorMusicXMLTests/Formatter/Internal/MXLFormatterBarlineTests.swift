// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLFormatterBarlineTests {
}

// MARK: -

extension MXLFormatterBarlineTests {
    @Test
    func format_roundTripsBarline() throws {
        let barline = MXLBarline(barStyle: MXLBarline.StyleColor(value: .lightHeavy,
                                                                 color: "#123456"),
                                 ending: MXLEnding(value: "1.",
                                                   number: [1],
                                                   kind: .start,
                                                   printsObject: true,
                                                   system: .onlyTop,
                                                   endLength: 10,
                                                   textX: 2,
                                                   textY: 3),
                                 repeat: MXLRepeat(direction: .backward,
                                                   times: 2,
                                                   isAfterJump: false,
                                                   winged: .doubleCurved),
                                 location: .right,
                                 segnoAttribute: "segno-a",
                                 codaAttribute: "coda-a",
                                 divisions: 2)
        let document = document(items: [.barline(barline)])

        let data = try MXLFormatter().format(document,
                                             compressed: false)
        let (reparsed, _) = try MXLParser().parse(data,
                                                  compressed: false)

        #expect(reparsed.content == document.content)
    }
}
