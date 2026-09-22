// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStrongAccentTests {
}

// MARK: -

extension MXLStrongAccentTests {
    @Test
    func equality() {
        #expect(MXLStrongAccent() == MXLStrongAccent())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLStrongAccent> = [MXLStrongAccent(), MXLStrongAccent(), MXLStrongAccent(kind: .down)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLStrongAccent() != MXLStrongAccent(kind: .down))
    }

    @Test
    func init_defaultValues() {
        let value = MXLStrongAccent()

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.kind == .up)
    }

    @Test
    func init_explicitValues() {
        let value = MXLStrongAccent(position: MXLPosition(defaultX: 10),
                                    font: MXLFont(style: .italic),
                                    color: MXLColor(stringValue: "#800080"),
                                    placement: .above,
                                    kind: .down)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.kind == .down)
    }
}
