// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPageMarginsTests {
}

// MARK: -

extension MXLPageMarginsTests {
    @Test
    func equality() {
        let allMargins = MXLAllMargins(leftRightMargins: MXLLeftRightMargins(leftMargin: 10, rightMargin: 10), topMargin: 5, bottomMargin: 5)

        #expect(MXLPageMargins(allMargins: allMargins) == MXLPageMargins(allMargins: allMargins))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let allMargins = MXLAllMargins(leftRightMargins: MXLLeftRightMargins(leftMargin: 10, rightMargin: 10), topMargin: 5, bottomMargin: 5)
        let values: Set<MXLPageMargins> = [MXLPageMargins(allMargins: allMargins),
                                           MXLPageMargins(allMargins: allMargins),
                                           MXLPageMargins(allMargins: allMargins, kind: .odd)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let allMargins = MXLAllMargins(leftRightMargins: MXLLeftRightMargins(leftMargin: 10, rightMargin: 10), topMargin: 5, bottomMargin: 5)

        #expect(MXLPageMargins(allMargins: allMargins) != MXLPageMargins(allMargins: allMargins, kind: .odd))
    }

    @Test
    func init_defaultValues() {
        let allMargins = MXLAllMargins(leftRightMargins: MXLLeftRightMargins(leftMargin: 10, rightMargin: 10), topMargin: 5, bottomMargin: 5)
        let value = MXLPageMargins(allMargins: allMargins)

        #expect(value.allMargins == allMargins)
        #expect(value.kind == .both)
    }

    @Test
    func init_explicitValues() {
        let allMargins = MXLAllMargins(leftRightMargins: MXLLeftRightMargins(leftMargin: 10, rightMargin: 10), topMargin: 5, bottomMargin: 5)
        let value = MXLPageMargins(allMargins: allMargins, kind: .even)

        #expect(value.allMargins == allMargins)
        #expect(value.kind == .even)
    }
}
