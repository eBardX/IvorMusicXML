// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLClefContentTests {
}

// MARK: -

extension MXLClefContentTests {
    @Test
    func equality() {
        #expect(MXLClef.Content(sign: .g) == MXLClef.Content(sign: .g))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLClef.Content> = [MXLClef.Content(sign: .g),
                                            MXLClef.Content(sign: .g),
                                            MXLClef.Content(sign: .f)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLClef.Content(sign: .g) != MXLClef.Content(sign: .f))
    }

    @Test
    func init_defaultValues() {
        let value = MXLClef.Content(sign: .g)

        #expect(value.line == nil)
        #expect(value.octaveChange == nil)
        #expect(value.sign == .g)
    }

    @Test
    func init_explicitValues() {
        let value = MXLClef.Content(sign: .g,
                                    line: MXLStaffLinePosition(intValue: 2),
                                    octaveChange: MXLOctaveChange(intValue: -1))

        #expect(value.line == MXLStaffLinePosition(intValue: 2))
        #expect(value.octaveChange == MXLOctaveChange(intValue: -1))
        #expect(value.sign == .g)
    }
}
