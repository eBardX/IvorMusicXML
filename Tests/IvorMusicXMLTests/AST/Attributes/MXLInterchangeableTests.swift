// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLInterchangeableTests {
}

// MARK: -

extension MXLInterchangeableTests {
    @Test
    func equality() {
        #expect(MXLInterchangeable() == MXLInterchangeable())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLInterchangeable> = [MXLInterchangeable(),
                                               MXLInterchangeable(),
                                               MXLInterchangeable(symbol: .common)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLInterchangeable() != MXLInterchangeable(symbol: .common))
    }

    @Test
    func init_defaultValues() {
        let value = MXLInterchangeable()

        #expect(value.separator == .stacked)
        #expect(value.symbol == nil)
        #expect(value.timeRelation == nil)
        #expect(value.timeSignature.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let timeSignature = [MXLTimeSignature(beats: "6", beatType: "8")]
        let value = MXLInterchangeable(timeRelation: .bracket,
                                       timeSignature: timeSignature,
                                       symbol: .common,
                                       separator: .vertical)

        #expect(value.separator == .vertical)
        #expect(value.symbol == .common)
        #expect(value.timeRelation == .bracket)
        #expect(value.timeSignature == timeSignature)
    }
}
