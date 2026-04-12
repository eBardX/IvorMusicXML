// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLContainerTests {
}

// MARK: -

extension MXLContainerTests {
    @Test
    func test_initWithEmptyRootFiles() {
        let container = MXLContainer(rootFiles: [])

        #expect(container.rootFiles.isEmpty)
    }

    @Test
    func test_initWithMultipleRootFiles() {
        let file1 = MXLRootFile(fullPath: "score1.xml",
                                mediaType: MXLRootFile.uncompressedMediaType)
        let file2 = MXLRootFile(fullPath: "score2.xml",
                                mediaType: MXLRootFile.compressedMediaType)
        let container = MXLContainer(rootFiles: [file1, file2])

        #expect(container.rootFiles.count == 2)
        #expect(container.rootFiles[0].fullPath == "score1.xml")
        #expect(container.rootFiles[1].fullPath == "score2.xml")
    }

    @Test
    func test_initWithSingleRootFile() {
        let rootFile = MXLRootFile(fullPath: "score.xml",
                                   mediaType: MXLRootFile.defaultMediaType)
        let container = MXLContainer(rootFiles: [rootFile])

        #expect(container.rootFiles.count == 1)
        #expect(container.rootFiles[0].fullPath == "score.xml")
    }
}
