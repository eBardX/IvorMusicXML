// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLGroupSymbolTests {
}

// MARK: -

extension MXLGroupSymbolTests {
    @Test
    func equality() {
        #expect(MXLGroupSymbol(value: .brace) == MXLGroupSymbol(value: .brace))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLGroupSymbol> = [MXLGroupSymbol(value: .brace), MXLGroupSymbol(value: .brace), MXLGroupSymbol(value: .bracket)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLGroupSymbol(value: .brace) != MXLGroupSymbol(value: .bracket))
    }

    @Test
    func init_defaultValues() {
        let value = MXLGroupSymbol(value: .brace)

        #expect(value.color == nil)
        #expect(value.position == MXLPosition())
        #expect(value.value == .brace)
    }

    @Test
    func init_explicitValues() {
        let value = MXLGroupSymbol(value: .bracket, position: MXLPosition(defaultX: 10), color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.value == .bracket)
    }
}
