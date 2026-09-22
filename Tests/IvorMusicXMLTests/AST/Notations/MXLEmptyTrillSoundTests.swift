// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLEmptyTrillSoundTests {
}

// MARK: -

extension MXLEmptyTrillSoundTests {
    @Test
    func equality() {
        #expect(MXLEmptyTrillSound() == MXLEmptyTrillSound())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLEmptyTrillSound> = [MXLEmptyTrillSound(), MXLEmptyTrillSound(), MXLEmptyTrillSound(placement: .above)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLEmptyTrillSound() != MXLEmptyTrillSound(placement: .above))
    }

    @Test
    func init_defaultValues() {
        let value = MXLEmptyTrillSound()

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.trillSound == MXLTrillSound())
    }

    @Test
    func init_explicitValues() {
        let trillSound = MXLTrillSound(startNote: .below)
        let value = MXLEmptyTrillSound(position: MXLPosition(defaultX: 10),
                                       font: MXLFont(style: .italic),
                                       color: MXLColor(stringValue: "#800080"),
                                       placement: .above,
                                       trillSound: trillSound)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.trillSound == trillSound)
    }
}
