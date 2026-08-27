// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBassStepTests {
}

// MARK: -

extension MXLBassStepTests {
    @Test
    func equality() {
        #expect(MXLBass.Step(value: .c) == MXLBass.Step(value: .c))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLBass.Step> = [MXLBass.Step(value: .c), MXLBass.Step(value: .c), MXLBass.Step(value: .d)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBass.Step(value: .c) != MXLBass.Step(value: .d))
    }

    @Test
    func init_defaultValues() {
        let value = MXLBass.Step(value: .c)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.position == MXLPosition())
        #expect(value.text == nil)
        #expect(value.value == .c)
    }

    @Test
    func init_explicitValues() {
        let value = MXLBass.Step(value: .d,
                                 text: "D",
                                 position: MXLPosition(defaultX: 10),
                                 font: MXLFont(style: .italic),
                                 color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.text == "D")
        #expect(value.value == .d)
    }
}
