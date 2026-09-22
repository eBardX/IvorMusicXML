// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDashedFormattingTests {
}

// MARK: -

extension MXLDashedFormattingTests {
    @Test
    func equality() {
        #expect(MXLDashedFormatting(dashLength: 4, spaceLength: 2) ==    // swiftlint:disable:this identical_operands
                 MXLDashedFormatting(dashLength: 4, spaceLength: 2))
    }

    @Test
    func hashable() {
        let values: Set<MXLDashedFormatting> = [MXLDashedFormatting(dashLength: 4, spaceLength: 2),
                                                MXLDashedFormatting(dashLength: 4, spaceLength: 2),
                                                MXLDashedFormatting(dashLength: 5, spaceLength: 3)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLDashedFormatting(dashLength: 4, spaceLength: 2) != MXLDashedFormatting(dashLength: 5, spaceLength: 3))
    }

    @Test
    func init_defaultValues() {
        let value = MXLDashedFormatting()

        #expect(value.dashLength == nil)
        #expect(value.spaceLength == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLDashedFormatting(dashLength: 4, spaceLength: 2)

        #expect(value.dashLength == 4)
        #expect(value.spaceLength == 2)
    }
}
