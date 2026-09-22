// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNumeralRootTests {
}

// MARK: -

extension MXLNumeralRootTests {
    @Test
    func equality() {
        let numeralValue = MXLNumeral.Value(uintValue: 5)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLNumeral.Root(value: numeralValue) == MXLNumeral.Root(value: numeralValue))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let numeralValue = MXLNumeral.Value(uintValue: 5)!    // swiftlint:disable:this force_unwrapping
        let otherValue = MXLNumeral.Value(uintValue: 2)!    // swiftlint:disable:this force_unwrapping
        let values: Set<MXLNumeral.Root> = [MXLNumeral.Root(value: numeralValue),
                                            MXLNumeral.Root(value: numeralValue),
                                            MXLNumeral.Root(value: otherValue)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let numeralValue = MXLNumeral.Value(uintValue: 5)!    // swiftlint:disable:this force_unwrapping
        let otherValue = MXLNumeral.Value(uintValue: 2)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLNumeral.Root(value: numeralValue) != MXLNumeral.Root(value: otherValue))
    }

    @Test
    func init_defaultValues() {
        let numeralValue = MXLNumeral.Value(uintValue: 5)!    // swiftlint:disable:this force_unwrapping
        let value = MXLNumeral.Root(value: numeralValue)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.position == MXLPosition())
        #expect(value.text == nil)
        #expect(value.value == numeralValue)
    }

    @Test
    func init_explicitValues() {
        let numeralValue = MXLNumeral.Value(uintValue: 5)!    // swiftlint:disable:this force_unwrapping
        let value = MXLNumeral.Root(value: numeralValue,
                                    text: "V",
                                    position: MXLPosition(defaultX: 10),
                                    font: MXLFont(style: .italic),
                                    color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.text == "V")
        #expect(value.value == numeralValue)
    }
}
