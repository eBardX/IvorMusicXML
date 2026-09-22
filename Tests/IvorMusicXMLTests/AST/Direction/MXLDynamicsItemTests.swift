// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDynamicsItemTests {
}

// MARK: -

extension MXLDynamicsItemTests {
    @Test
    func equality() {
        #expect(MXLDynamics.Item.f == .f)
        #expect(MXLDynamics.Item.otherDynamics(MXLOtherText(value: "boo")) == .otherDynamics(MXLOtherText(value: "boo")))
    }

    @Test
    func hashable() {
        let values: Set<MXLDynamics.Item> = [.f, .f, .ff]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLDynamics.Item.f != .ff)
    }
}
