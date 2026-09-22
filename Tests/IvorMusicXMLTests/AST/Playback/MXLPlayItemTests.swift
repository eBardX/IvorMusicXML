// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPlayItemTests {
}

// MARK: -

extension MXLPlayItemTests {
    @Test
    func equality() {
        #expect(MXLPlay.Item.ipa("a") == .ipa("a"))
    }

    @Test
    func hashable() {
        let ipa = MXLPlay.Item.ipa("a")
        let mute = MXLPlay.Item.mute(.on)
        let values: Set<MXLPlay.Item> = [ipa, ipa, mute]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let ipa = MXLPlay.Item.ipa("a")
        let mute = MXLPlay.Item.mute(.on)

        #expect(ipa != mute)
    }
}
