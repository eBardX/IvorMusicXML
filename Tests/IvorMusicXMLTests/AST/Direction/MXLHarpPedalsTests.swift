// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHarpPedalsTests {
}

// MARK: -

extension MXLHarpPedalsTests {
    @Test
    func equality() {
        #expect(MXLHarpPedals() == MXLHarpPedals())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLHarpPedals> = [MXLHarpPedals(), MXLHarpPedals(), MXLHarpPedals(id: "h2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHarpPedals() != MXLHarpPedals(id: "h2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLHarpPedals()

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.halign == nil)
        #expect(value.id == nil)
        #expect(value.pedalTuning.isEmpty)
        #expect(value.position == MXLPosition())
        #expect(value.valign == nil)
    }

    @Test
    func init_explicitValues() {
        let pedalTuning = [MXLPedalTuning(pedalStep: .d, pedalAlter: 0)]
        let value = MXLHarpPedals(id: "h1",
                                  pedalTuning: pedalTuning,
                                  position: MXLPosition(defaultX: 10),
                                  font: MXLFont(style: .italic),
                                  color: MXLColor(stringValue: "#800080"),
                                  halign: .center,
                                  valign: .middle)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.halign == .center)
        #expect(value.id == "h1")
        #expect(value.pedalTuning == pedalTuning)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.valign == .middle)
    }
}
