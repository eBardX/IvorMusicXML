// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLListeningItemTests {
}

// MARK: -

extension MXLListeningItemTests {
    @Test
    func equality() {
        let sync = MXLSync(kind: .event)

        #expect(MXLListening.Item.sync(sync) == .sync(sync))
    }

    @Test
    func hashable() {
        let sync = MXLListening.Item.sync(MXLSync(kind: .event))
        let otherListening = MXLListening.Item.otherListening(MXLOtherListening(value: "1", kind: "custom"))
        let values: Set<MXLListening.Item> = [sync, sync, otherListening]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let sync = MXLListening.Item.sync(MXLSync(kind: .event))
        let otherListening = MXLListening.Item.otherListening(MXLOtherListening(value: "1", kind: "custom"))

        #expect(sync != otherListening)
    }
}
