// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOpusItemTests {
}

// MARK: -

extension MXLOpusItemTests {
    @Test
    func test_caseOpus() {
        let inner = MXLOpus(title: "Inner",
                            items: [])
        let item = MXLOpus.Item.opus(inner)

        if case let .opus(value) = item {
            #expect(value.title == "Inner")
        } else {
            Issue.record("Expected .opus case")
        }
    }

    @Test
    func test_caseOpusLink() {
        let item = MXLOpus.Item.opusLink("http://example.com/opus.xml")

        if case let .opusLink(value) = item {
            #expect(value == "http://example.com/opus.xml")
        } else {
            Issue.record("Expected .opusLink case")
        }
    }

    @Test
    func test_caseScore() {
        let item = MXLOpus.Item.score("movement1.xml")

        if case let .score(value) = item {
            #expect(value == "movement1.xml")
        } else {
            Issue.record("Expected .score case")
        }
    }
}
