// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLineWidthTests {
}

// MARK: -

extension MXLLineWidthTests {
    @Test
    func equality() {
        #expect(MXLLineWidth(value: 1, kind: "beam") == MXLLineWidth(value: 1, kind: "beam"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLLineWidth> = [MXLLineWidth(value: 1, kind: "beam"),
                                         MXLLineWidth(value: 1, kind: "beam"),
                                         MXLLineWidth(value: 2, kind: "stem")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLLineWidth(value: 1, kind: "beam") != MXLLineWidth(value: 2, kind: "stem"))
    }

    @Test
    func init_values() {
        let value = MXLLineWidth(value: 1, kind: "beam")

        #expect(value.kind == "beam")
        #expect(value.value == 1)
    }
}
