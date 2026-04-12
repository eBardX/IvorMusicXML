// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStandardSoundTests {
}

// MARK: -

extension MXLStandardSoundTests {
    @Test
    func test_initSetsId() {
        let sound = MXLStandardSound(id: "wind.flutes.flute")

        #expect(sound.id == "wind.flutes.flute")
    }

    @Test
    func test_initWithEmptyId() {
        let sound = MXLStandardSound(id: "")

        #expect(sound.id.isEmpty)
    }
}
