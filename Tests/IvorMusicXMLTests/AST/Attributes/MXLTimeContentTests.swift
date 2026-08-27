// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTimeContentTests {
}

// MARK: -

extension MXLTimeContentTests {
    @Test
    func equality() {
        #expect(MXLTime.Content.senzaMisura("X") == .senzaMisura("X"))
    }

    @Test
    func hashable() {
        let senzaMisura = MXLTime.Content.senzaMisura("X")
        let timeSignature = MXLTime.Content.timeSignature([MXLTimeSignature(beats: "4", beatType: "4")],
                                                          interchangeable: nil)
        let values: Set<MXLTime.Content> = [senzaMisura, senzaMisura, timeSignature]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let timeSignature = MXLTime.Content.timeSignature([MXLTimeSignature(beats: "4", beatType: "4")],
                                                          interchangeable: nil)

        #expect(MXLTime.Content.senzaMisura("X") != timeSignature)
    }
}
