// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTimeModificationTests {
}

// MARK: -

extension MXLTimeModificationTests {
    @Test
    func equality() {
        #expect(MXLTimeModification(actualNotes: 3, normalNotes: 2) == MXLTimeModification(actualNotes: 3, normalNotes: 2))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLTimeModification> = [MXLTimeModification(actualNotes: 3, normalNotes: 2),
                                                MXLTimeModification(actualNotes: 3, normalNotes: 2),
                                                MXLTimeModification(actualNotes: 5, normalNotes: 4)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTimeModification(actualNotes: 3, normalNotes: 2) != MXLTimeModification(actualNotes: 5, normalNotes: 4))
    }

    @Test
    func init_defaultValues() {
        let value = MXLTimeModification(actualNotes: 3, normalNotes: 2)

        #expect(value.actualNotes == 3)
        #expect(value.group == nil)
        #expect(value.normalNotes == 2)
    }

    @Test
    func init_explicitValues() {
        let group = MXLTimeModification.Group(normalKind: .eighth, normalDot: 0)
        let value = MXLTimeModification(actualNotes: 5, normalNotes: 4, group: group)

        #expect(value.actualNotes == 5)
        #expect(value.group == group)
        #expect(value.normalNotes == 4)
    }
}
