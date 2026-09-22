// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPerMinuteTests {
}

// MARK: -

extension MXLPerMinuteTests {
    @Test
    func equality() {
        #expect(MXLPerMinute(value: "80") == MXLPerMinute(value: "80"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLPerMinute> = [MXLPerMinute(value: "80"), MXLPerMinute(value: "80"), MXLPerMinute(value: "120")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPerMinute(value: "80") != MXLPerMinute(value: "120"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLPerMinute(value: "80")

        #expect(value.font == MXLFont())
        #expect(value.value == "80")
    }

    @Test
    func init_explicitValues() {
        let value = MXLPerMinute(value: "80", font: MXLFont(style: .italic))

        #expect(value.font == MXLFont(style: .italic))
        #expect(value.value == "80")
    }
}
