// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLIdentificationTests {
}

// MARK: -

extension MXLIdentificationTests {
    @Test
    func equality() {
        #expect(MXLIdentification() == MXLIdentification())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLIdentification> = [MXLIdentification(), MXLIdentification(), MXLIdentification(source: "engraver")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLIdentification() != MXLIdentification(source: "engraver"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLIdentification()

        #expect(value.creator.isEmpty)
        #expect(value.encoding == nil)
        #expect(value.miscellaneous == nil)
        #expect(value.relation.isEmpty)
        #expect(value.rights.isEmpty)
        #expect(value.source == nil)
    }

    @Test
    func init_explicitValues() {
        let creator = [MXLTypedText(value: "Jane Doe", kind: "composer")]
        let rights = [MXLTypedText(value: "© 2026", kind: "music")]
        let encoding = MXLEncoding(items: [.software("Finale")])
        let relation = [MXLTypedText(value: "urn:isbn:0-486-27557-4")]
        let miscellaneous = MXLMiscellaneous(field: [MXLMiscellaneous.Field(value: "1", name: "key")])
        let value = MXLIdentification(creator: creator,
                                      rights: rights,
                                      encoding: encoding,
                                      source: "engraver",
                                      relation: relation,
                                      miscellaneous: miscellaneous)

        #expect(value.creator == creator)
        #expect(value.encoding == encoding)
        #expect(value.miscellaneous == miscellaneous)
        #expect(value.relation == relation)
        #expect(value.rights == rights)
        #expect(value.source == "engraver")
    }
}
