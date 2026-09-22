// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLImageTests {
}

// MARK: -

extension MXLImageTests {
    @Test
    func equality() {
        let attributes = MXLImage.Attributes(source: "image.png", kind: "image/png")

        #expect(MXLImage(attributes: attributes) == MXLImage(attributes: attributes))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let attributes = MXLImage.Attributes(source: "image.png", kind: "image/png")
        let values: Set<MXLImage> = [MXLImage(attributes: attributes),
                                     MXLImage(attributes: attributes),
                                     MXLImage(id: "id1", attributes: attributes)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let attributes = MXLImage.Attributes(source: "image.png", kind: "image/png")

        #expect(MXLImage(attributes: attributes) != MXLImage(id: "id1", attributes: attributes))
    }

    @Test
    func init_defaultValues() {
        let attributes = MXLImage.Attributes(source: "image.png", kind: "image/png")
        let value = MXLImage(attributes: attributes)

        #expect(value.attributes == attributes)
        #expect(value.id == nil)
    }

    @Test
    func init_explicitValues() {
        let attributes = MXLImage.Attributes(source: "image.png", kind: "image/png")
        let value = MXLImage(id: "id1",
                             attributes: attributes)

        #expect(value.attributes == attributes)
        #expect(value.id == "id1")
    }
}
