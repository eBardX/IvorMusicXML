// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOtherListeningTests {
}

// MARK: -

extension MXLOtherListeningTests {
    @Test
    func equality() {
        #expect(MXLOtherListening(value: "1", kind: "custom") == MXLOtherListening(value: "1", kind: "custom"))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLOtherListening> = [MXLOtherListening(value: "1", kind: "custom"),
                                              MXLOtherListening(value: "1", kind: "custom"),
                                              MXLOtherListening(value: "2", kind: "other")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLOtherListening(value: "1", kind: "custom") != MXLOtherListening(value: "2", kind: "other"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLOtherListening(value: "1", kind: "custom")

        #expect(value.player == nil)
        #expect(value.timeOnly == nil)
        #expect(value.kind == "custom")
        #expect(value.value == "1")
    }

    @Test
    func init_explicitValues() {
        let value = MXLOtherListening(value: "1", kind: "custom", player: "p1", timeOnly: [1])

        #expect(value.player == "p1")
        #expect(value.timeOnly == [1])
        #expect(value.kind == "custom")
        #expect(value.value == "1")
    }
}
