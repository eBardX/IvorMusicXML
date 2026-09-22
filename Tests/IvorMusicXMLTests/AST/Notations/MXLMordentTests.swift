// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMordentTests {
}

// MARK: -

extension MXLMordentTests {
    @Test
    func equality() {
        #expect(MXLMordent() == MXLMordent())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLMordent> = [MXLMordent(), MXLMordent(), MXLMordent(isLong: true)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMordent() != MXLMordent(isLong: true))
    }

    @Test
    func init_defaultValues() {
        let value = MXLMordent()

        #expect(value.approach == nil)
        #expect(value.color == nil)
        #expect(value.departure == nil)
        #expect(value.font == MXLFont())
        #expect(value.isLong == false)
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.trillSound == MXLTrillSound())
    }

    @Test
    func init_explicitValues() {
        let trillSound = MXLTrillSound(startNote: .below)
        let value = MXLMordent(position: MXLPosition(defaultX: 10),
                               font: MXLFont(style: .italic),
                               color: MXLColor(stringValue: "#800080"),
                               placement: .above,
                               trillSound: trillSound,
                               isLong: true,
                               approach: .above,
                               departure: .below)

        #expect(value.approach == .above)
        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.departure == .below)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.isLong == true)
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.trillSound == trillSound)
    }
}
