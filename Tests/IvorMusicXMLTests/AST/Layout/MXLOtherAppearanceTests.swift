// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOtherAppearanceTests {
}

// MARK: -

extension MXLOtherAppearanceTests {
    @Test
    func equality() {
        #expect(MXLOtherAppearance(value: "1", kind: "other") == MXLOtherAppearance(value: "1", kind: "other"))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLOtherAppearance> = [MXLOtherAppearance(value: "1", kind: "other"),
                                               MXLOtherAppearance(value: "1", kind: "other"),
                                               MXLOtherAppearance(value: "2", kind: "extra")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLOtherAppearance(value: "1", kind: "other") != MXLOtherAppearance(value: "2", kind: "extra"))
    }

    @Test
    func init_values() {
        let value = MXLOtherAppearance(value: "1", kind: "other")

        #expect(value.kind == "other")
        #expect(value.value == "1")
    }
}
