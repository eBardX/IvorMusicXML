// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPercussionContentTests {
}

// MARK: -

extension MXLPercussionContentTests {
    @Test
    func equality() {
        let timpani = MXLTimpani()

        #expect(MXLPercussion.Content.timpani(timpani) == .timpani(timpani))
    }

    @Test
    func hashable() {
        let timpani = MXLPercussion.Content.timpani(MXLTimpani())
        let wood = MXLPercussion.Content.wood(MXLWood(value: .claves))
        let values: Set<MXLPercussion.Content> = [timpani, timpani, wood]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let timpani = MXLPercussion.Content.timpani(MXLTimpani())
        let wood = MXLPercussion.Content.wood(MXLWood(value: .claves))

        #expect(timpani != wood)
    }
}
