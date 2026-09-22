// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTimeSignatureTests {
}

// MARK: -

extension MXLTimeSignatureTests {
    @Test
    func equality() {
        #expect(MXLTimeSignature(beats: "4", beatType: "4") == MXLTimeSignature(beats: "4", beatType: "4"))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLTimeSignature> = [MXLTimeSignature(beats: "4", beatType: "4"),
                                             MXLTimeSignature(beats: "4", beatType: "4"),
                                             MXLTimeSignature(beats: "3", beatType: "8")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTimeSignature(beats: "4", beatType: "4") != MXLTimeSignature(beats: "3", beatType: "8"))
    }

    @Test
    func init_values() {
        let value = MXLTimeSignature(beats: "4", beatType: "4")

        #expect(value.beatType == "4")
        #expect(value.beats == "4")
    }
}
