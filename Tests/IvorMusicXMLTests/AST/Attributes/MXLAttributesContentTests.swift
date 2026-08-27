// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLAttributesContentTests {
}

// MARK: -

extension MXLAttributesContentTests {
    @Test
    func equality() {
        let forPart = MXLForPart(transpose: MXLTranspose.Content(chromatic: 0))

        #expect(MXLAttributes.Content.forPart([forPart]) == .forPart([forPart]))
    }

    @Test
    func hashable() {
        let forPart = MXLAttributes.Content.forPart([MXLForPart(transpose: MXLTranspose.Content(chromatic: 0))])
        let transpose = MXLAttributes.Content.transpose([MXLTranspose(content: MXLTranspose.Content(chromatic: 2))])
        let values: Set<MXLAttributes.Content> = [forPart, forPart, transpose]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let forPart = MXLForPart(transpose: MXLTranspose.Content(chromatic: 0))
        let transpose = MXLTranspose(content: MXLTranspose.Content(chromatic: 2))

        #expect(MXLAttributes.Content.forPart([forPart]) != .transpose([transpose]))
    }
}
