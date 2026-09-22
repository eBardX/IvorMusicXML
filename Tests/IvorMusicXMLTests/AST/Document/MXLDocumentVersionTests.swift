// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDocumentVersionTests {
}

// MARK: -

extension MXLDocumentVersionTests {
    @Test
    func comparable() {
        #expect(MXLDocument.Version(major: 3, minor: 1) < MXLDocument.Version(major: 4, minor: 0))
        #expect(MXLDocument.Version(major: 3, minor: 0) < MXLDocument.Version(major: 3, minor: 1))
        #expect(!(MXLDocument.Version(major: 3, minor: 1) < MXLDocument.Version(major: 3, minor: 1)))    // swiftlint:disable:this identical_operands
    }

    @Test
    func current() {
        #expect(MXLDocument.Version.current == MXLDocument.Version(major: 4, minor: 0))
    }

    @Test
    func equality() {
        #expect(MXLDocument.Version(major: 3, minor: 1) == MXLDocument.Version(major: 3, minor: 1))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLDocument.Version> = [MXLDocument.Version(major: 3, minor: 1),
                                                MXLDocument.Version(major: 3, minor: 1),
                                                MXLDocument.Version(major: 4, minor: 0)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLDocument.Version(major: 3, minor: 1) != MXLDocument.Version(major: 4, minor: 0))
    }

    @Test
    func init_values() {
        let value = MXLDocument.Version(major: 3, minor: 1)

        #expect(value.major == 3)
        #expect(value.minor == 1)
    }

    @Test
    func supported() {
        #expect(MXLDocument.Version.supported == [MXLDocument.Version(major: 1, minor: 0),
                                                  MXLDocument.Version(major: 1, minor: 1),
                                                  MXLDocument.Version(major: 2, minor: 0),
                                                  MXLDocument.Version(major: 3, minor: 0),
                                                  MXLDocument.Version(major: 3, minor: 1),
                                                  MXLDocument.Version(major: 4, minor: 0)])
    }
}
