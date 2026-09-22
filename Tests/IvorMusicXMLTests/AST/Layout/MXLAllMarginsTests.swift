// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLAllMarginsTests {
}

// MARK: -

extension MXLAllMarginsTests {
    @Test
    func equality() {
        let leftRight = MXLLeftRightMargins(leftMargin: 10, rightMargin: 10)

        #expect(MXLAllMargins(leftRightMargins: leftRight, topMargin: 5, bottomMargin: 5) ==    // swiftlint:disable:this identical_operands
                 MXLAllMargins(leftRightMargins: leftRight, topMargin: 5, bottomMargin: 5))
    }

    @Test
    func hashable() {
        let leftRight = MXLLeftRightMargins(leftMargin: 10, rightMargin: 10)
        let values: Set<MXLAllMargins> = [MXLAllMargins(leftRightMargins: leftRight, topMargin: 5, bottomMargin: 5),
                                          MXLAllMargins(leftRightMargins: leftRight, topMargin: 5, bottomMargin: 5),
                                          MXLAllMargins(leftRightMargins: leftRight, topMargin: 6, bottomMargin: 6)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let leftRight = MXLLeftRightMargins(leftMargin: 10, rightMargin: 10)

        #expect(MXLAllMargins(leftRightMargins: leftRight, topMargin: 5, bottomMargin: 5) !=
                 MXLAllMargins(leftRightMargins: leftRight, topMargin: 6, bottomMargin: 6))
    }

    @Test
    func init_values() {
        let leftRight = MXLLeftRightMargins(leftMargin: 10, rightMargin: 10)
        let value = MXLAllMargins(leftRightMargins: leftRight, topMargin: 5, bottomMargin: 6)

        #expect(value.bottomMargin == 6)
        #expect(value.leftRightMargins == leftRight)
        #expect(value.topMargin == 5)
    }
}
