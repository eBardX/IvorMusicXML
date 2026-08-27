// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLineLengthTests {
}

// MARK: -

extension MXLLineLengthTests {
    @Test
    func equality() {
        #expect(MXLLineLength.long == .long)
        #expect(MXLLineLength.short == .short)
    }

    @Test
    func hashable() {
        let values: Set<MXLLineLength> = [.long, .long, .medium, .short]

        #expect(values.count == 3)
    }

    @Test
    func inequality() {
        #expect(MXLLineLength.long != .short)
    }
}
