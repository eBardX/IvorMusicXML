// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOpusTests {
}

// MARK: -

extension MXLOpusTests {
    @Test
    func test_initSetsItems() {
        let items: [MXLOpus.Item] = [.score("score1.xml"),
                                     .opusLink("link.xml")]
        let opus = MXLOpus(title: "Test",
                           items: items)

        #expect(opus.items.count == 2)
    }

    @Test
    func test_initSetsTitle() {
        let opus = MXLOpus(title: "Symphony No. 5",
                           items: [])

        #expect(opus.title == "Symphony No. 5")
    }

    @Test
    func test_initWithEmptyItems() {
        let opus = MXLOpus(title: "Empty",
                           items: [])

        #expect(opus.items.isEmpty)
    }

    @Test
    func test_initWithNestedOpus() {
        let inner = MXLOpus(title: "Movement 1",
                            items: [.score("mvt1.xml")])
        let outer = MXLOpus(title: "Collection",
                            items: [.opus(inner)])

        #expect(outer.items.count == 1)

        if case let .opus(nested) = outer.items[0] {
            #expect(nested.title == "Movement 1")
        } else {
            Issue.record("Expected .opus item")
        }
    }
}
