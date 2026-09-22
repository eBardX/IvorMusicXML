// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNumeralModeTests {
}

// MARK: -

extension MXLNumeralModeTests {
    @Test
    func equality() {
        #expect(MXLNumeral.Mode.major == .major)
    }

    @Test
    func hashable() {
        let values: Set<MXLNumeral.Mode> = [.major, .major, .minor]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLNumeral.Mode.major != .minor)
    }
}
