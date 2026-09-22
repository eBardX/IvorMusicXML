// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTraditionalKeyTests {
}

// MARK: -

extension MXLTraditionalKeyTests {
    @Test
    func equality() {
        let fifths = MXLFifths(intValue: 2)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLTraditionalKey(fifths: fifths) == MXLTraditionalKey(fifths: fifths))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let fifths1 = MXLFifths(intValue: 2)!    // swiftlint:disable:this force_unwrapping
        let fifths2 = MXLFifths(intValue: -2)!    // swiftlint:disable:this force_unwrapping
        let values: Set<MXLTraditionalKey> = [MXLTraditionalKey(fifths: fifths1),
                                              MXLTraditionalKey(fifths: fifths1),
                                              MXLTraditionalKey(fifths: fifths2)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let fifths1 = MXLFifths(intValue: 2)!    // swiftlint:disable:this force_unwrapping
        let fifths2 = MXLFifths(intValue: -2)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLTraditionalKey(fifths: fifths1) != MXLTraditionalKey(fifths: fifths2))
    }

    @Test
    func init_defaultValues() {
        let fifths = MXLFifths(intValue: 2)!    // swiftlint:disable:this force_unwrapping
        let value = MXLTraditionalKey(fifths: fifths)

        #expect(value.cancel == nil)
        #expect(value.fifths == fifths)
        #expect(value.mode == nil)
    }

    @Test
    func init_explicitValues() {
        let fifths = MXLFifths(intValue: 2)!    // swiftlint:disable:this force_unwrapping
        let cancel = MXLCancel(value: -2)
        let value = MXLTraditionalKey(cancel: cancel,
                                      fifths: fifths,
                                      mode: "major")

        #expect(value.cancel == cancel)
        #expect(value.fifths == fifths)
        #expect(value.mode == "major")
    }
}
