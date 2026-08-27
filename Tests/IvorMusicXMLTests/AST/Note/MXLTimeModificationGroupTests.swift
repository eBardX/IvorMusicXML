// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTimeModificationGroupTests {
}

// MARK: -

extension MXLTimeModificationGroupTests {
    @Test
    func equality() {
        #expect(MXLTimeModification.Group(normalKind: .quarter, normalDot: 0) ==    // swiftlint:disable:this identical_operands
                 MXLTimeModification.Group(normalKind: .quarter, normalDot: 0))
    }

    @Test
    func hashable() {
        let values: Set<MXLTimeModification.Group> = [MXLTimeModification.Group(normalKind: .quarter, normalDot: 0),
                                                      MXLTimeModification.Group(normalKind: .quarter, normalDot: 0),
                                                      MXLTimeModification.Group(normalKind: .eighth, normalDot: 1)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTimeModification.Group(normalKind: .quarter, normalDot: 0) !=
                 MXLTimeModification.Group(normalKind: .eighth, normalDot: 1))
    }

    @Test
    func init_values() {
        let value = MXLTimeModification.Group(normalKind: .quarter, normalDot: 1)

        #expect(value.normalDot == 1)
        #expect(value.normalKind == .quarter)
    }
}
