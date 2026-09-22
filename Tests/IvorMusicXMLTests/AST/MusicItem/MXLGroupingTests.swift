// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLGroupingTests {
}

// MARK: -

extension MXLGroupingTests {
    @Test
    func equality() {
        #expect(MXLGrouping(kind: .start) == MXLGrouping(kind: .start))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLGrouping> = [MXLGrouping(kind: .start), MXLGrouping(kind: .start), MXLGrouping(kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLGrouping(kind: .start) != MXLGrouping(kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let value = MXLGrouping(kind: .start)

        #expect(value.feature.isEmpty)
        #expect(value.id == nil)
        #expect(value.memberOf == nil)
        #expect(value.number == "1")
        #expect(value.kind == .start)
    }

    @Test
    func init_explicitValues() {
        let feature = [MXLFeature(value: "1", kind: "pitch")]
        let value = MXLGrouping(id: "g1", feature: feature, kind: .stop, number: "2", memberOf: "phrase")

        #expect(value.feature == feature)
        #expect(value.id == "g1")
        #expect(value.memberOf == "phrase")
        #expect(value.number == "2")
        #expect(value.kind == .stop)
    }
}
