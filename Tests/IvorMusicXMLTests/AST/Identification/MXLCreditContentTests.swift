// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLCreditContentTests {
}

// MARK: -

extension MXLCreditContentTests {
    @Test
    func equality() {
        let alternativeContent = MXLCredit.Content.AlternativeContent.creditWords(MXLFormattedTextID(value: "Title"))

        #expect(MXLCredit.Content.alternative(content: alternativeContent, group: []) ==
                 .alternative(content: alternativeContent, group: []))
    }

    @Test
    func hashable() {
        let alternativeContent = MXLCredit.Content.AlternativeContent.creditWords(MXLFormattedTextID(value: "Title"))
        let alternative = MXLCredit.Content.alternative(content: alternativeContent, group: [])
        let image = MXLCredit.Content.creditImage(MXLImage(attributes: MXLImage.Attributes(source: "a.png", kind: "image/png")))
        let values: Set<MXLCredit.Content> = [alternative, alternative, image]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let alternativeContent = MXLCredit.Content.AlternativeContent.creditWords(MXLFormattedTextID(value: "Title"))
        let alternative = MXLCredit.Content.alternative(content: alternativeContent, group: [])
        let image = MXLCredit.Content.creditImage(MXLImage(attributes: MXLImage.Attributes(source: "a.png", kind: "image/png")))

        #expect(alternative != image)
    }
}
