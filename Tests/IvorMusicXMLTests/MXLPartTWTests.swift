// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPartTWTests {
}

// MARK: -

extension MXLPartTWTests {
    @Test
    func test_initSetsId() {
        let part = MXLPartTW(id: "P2",
                             items: [])

        #expect(part.id == "P2")
    }

    @Test
    func test_initSetsItems() {
        let note = MXLNote(isChord: false,
                           value: .rest,
                           duration: 480,
                           tie: .neither)
        let part = MXLPartTW(id: "P1",
                             items: [.note(note),
                                     .backup(480)])

        #expect(part.items.count == 2)
    }

    @Test
    func test_initWithEmptyItems() {
        let part = MXLPartTW(id: "P1",
                             items: [])

        #expect(part.items.isEmpty)
    }
}
