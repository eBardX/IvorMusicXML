// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBarlineStyleColorTests {
}

// MARK: -

extension MXLBarlineStyleColorTests {
    @Test
    func equality() {
        #expect(MXLBarline.StyleColor(value: .regular) == MXLBarline.StyleColor(value: .regular))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLBarline.StyleColor> = [MXLBarline.StyleColor(value: .regular),
                                                  MXLBarline.StyleColor(value: .regular),
                                                  MXLBarline.StyleColor(value: .tick)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBarline.StyleColor(value: .regular) != MXLBarline.StyleColor(value: .tick))
    }

    @Test
    func init_defaultValues() {
        let value = MXLBarline.StyleColor(value: .regular)

        #expect(value.color == nil)
        #expect(value.value == .regular)
    }

    @Test
    func init_explicitValues() {
        let value = MXLBarline.StyleColor(value: .regular,
                                          color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.value == .regular)
    }
}
