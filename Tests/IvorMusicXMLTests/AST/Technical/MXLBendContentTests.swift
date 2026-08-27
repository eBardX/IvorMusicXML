// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBendContentTests {
}

// MARK: -

extension MXLBendContentTests {
    @Test
    func equality() {
        #expect(MXLBend.Content.preBend == .preBend)
    }

    @Test
    func hashable() {
        let preBend = MXLBend.Content.preBend
        let release = MXLBend.Content.release(MXLRelease())
        let values: Set<MXLBend.Content> = [preBend, preBend, release]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let preBend = MXLBend.Content.preBend
        let release = MXLBend.Content.release(MXLRelease())

        #expect(preBend != release)
    }
}
