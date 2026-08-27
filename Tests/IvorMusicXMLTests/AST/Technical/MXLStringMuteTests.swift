// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStringMuteTests {
}

// MARK: -

extension MXLStringMuteTests {
    @Test
    func equality() {
        #expect(MXLStringMute(isOn: true) == MXLStringMute(isOn: true))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLStringMute> = [MXLStringMute(isOn: true), MXLStringMute(isOn: true), MXLStringMute(isOn: false)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLStringMute(isOn: true) != MXLStringMute(isOn: false))
    }

    @Test
    func init_defaultValues() {
        let value = MXLStringMute(isOn: true)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.halign == nil)
        #expect(value.id == nil)
        #expect(value.position == MXLPosition())
        #expect(value.valign == nil)
        #expect(value.isOn == true)
    }

    @Test
    func init_explicitValues() {
        let value = MXLStringMute(id: "sm1",
                                  isOn: false,
                                  position: MXLPosition(defaultX: 10),
                                  font: MXLFont(style: .italic),
                                  color: MXLColor(stringValue: "#800080"),
                                  halign: .center,
                                  valign: .middle)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.halign == .center)
        #expect(value.id == "sm1")
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.valign == .middle)
        #expect(value.isOn == false)
    }
}
