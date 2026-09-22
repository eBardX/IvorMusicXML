// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLClefSignTests {
}

// MARK: -

extension MXLClefSignTests {
    @Test
    func equality() {
        #expect(MXLClef.Sign.g == .g)
        #expect(MXLClef.Sign.tAB == .tAB)
    }

    @Test
    func hashable() {
        let values: Set<MXLClef.Sign> = [.c, .c, .f, .g, .invisible, .jianpu, .percussion, .tAB]

        #expect(values.count == 7)
    }

    @Test
    func inequality() {
        #expect(MXLClef.Sign.g != .f)
    }
}
