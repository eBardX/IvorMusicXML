// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSystemMarginsTests {
}

// MARK: -

extension MXLSystemMarginsTests {
    @Test
    func equality() {
        let leftRight = MXLLeftRightMargins(leftMargin: 10, rightMargin: 10)

        #expect(MXLSystemMargins(leftRightMargins: leftRight) == MXLSystemMargins(leftRightMargins: leftRight))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let leftRight = MXLLeftRightMargins(leftMargin: 10, rightMargin: 10)
        let otherLeftRight = MXLLeftRightMargins(leftMargin: 12, rightMargin: 12)
        let values: Set<MXLSystemMargins> = [MXLSystemMargins(leftRightMargins: leftRight),
                                             MXLSystemMargins(leftRightMargins: leftRight),
                                             MXLSystemMargins(leftRightMargins: otherLeftRight)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let leftRight = MXLLeftRightMargins(leftMargin: 10, rightMargin: 10)
        let otherLeftRight = MXLLeftRightMargins(leftMargin: 12, rightMargin: 12)

        #expect(MXLSystemMargins(leftRightMargins: leftRight) != MXLSystemMargins(leftRightMargins: otherLeftRight))
    }

    @Test
    func init_values() {
        let leftRight = MXLLeftRightMargins(leftMargin: 10, rightMargin: 10)
        let value = MXLSystemMargins(leftRightMargins: leftRight)

        #expect(value.leftRightMargins == leftRight)
    }
}
