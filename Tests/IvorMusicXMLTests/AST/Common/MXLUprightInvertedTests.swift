// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLUprightInvertedTests {
}

// MARK: -

extension MXLUprightInvertedTests {
    @Test
    func equality() {
        #expect(MXLUprightInverted.inverted == .inverted)
        #expect(MXLUprightInverted.upright == .upright)
    }

    @Test
    func hashable() {
        let values: Set<MXLUprightInverted> = [.inverted, .inverted, .upright]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLUprightInverted.inverted != .upright)
    }
}
