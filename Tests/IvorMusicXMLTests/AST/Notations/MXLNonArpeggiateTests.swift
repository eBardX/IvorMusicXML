// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNonArpeggiateTests {
}

// MARK: -

extension MXLNonArpeggiateTests {
    @Test
    func equality() {
        #expect(MXLNonArpeggiate(kind: .top) == MXLNonArpeggiate(kind: .top))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLNonArpeggiate> = [MXLNonArpeggiate(kind: .top), MXLNonArpeggiate(kind: .top), MXLNonArpeggiate(kind: .bottom)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLNonArpeggiate(kind: .top) != MXLNonArpeggiate(kind: .bottom))
    }

    @Test
    func init_defaultValues() {
        let value = MXLNonArpeggiate(kind: .top)

        #expect(value.color == nil)
        #expect(value.id == nil)
        #expect(value.number == nil)
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.kind == .top)
    }

    @Test
    func init_explicitValues() {
        let value = MXLNonArpeggiate(id: "na1",
                                     kind: .bottom,
                                     number: MXLNumberLevel(uintValue: 1),
                                     position: MXLPosition(defaultX: 10),
                                     placement: .above,
                                     color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.id == "na1")
        #expect(value.number == MXLNumberLevel(uintValue: 1))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.kind == .bottom)
    }
}
