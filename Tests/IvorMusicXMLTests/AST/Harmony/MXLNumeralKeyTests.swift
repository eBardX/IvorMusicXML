// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNumeralKeyTests {
}

// MARK: -

extension MXLNumeralKeyTests {
    @Test
    func equality() {
        let fifths = MXLFifths(intValue: 2)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLNumeral.Key(fifths: fifths, mode: .major) == MXLNumeral.Key(fifths: fifths, mode: .major))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let fifths = MXLFifths(intValue: 2)!    // swiftlint:disable:this force_unwrapping
        let values: Set<MXLNumeral.Key> = [MXLNumeral.Key(fifths: fifths, mode: .major),
                                           MXLNumeral.Key(fifths: fifths, mode: .major),
                                           MXLNumeral.Key(fifths: fifths, mode: .minor)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let fifths = MXLFifths(intValue: 2)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLNumeral.Key(fifths: fifths, mode: .major) != MXLNumeral.Key(fifths: fifths, mode: .minor))
    }

    @Test
    func init_defaultValues() {
        let fifths = MXLFifths(intValue: 2)!    // swiftlint:disable:this force_unwrapping
        let value = MXLNumeral.Key(fifths: fifths, mode: .major)

        #expect(value.fifths == fifths)
        #expect(value.mode == .major)
        #expect(value.printsObject == nil)
    }

    @Test
    func init_explicitValues() {
        let fifths = MXLFifths(intValue: 2)!    // swiftlint:disable:this force_unwrapping
        let value = MXLNumeral.Key(fifths: fifths, mode: .minor, printsObject: false)

        #expect(value.fifths == fifths)
        #expect(value.mode == .minor)
        #expect(value.printsObject == false)
    }
}
