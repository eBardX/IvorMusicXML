// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDocumentContentTests {
}

// MARK: -

extension MXLDocumentContentTests {
    @Test
    func equality() {
        #expect(MXLDocument.Content.opus(MXLOpus(title: "Sample")) == .opus(MXLOpus(title: "Sample")))
    }

    @Test
    func hashable() {
        let opus = MXLDocument.Content.opus(MXLOpus(title: "Sample"))
        let score = MXLDocument.Content.scorePartwise(MXLScorePartwise(partList: MXLPartList()))
        let values: Set<MXLDocument.Content> = [opus, opus, score]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLDocument.Content.opus(MXLOpus(title: "Sample"))
                != .scorePartwise(MXLScorePartwise(partList: MXLPartList())))
    }

    @Test
    func roundTrip_opus() {
        let opus = MXLOpus(title: "Sample")

        guard case let .opus(value) = MXLDocument.Content.opus(opus)
        else { Issue.record("expected an opus"); return }

        #expect(value == opus)
    }

    @Test
    func roundTrip_scorePartwise() {
        let score = MXLScorePartwise(partList: MXLPartList())

        guard case let .scorePartwise(value) = MXLDocument.Content.scorePartwise(score)
        else { Issue.record("expected a part-wise score"); return }

        #expect(value == score)
    }

    @Test
    func roundTrip_scoreTimewise() {
        let score = MXLScoreTimewise(partList: MXLPartList())

        guard case let .scoreTimewise(value) = MXLDocument.Content.scoreTimewise(score)
        else { Issue.record("expected a time-wise score"); return }

        #expect(value == score)
    }
}
