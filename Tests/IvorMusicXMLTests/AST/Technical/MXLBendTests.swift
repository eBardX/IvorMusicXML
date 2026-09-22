// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBendTests {
}

// MARK: -

extension MXLBendTests {
    @Test
    func equality() {
        #expect(MXLBend(alter: 2) == MXLBend(alter: 2))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLBend> = [MXLBend(alter: 2), MXLBend(alter: 2), MXLBend(alter: 1)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBend(alter: 2) != MXLBend(alter: 1))
    }

    @Test
    func init_defaultValues() {
        let value = MXLBend(alter: 2)

        #expect(value.alter == 2)
        #expect(value.color == nil)
        #expect(value.content == nil)
        #expect(value.font == MXLFont())
        #expect(value.position == MXLPosition())
        #expect(value.shape == nil)
        #expect(value.sound == MXLBendSound())
        #expect(value.withBar == nil)
    }

    @Test
    func init_explicitValues() {
        let withBar = MXLPlacementText(value: "scoop", printStyle: MXLPrintStyle())
        let sound = MXLBendSound(accelerates: true)
        let value = MXLBend(alter: 1,
                            content: .preBend,
                            withBar: withBar,
                            shape: .curved,
                            position: MXLPosition(defaultX: 10),
                            font: MXLFont(style: .italic),
                            color: MXLColor(stringValue: "#800080"),
                            sound: sound)

        #expect(value.alter == 1)
        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.content == .preBend)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.shape == .curved)
        #expect(value.sound == sound)
        #expect(value.withBar == withBar)
    }
}
