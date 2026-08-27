// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHarmonyChordKindTests {
}

// MARK: -

extension MXLHarmonyChordKindTests {
    @Test
    func equality() {
        #expect(MXLHarmony.Chord.Kind(value: .major) == MXLHarmony.Chord.Kind(value: .major))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLHarmony.Chord.Kind> = [MXLHarmony.Chord.Kind(value: .major),
                                                  MXLHarmony.Chord.Kind(value: .major),
                                                  MXLHarmony.Chord.Kind(value: .minor)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHarmony.Chord.Kind(value: .major) != MXLHarmony.Chord.Kind(value: .minor))
    }

    @Test
    func init_defaultValues() {
        let value = MXLHarmony.Chord.Kind(value: .major)

        #expect(value.areDegreesBracketed == nil)
        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.halign == nil)
        #expect(value.areDegreesInParentheses == nil)
        #expect(value.position == MXLPosition())
        #expect(value.areDegreesStacked == nil)
        #expect(value.text == nil)
        #expect(value.usesSymbols == nil)
        #expect(value.valign == nil)
        #expect(value.value == .major)
    }

    @Test
    func init_explicitValues() {
        let value = MXLHarmony.Chord.Kind(value: .minor,
                                          usesSymbols: true,
                                          text: "m",
                                          areDegreesStacked: true,
                                          areDegreesInParentheses: true,
                                          areDegreesBracketed: true,
                                          position: MXLPosition(defaultX: 10),
                                          font: MXLFont(style: .italic),
                                          color: MXLColor(stringValue: "#800080"),
                                          halign: .center,
                                          valign: .middle)

        #expect(value.areDegreesBracketed == true)
        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.halign == .center)
        #expect(value.areDegreesInParentheses == true)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.areDegreesStacked == true)
        #expect(value.text == "m")
        #expect(value.usesSymbols == true)
        #expect(value.valign == .middle)
        #expect(value.value == .minor)
    }
}
