// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOtherPlayTests {
}

// MARK: -

extension MXLOtherPlayTests {
    @Test
    func equality() {
        #expect(MXLOtherPlay(value: "1", kind: "custom") == MXLOtherPlay(value: "1", kind: "custom"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLOtherPlay> = [MXLOtherPlay(value: "1", kind: "custom"), MXLOtherPlay(value: "1", kind: "custom"), MXLOtherPlay(value: "2", kind: "other")]    // swiftlint:disable:this line_length

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLOtherPlay(value: "1", kind: "custom") != MXLOtherPlay(value: "2", kind: "other"))
    }

    @Test
    func init_values() {
        let value = MXLOtherPlay(value: "1", kind: "custom")

        #expect(value.kind == "custom")
        #expect(value.value == "1")
    }
}
