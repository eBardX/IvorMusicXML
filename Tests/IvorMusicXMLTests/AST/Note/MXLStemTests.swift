// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStemTests {
}

// MARK: -

extension MXLStemTests {
    @Test
    func equality() {
        #expect(MXLStem(value: .up) == MXLStem(value: .up))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLStem> = [MXLStem(value: .up), MXLStem(value: .up), MXLStem(value: .down)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLStem(value: .up) != MXLStem(value: .down))
    }

    @Test
    func init_defaultValues() {
        let value = MXLStem(value: .up)

        #expect(value.color == nil)
        #expect(value.value == .up)
        #expect(value.yPosition == MXLYPosition())
    }

    @Test
    func init_explicitValues() {
        let yPosition = MXLYPosition(defaultY: 10)
        let value = MXLStem(value: .down, yPosition: yPosition, color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.value == .down)
        #expect(value.yPosition == yPosition)
    }
}
