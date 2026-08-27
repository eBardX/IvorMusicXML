// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLArpeggiateTests {
}

// MARK: -

extension MXLArpeggiateTests {
    @Test
    func equality() {
        #expect(MXLArpeggiate() == MXLArpeggiate())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLArpeggiate> = [MXLArpeggiate(), MXLArpeggiate(), MXLArpeggiate(id: "a2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLArpeggiate() != MXLArpeggiate(id: "a2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLArpeggiate()

        #expect(value.color == nil)
        #expect(value.direction == nil)
        #expect(value.id == nil)
        #expect(value.number == nil)
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.isUnbroken == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLArpeggiate(id: "a1",
                                  number: MXLNumberLevel(uintValue: 1),
                                  direction: .up,
                                  isUnbroken: true,
                                  position: MXLPosition(defaultX: 10),
                                  placement: .above,
                                  color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.direction == .up)
        #expect(value.id == "a1")
        #expect(value.number == MXLNumberLevel(uintValue: 1))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.isUnbroken == true)
    }
}
