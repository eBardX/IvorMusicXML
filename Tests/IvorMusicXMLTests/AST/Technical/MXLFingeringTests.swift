// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFingeringTests {
}

// MARK: -

extension MXLFingeringTests {
    @Test
    func equality() {
        #expect(MXLFingering(value: "1") == MXLFingering(value: "1"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLFingering> = [MXLFingering(value: "1"), MXLFingering(value: "1"), MXLFingering(value: "2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLFingering(value: "1") != MXLFingering(value: "2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLFingering(value: "1")

        #expect(value.isAlternate == nil)
        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.isSubstitute == nil)
        #expect(value.value == "1")
    }

    @Test
    func init_explicitValues() {
        let value = MXLFingering(value: "2",
                                 isSubstitute: true,
                                 isAlternate: true,
                                 position: MXLPosition(defaultX: 10),
                                 font: MXLFont(style: .italic),
                                 color: MXLColor(stringValue: "#800080"),
                                 placement: .above)

        #expect(value.isAlternate == true)
        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.isSubstitute == true)
        #expect(value.value == "2")
    }
}
