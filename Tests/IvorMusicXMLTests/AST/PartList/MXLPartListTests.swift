// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPartListTests {
}

// MARK: -

extension MXLPartListTests {
    @Test
    func equality() {
        #expect(MXLPartList() == MXLPartList())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let items: [MXLPartList.Item] = [.partGroup(MXLPartGroup(stretchesTimeSignature: false, kind: .start))]
        let values: Set<MXLPartList> = [MXLPartList(), MXLPartList(), MXLPartList(items: items)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let items: [MXLPartList.Item] = [.partGroup(MXLPartGroup(stretchesTimeSignature: false, kind: .start))]

        #expect(MXLPartList() != MXLPartList(items: items))
    }

    @Test
    func init_defaultValues() {
        let value = MXLPartList()

        #expect(value.items.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let items: [MXLPartList.Item] = [.partGroup(MXLPartGroup(stretchesTimeSignature: false, kind: .start))]
        let value = MXLPartList(items: items)

        #expect(value.items == items)
    }
}
