// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDistanceTests {
}

// MARK: -

extension MXLDistanceTests {
    @Test
    func equality() {
        #expect(MXLDistance(value: 8, kind: "hyphen") == MXLDistance(value: 8, kind: "hyphen"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLDistance> = [MXLDistance(value: 8, kind: "hyphen"),
                                        MXLDistance(value: 8, kind: "hyphen"),
                                        MXLDistance(value: 6, kind: "beam")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLDistance(value: 8, kind: "hyphen") != MXLDistance(value: 6, kind: "beam"))
    }

    @Test
    func init_values() {
        let value = MXLDistance(value: 8, kind: "hyphen")

        #expect(value.kind == "hyphen")
        #expect(value.value == 8)
    }
}
