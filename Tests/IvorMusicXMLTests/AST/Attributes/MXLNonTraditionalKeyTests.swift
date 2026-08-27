// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNonTraditionalKeyTests {
}

// MARK: -

extension MXLNonTraditionalKeyTests {
    @Test
    func equality() {
        #expect(MXLNonTraditionalKey(step: .c, alter: 1) == MXLNonTraditionalKey(step: .c, alter: 1))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLNonTraditionalKey> = [MXLNonTraditionalKey(step: .c, alter: 1),
                                                 MXLNonTraditionalKey(step: .c, alter: 1),
                                                 MXLNonTraditionalKey(step: .d, alter: -1)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLNonTraditionalKey(step: .c, alter: 1) != MXLNonTraditionalKey(step: .d, alter: -1))
    }

    @Test
    func init_defaultValues() {
        let value = MXLNonTraditionalKey(step: .c, alter: 1)

        #expect(value.accidental == nil)
        #expect(value.alter == 1)
        #expect(value.step == .c)
    }

    @Test
    func init_explicitValues() {
        let value = MXLNonTraditionalKey(step: .c,
                                         alter: 1,
                                         accidental: MXLKeyAccidental(value: .sharp))

        #expect(value.accidental == MXLKeyAccidental(value: .sharp))
        #expect(value.alter == 1)
        #expect(value.step == .c)
    }
}
