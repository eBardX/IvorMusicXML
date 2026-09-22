// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBookmarkTests {
}

// MARK: -

extension MXLBookmarkTests {
    @Test
    func equality() {
        #expect(MXLBookmark(id: "b1") == MXLBookmark(id: "b1"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLBookmark> = [MXLBookmark(id: "b1"), MXLBookmark(id: "b1"), MXLBookmark(id: "b2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBookmark(id: "b1") != MXLBookmark(id: "b2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLBookmark(id: "b1")

        #expect(value.elementPosition == MXLElementPosition())
        #expect(value.id == "b1")
        #expect(value.name == nil)
    }

    @Test
    func init_explicitValues() {
        let elementPosition = MXLElementPosition(element: "beam", position: 2)
        let value = MXLBookmark(id: "b1", name: "chorus", elementPosition: elementPosition)

        #expect(value.elementPosition == elementPosition)
        #expect(value.id == "b1")
        #expect(value.name == "chorus")
    }
}
