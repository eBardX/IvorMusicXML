// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHorizontalTurnTests {
}

// MARK: -

extension MXLHorizontalTurnTests {
    @Test
    func equality() {
        #expect(MXLHorizontalTurn() == MXLHorizontalTurn())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLHorizontalTurn> = [MXLHorizontalTurn(), MXLHorizontalTurn(), MXLHorizontalTurn(isSlashed: true)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHorizontalTurn() != MXLHorizontalTurn(isSlashed: true))
    }

    @Test
    func init_defaultValues() {
        let value = MXLHorizontalTurn()

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.isSlashed == nil)
        #expect(value.trillSound == MXLTrillSound())
    }

    @Test
    func init_explicitValues() {
        let trillSound = MXLTrillSound(startNote: .below)
        let value = MXLHorizontalTurn(position: MXLPosition(defaultX: 10),
                                      font: MXLFont(style: .italic),
                                      color: MXLColor(stringValue: "#800080"),
                                      placement: .above,
                                      trillSound: trillSound,
                                      isSlashed: true)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.isSlashed == true)
        #expect(value.trillSound == trillSound)
    }
}
