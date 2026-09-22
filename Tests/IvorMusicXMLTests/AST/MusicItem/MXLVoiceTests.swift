// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLVoiceTests {
}

// MARK: -

extension MXLVoiceTests {
    @Test
    func equality() {
        #expect(MXLVoice(voice: "1") == MXLVoice(voice: "1"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLVoice> = [MXLVoice(voice: "1"), MXLVoice(voice: "1"), MXLVoice(voice: "2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLVoice(voice: "1") != MXLVoice(voice: "2"))
    }

    @Test
    func init_values() {
        let value = MXLVoice(voice: "1")

        #expect(value.voice == "1")
    }
}
