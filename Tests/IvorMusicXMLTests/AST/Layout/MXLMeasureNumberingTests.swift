// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMeasureNumberingTests {
}

// MARK: -

extension MXLMeasureNumberingTests {
    @Test
    func equality() {
        #expect(MXLMeasureNumbering(value: .system) == MXLMeasureNumbering(value: .system))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLMeasureNumbering> = [MXLMeasureNumbering(value: .system),
                                                MXLMeasureNumbering(value: .system),
                                                MXLMeasureNumbering(value: .measure)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMeasureNumbering(value: .system) != MXLMeasureNumbering(value: .measure))
    }

    @Test
    func init_defaultValues() {
        let value = MXLMeasureNumbering(value: .system)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.halign == nil)
        #expect(value.alwaysShowsOnMultipleRest == nil)
        #expect(value.showsRangeOnMultipleRest == nil)
        #expect(value.position == MXLPosition())
        #expect(value.staff == nil)
        #expect(value.system == nil)
        #expect(value.valign == nil)
        #expect(value.value == .system)
    }

    @Test
    func init_explicitValues() {
        let value = MXLMeasureNumbering(value: .measure,
                                        system: .onlyTop,
                                        staff: MXLStaffNumber(uintValue: 1),
                                        alwaysShowsOnMultipleRest: true,
                                        showsRangeOnMultipleRest: true,
                                        position: MXLPosition(defaultX: 10),
                                        font: MXLFont(style: .italic),
                                        color: MXLColor(stringValue: "#800080"),
                                        halign: .center,
                                        valign: .middle)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.halign == .center)
        #expect(value.alwaysShowsOnMultipleRest == true)
        #expect(value.showsRangeOnMultipleRest == true)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.staff == MXLStaffNumber(uintValue: 1))
        #expect(value.system == .onlyTop)
        #expect(value.valign == .middle)
        #expect(value.value == .measure)
    }
}
