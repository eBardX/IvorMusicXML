// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBeamTests {
}

// MARK: -

extension MXLBeamTests {
    @Test
    func equality() {
        #expect(MXLBeam(value: .begin) == MXLBeam(value: .begin))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLBeam> = [MXLBeam(value: .begin), MXLBeam(value: .begin), MXLBeam(value: .end)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBeam(value: .begin) != MXLBeam(value: .end))
    }

    @Test
    func init_defaultValues() {
        let value = MXLBeam(value: .begin)

        #expect(value.color == nil)
        #expect(value.fan == nil)
        #expect(value.id == nil)
        #expect(value.number == MXLBeamLevel(uintValue: 1))
        #expect(value.repeater == nil)
        #expect(value.value == .begin)
    }

    @Test
    func init_explicitValues() {
        let value = MXLBeam(id: "b1",
                            value: .end,
                            number: MXLBeamLevel(uintValue: 2),
                            repeater: true,
                            fan: .accel,
                            color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.fan == .accel)
        #expect(value.id == "b1")
        #expect(value.number == MXLBeamLevel(uintValue: 2))
        #expect(value.repeater == true)
        #expect(value.value == .end)
    }
}
