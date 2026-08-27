// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFeatureTests {
}

// MARK: -

extension MXLFeatureTests {
    @Test
    func equality() {
        #expect(MXLFeature(value: "1") == MXLFeature(value: "1"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLFeature> = [MXLFeature(value: "1"), MXLFeature(value: "1"), MXLFeature(value: "2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLFeature(value: "1") != MXLFeature(value: "2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLFeature(value: "1")

        #expect(value.kind == nil)
        #expect(value.value == "1")
    }

    @Test
    func init_explicitValues() {
        let value = MXLFeature(value: "1", kind: "pitch")

        #expect(value.kind == "pitch")
        #expect(value.value == "1")
    }
}
