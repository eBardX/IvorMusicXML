// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

// Tests for the part-wise↔time-wise transform pair and its wiring into the
// normalizer.
struct MXLScoreTransformTests {
}

// MARK: -

extension MXLScoreTransformTests {
    @Test
    func normalize_clearsIsValidatedWhenConvertingTimewise() throws {
        let parsed = try parse("minimal-timewise.musicxml")
        let document = MXLDocument(content: parsed.content,
                                   isNormalized: false,
                                   isValidated: true)

        let (normalized, _) = MXLNormalizer().normalize(document)

        #expect(!normalized.isValidated)
    }

    @Test
    func normalize_convertsTimewiseToPartwise() throws {
        let (document, _) = try MXLNormalizer().normalize(parse("minimal-timewise.musicxml"))

        guard case .scorePartwise = document.content
        else {
            Issue.record("a normalized time-wise score should be part-wise")

            return
        }

        #expect(document.isNormalized)
    }

    @Test
    func normalize_emitsConvertedToPartwise() throws {
        let (_, changes) = try MXLNormalizer().normalize(parse("minimal-timewise.musicxml"))

        #expect(changes.contains(.convertedToPartwise))
    }

    @Test
    func timewiseTwin_normalizesEqualToPartwiseTwin() throws {
        let (fromTimewise, _) = try MXLNormalizer().normalize(parse("minimal-timewise.musicxml"))
        let (fromPartwise, _) = try MXLNormalizer().normalize(parse("minimal-partwise.musicxml"))

        #expect(fromTimewise.content == fromPartwise.content)
    }

    @Test
    func toPartwise_matchesHandConvertedTwin() throws {
        let timewise = try timewise("minimal-timewise.musicxml")
        let partwise = try partwise("minimal-partwise.musicxml")

        let (converted, changes) = MXLScoreTransform().toPartwise(timewise)

        #expect(converted == partwise)
        #expect(changes == [.convertedToPartwise])
    }

    @Test
    func toTimewise_emitsChangeWhenPartsDisagree() {
        let score = MXLScorePartwise(partList: MXLPartList(items: []),
                                     parts: [.init(id: "P1",
                                                   measures: [.init(number: "1", width: 100)]),
                                             .init(id: "P2",
                                                   measures: [.init(number: "1", width: 200)])])

        let (_, changes) = MXLScoreTransform().toTimewise(score)

        #expect(changes.contains(.replacedConstruct("measure[1] per-part metadata",
                                                    "first part's metadata")))
    }

    @Test
    func toTimewise_emitsNoChangeWhenPartsAgree() {
        let score = MXLScorePartwise(partList: MXLPartList(items: []),
                                     parts: [.init(id: "P1",
                                                   measures: [.init(number: "1", width: 100)]),
                                             .init(id: "P2",
                                                   measures: [.init(number: "1", width: 100)])])

        let (_, changes) = MXLScoreTransform().toTimewise(score)

        #expect(changes.isEmpty)
    }

    @Test
    func toTimewise_ofToPartwise_roundTrips() throws {
        let timewise = try timewise("minimal-timewise.musicxml")

        let (partwise, _) = MXLScoreTransform().toPartwise(timewise)
        let (roundTripped, changes) = MXLScoreTransform().toTimewise(partwise)

        #expect(roundTripped == timewise)
        #expect(changes.isEmpty)
    }
}
