// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMiscellaneousTests {
}

// MARK: -

extension MXLMiscellaneousTests {
    @Test
    func equality() {
        #expect(MXLMiscellaneous() == MXLMiscellaneous())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let field = [MXLMiscellaneous.Field(value: "1", name: "key")]
        let values: Set<MXLMiscellaneous> = [MXLMiscellaneous(), MXLMiscellaneous(), MXLMiscellaneous(field: field)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let field = [MXLMiscellaneous.Field(value: "1", name: "key")]

        #expect(MXLMiscellaneous() != MXLMiscellaneous(field: field))
    }

    @Test
    func init_defaultValues() {
        let value = MXLMiscellaneous()

        #expect(value.field.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let field = [MXLMiscellaneous.Field(value: "1", name: "key")]
        let value = MXLMiscellaneous(field: field)

        #expect(value.field == field)
    }
}
