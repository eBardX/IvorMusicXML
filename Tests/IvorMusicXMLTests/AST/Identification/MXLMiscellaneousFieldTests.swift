// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMiscellaneousFieldTests {
}

// MARK: -

extension MXLMiscellaneousFieldTests {
    @Test
    func equality() {
        #expect(MXLMiscellaneous.Field(value: "1", name: "key") == MXLMiscellaneous.Field(value: "1", name: "key"))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLMiscellaneous.Field> = [MXLMiscellaneous.Field(value: "1", name: "key"),
                                                   MXLMiscellaneous.Field(value: "1", name: "key"),
                                                   MXLMiscellaneous.Field(value: "2", name: "key")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMiscellaneous.Field(value: "1", name: "key") != MXLMiscellaneous.Field(value: "2", name: "key"))
    }

    @Test
    func init_values() {
        let value = MXLMiscellaneous.Field(value: "1", name: "key")

        #expect(value.name == "key")
        #expect(value.value == "1")
    }
}
