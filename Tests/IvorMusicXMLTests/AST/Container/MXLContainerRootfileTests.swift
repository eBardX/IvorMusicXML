// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLContainerRootfileTests {
}

// MARK: -

extension MXLContainerRootfileTests {
    @Test
    func defaultMediaType() {
        #expect(MXLContainer.Rootfile.defaultMediaType == MXLContainer.Rootfile.uncompressedMediaType)
    }

    @Test
    func equality() {
        #expect(MXLContainer.Rootfile(fullPath: "a.xml") ==    // swiftlint:disable:this identical_operands
                 MXLContainer.Rootfile(fullPath: "a.xml"))
    }

    @Test
    func hashable() {
        let values: Set<MXLContainer.Rootfile> = [MXLContainer.Rootfile(fullPath: "a.xml"),
                                                  MXLContainer.Rootfile(fullPath: "a.xml"),
                                                  MXLContainer.Rootfile(fullPath: "b.xml")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLContainer.Rootfile(fullPath: "a.xml") != MXLContainer.Rootfile(fullPath: "b.xml"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLContainer.Rootfile(fullPath: "a.xml")

        #expect(value.fullPath == "a.xml")
        #expect(value.mediaType == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLContainer.Rootfile(fullPath: "a.xml", mediaType: "application/vnd.recordare.musicxml")

        #expect(value.fullPath == "a.xml")
        #expect(value.mediaType == "application/vnd.recordare.musicxml")
    }
}
