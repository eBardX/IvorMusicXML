// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLVirtualInstrumentDataContentTests {
}

// MARK: -

extension MXLVirtualInstrumentDataContentTests {
    @Test
    func equality() {
        #expect(MXLVirtualInstrumentData.Content.solo == .solo)
    }

    @Test
    func hashable() {
        let solo = MXLVirtualInstrumentData.Content.solo
        let ensemble = MXLVirtualInstrumentData.Content.ensemble(4)
        let values: Set<MXLVirtualInstrumentData.Content> = [solo, solo, ensemble]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let solo = MXLVirtualInstrumentData.Content.solo
        let ensemble = MXLVirtualInstrumentData.Content.ensemble(4)

        #expect(solo != ensemble)
    }
}
