// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLImageAttributesTests {
}

// MARK: -

extension MXLImageAttributesTests {
    @Test
    func equality() {
        #expect(MXLImage.Attributes(source: "image.png", kind: "image/png") ==    // swiftlint:disable:this identical_operands
                 MXLImage.Attributes(source: "image.png", kind: "image/png"))
    }

    @Test
    func hashable() {
        let values: Set<MXLImage.Attributes> = [MXLImage.Attributes(source: "image.png", kind: "image/png"),
                                                MXLImage.Attributes(source: "image.png", kind: "image/png"),
                                                MXLImage.Attributes(source: "other.png", kind: "image/png")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLImage.Attributes(source: "image.png", kind: "image/png") !=
                 MXLImage.Attributes(source: "other.png", kind: "image/png"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLImage.Attributes(source: "image.png", kind: "image/png")

        #expect(value.halign == nil)
        #expect(value.height == nil)
        #expect(value.kind == "image/png")
        #expect(value.position == MXLPosition())
        #expect(value.source == "image.png")
        #expect(value.valign == nil)
        #expect(value.width == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLImage.Attributes(source: "image.png",
                                        kind: "image/png",
                                        height: 100,
                                        width: 200,
                                        position: MXLPosition(defaultX: 10),
                                        halign: .center,
                                        valign: .middle)

        #expect(value.halign == .center)
        #expect(value.height == 100)
        #expect(value.kind == "image/png")
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.source == "image.png")
        #expect(value.valign == .middle)
        #expect(value.width == 200)
    }
}
