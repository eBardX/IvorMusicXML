// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSlashContentGroupTests {
}

// MARK: -

extension MXLSlashContentGroupTests {
    @Test
    func equality() {
        #expect(MXLSlashContent.Group(slashKind: .quarter, slashDot: 0) ==    // swiftlint:disable:this identical_operands
                 MXLSlashContent.Group(slashKind: .quarter, slashDot: 0))
    }

    @Test
    func hashable() {
        let values: Set<MXLSlashContent.Group> = [MXLSlashContent.Group(slashKind: .quarter, slashDot: 0),
                                                  MXLSlashContent.Group(slashKind: .quarter, slashDot: 0),
                                                  MXLSlashContent.Group(slashKind: .eighth, slashDot: 1)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSlashContent.Group(slashKind: .quarter, slashDot: 0) !=
                 MXLSlashContent.Group(slashKind: .eighth, slashDot: 1))
    }

    @Test
    func init_values() {
        let value = MXLSlashContent.Group(slashKind: .quarter, slashDot: 1)

        #expect(value.slashDot == 1)
        #expect(value.slashKind == .quarter)
    }
}
