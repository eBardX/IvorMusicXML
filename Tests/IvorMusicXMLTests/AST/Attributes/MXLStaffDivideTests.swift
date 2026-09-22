// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStaffDivideTests {
}

// MARK: -

extension MXLStaffDivideTests {
    @Test
    func equality() {
        #expect(MXLStaffDivide(kind: .down) == MXLStaffDivide(kind: .down))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLStaffDivide> = [MXLStaffDivide(kind: .down), MXLStaffDivide(kind: .down), MXLStaffDivide(kind: .up)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLStaffDivide(kind: .down) != MXLStaffDivide(kind: .up))
    }

    @Test
    func init_defaultValues() {
        let value = MXLStaffDivide(kind: .down)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.halign == nil)
        #expect(value.id == nil)
        #expect(value.kind == .down)
        #expect(value.position == MXLPosition())
        #expect(value.valign == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLStaffDivide(id: "sd1",
                                   kind: .up,
                                   position: MXLPosition(defaultX: 10),
                                   font: MXLFont(style: .italic),
                                   color: MXLColor(stringValue: "#800080"),
                                   halign: .center,
                                   valign: .middle)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.halign == .center)
        #expect(value.id == "sd1")
        #expect(value.kind == .up)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.valign == .middle)
    }
}
