// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDocumentTests {
}

// MARK: -

extension MXLDocumentTests {
    @Test
    func equality() {
        let document = MXLDocument(content: .opus(MXLOpus(title: "Sample")))

        #expect(document == MXLDocument(content: .opus(MXLOpus(title: "Sample"))))
    }

    @Test
    func equality_ignoresTheFlags() {
        let parsed = MXLDocument(content: .opus(MXLOpus(title: "Sample")))
        let validated = MXLDocument(content: .opus(MXLOpus(title: "Sample")),
                                    isNormalized: true,
                                    isValidated: true)

        #expect(parsed == validated)
    }

    @Test
    func hashable() {
        let opus = MXLDocument(content: .opus(MXLOpus(title: "Sample")))
        let score = MXLDocument(content: .scorePartwise(MXLScorePartwise(partList: MXLPartList())))
        let values: Set<MXLDocument> = [opus, opus, score]

        #expect(values.count == 2)
    }

    @Test
    func hashable_ignoresTheFlags() {
        let parsed = MXLDocument(content: .opus(MXLOpus(title: "Sample")))
        let validated = MXLDocument(content: .opus(MXLOpus(title: "Sample")),
                                    isNormalized: true,
                                    isValidated: true)
        let values: Set<MXLDocument> = [parsed, validated]

        #expect(values.count == 1)
        #expect(parsed.hashValue == validated.hashValue)
    }

    @Test
    func inequality() {
        #expect(MXLDocument(content: .opus(MXLOpus(title: "Sample")))
                != MXLDocument(content: .scorePartwise(MXLScorePartwise(partList: MXLPartList()))))
    }

    @Test
    func init_defaultsBothFlagsToFalse() {
        let document = MXLDocument(content: .opus(MXLOpus(title: "Sample")))

        #expect(!document.isNormalized)
        #expect(!document.isValidated)
    }

    @Test
    func init_preservesContent() {
        let score = MXLScorePartwise(partList: MXLPartList())
        let document = MXLDocument(content: .scorePartwise(score))

        #expect(document.content == .scorePartwise(score))
    }
}
