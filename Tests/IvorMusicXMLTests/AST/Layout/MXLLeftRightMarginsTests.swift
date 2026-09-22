// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLeftRightMarginsTests {
}

// MARK: -

extension MXLLeftRightMarginsTests {
    @Test
    func equality() {
        #expect(MXLLeftRightMargins(leftMargin: 10, rightMargin: 10) ==    // swiftlint:disable:this identical_operands
                 MXLLeftRightMargins(leftMargin: 10, rightMargin: 10))
    }

    @Test
    func hashable() {
        let values: Set<MXLLeftRightMargins> = [MXLLeftRightMargins(leftMargin: 10, rightMargin: 10),
                                                MXLLeftRightMargins(leftMargin: 10, rightMargin: 10),
                                                MXLLeftRightMargins(leftMargin: 12, rightMargin: 12)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLLeftRightMargins(leftMargin: 10, rightMargin: 10) != MXLLeftRightMargins(leftMargin: 12, rightMargin: 12))
    }

    @Test
    func init_values() {
        let value = MXLLeftRightMargins(leftMargin: 10, rightMargin: 12)

        #expect(value.leftMargin == 10)
        #expect(value.rightMargin == 12)
    }
}
