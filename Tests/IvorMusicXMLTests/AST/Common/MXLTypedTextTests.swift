// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTypedTextTests {
}

// MARK: -

extension MXLTypedTextTests {
    @Test
    func equality() {
        #expect(MXLTypedText(value: "A. Composer", kind: "composer") ==    // swiftlint:disable:this identical_operands
                 MXLTypedText(value: "A. Composer", kind: "composer"))
    }

    @Test
    func hashable() {
        let values: Set<MXLTypedText> = [MXLTypedText(value: "A. Composer", kind: "composer"),
                                         MXLTypedText(value: "A. Composer", kind: "composer"),
                                         MXLTypedText(value: "A. Composer")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTypedText(value: "A. Composer", kind: "composer") != MXLTypedText(value: "A. Composer"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLTypedText(value: "A. Composer")

        #expect(value.kind == nil)
        #expect(value.value == "A. Composer")
    }

    @Test
    func init_explicitValues() {
        let value = MXLTypedText(value: "A. Composer",
                                 kind: "composer")

        #expect(value.kind == "composer")
        #expect(value.value == "A. Composer")
    }
}
