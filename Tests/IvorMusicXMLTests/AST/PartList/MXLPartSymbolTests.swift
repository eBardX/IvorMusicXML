// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPartSymbolTests {
}

// MARK: -

extension MXLPartSymbolTests {
    @Test
    func equality() {
        #expect(MXLPartSymbol(value: .brace) == MXLPartSymbol(value: .brace))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLPartSymbol> = [MXLPartSymbol(value: .brace), MXLPartSymbol(value: .brace), MXLPartSymbol(value: .bracket)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPartSymbol(value: .brace) != MXLPartSymbol(value: .bracket))
    }

    @Test
    func init_defaultValues() {
        let value = MXLPartSymbol(value: .brace)

        #expect(value.bottomStaff == nil)
        #expect(value.color == nil)
        #expect(value.position == MXLPosition())
        #expect(value.topStaff == nil)
        #expect(value.value == .brace)
    }

    @Test
    func init_explicitValues() {
        let value = MXLPartSymbol(value: .bracket,
                                  topStaff: MXLStaffNumber(uintValue: 1),
                                  bottomStaff: MXLStaffNumber(uintValue: 2),
                                  position: MXLPosition(defaultX: 10),
                                  color: MXLColor(stringValue: "#800080"))

        #expect(value.bottomStaff == MXLStaffNumber(uintValue: 2))
        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.topStaff == MXLStaffNumber(uintValue: 1))
        #expect(value.value == .bracket)
    }
}
