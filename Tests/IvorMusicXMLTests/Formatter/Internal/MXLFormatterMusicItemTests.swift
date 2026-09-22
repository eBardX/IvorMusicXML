// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLFormatterMusicItemTests {
}

// MARK: -

extension MXLFormatterMusicItemTests {
    @Test
    func format_roundTripsBackupWithFootnoteAndLevel() throws {
        let level = MXLLevel(value: "*",
                             isReferenceOnly: true,
                             kind: .start,
                             display: MXLLevel.Display(hasParentheses: true,
                                                       hasBracket: true,
                                                       size: .large))
        let backup = MXLBackup(duration: 4,
                               footnote: MXLFormattedText(value: "editorial cue"),
                               level: level)

        try expectRoundTrip(items: [.backup(backup)])
    }

    @Test
    func format_roundTripsForwardWithVoiceAndStaff() throws {
        let forward = MXLForward(duration: 2,
                                 voice: MXLVoice(voice: "2"),
                                 staff: 3)

        try expectRoundTrip(items: [.forward(forward)])
    }

    @Test
    func format_roundTripsGroupingWithFeatures() throws {
        let grouping = MXLGrouping(id: "g1",
                                   feature: [MXLFeature(value: "soft-pedal",
                                                        kind: "pedal"),
                                             MXLFeature(value: "una-corda")],
                                   kind: .start,
                                   number: "2",
                                   memberOf: "set1")

        try expectRoundTrip(items: [.grouping(grouping)])
    }
}
