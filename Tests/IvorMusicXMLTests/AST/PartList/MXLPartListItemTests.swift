// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPartListItemTests {
}

// MARK: -

extension MXLPartListItemTests {
    @Test
    func equality() {
        let partGroup = MXLPartGroup(stretchesTimeSignature: false, kind: .start)

        #expect(MXLPartList.Item.partGroup(partGroup) == .partGroup(partGroup))
    }

    @Test
    func hashable() {
        let partGroup = MXLPartList.Item.partGroup(MXLPartGroup(stretchesTimeSignature: false, kind: .start))
        let name = MXLPartName(value: "Violin", text: MXLPartName.Text())
        let scorePart = MXLPartList.Item.scorePart(MXLScorePart(id: "P1", name: name))
        let values: Set<MXLPartList.Item> = [partGroup, partGroup, scorePart]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let partGroup = MXLPartList.Item.partGroup(MXLPartGroup(stretchesTimeSignature: false, kind: .start))
        let name = MXLPartName(value: "Violin", text: MXLPartName.Text())
        let scorePart = MXLPartList.Item.scorePart(MXLScorePart(id: "P1", name: name))

        #expect(partGroup != scorePart)
    }
}
