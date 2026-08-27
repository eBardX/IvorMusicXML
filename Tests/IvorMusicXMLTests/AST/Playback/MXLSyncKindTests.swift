// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSyncKindTests {
}

// MARK: -

extension MXLSyncKindTests {
    @Test
    func equality() {
        #expect(MXLSync.Kind.event == .event)
    }

    @Test
    func hashable() {
        let values: Set<MXLSync.Kind> = [.event, .event, .tempo]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSync.Kind.event != .tempo)
    }
}
