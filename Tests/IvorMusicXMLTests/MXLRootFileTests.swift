// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLRootFileTests {
}

// MARK: -

extension MXLRootFileTests {
    @Test
    func test_compressedMediaType() {
        #expect(MXLRootFile.compressedMediaType == "application/vnd.recordare.musicxml")
    }

    @Test
    func test_defaultMediaTypeIsUncompressed() {
        #expect(MXLRootFile.defaultMediaType == MXLRootFile.uncompressedMediaType)
    }

    @Test
    func test_initSetsFullPath() {
        let rootFile = MXLRootFile(fullPath: "path/to/score.xml",
                                   mediaType: MXLRootFile.defaultMediaType)

        #expect(rootFile.fullPath == "path/to/score.xml")
    }

    @Test
    func test_initSetsMediaType() {
        let rootFile = MXLRootFile(fullPath: "score.xml",
                                   mediaType: MXLRootFile.compressedMediaType)

        #expect(rootFile.mediaType == MXLRootFile.compressedMediaType)
    }

    @Test
    func test_oldCompressedMediaType() {
        #expect(MXLRootFile.oldCompressedMediaType == "application/musicxml+zip")
    }

    @Test
    func test_oldUncompressedMediaType() {
        #expect(MXLRootFile.oldUncompressedMediaType == "application/musicxml+xml")
    }

    @Test
    func test_uncompressedMediaType() {
        #expect(MXLRootFile.uncompressedMediaType == "application/vnd.recordare.musicxml+xml")
    }
}
