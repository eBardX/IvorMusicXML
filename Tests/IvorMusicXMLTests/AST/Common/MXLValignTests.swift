// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLValignTests {
}

// MARK: -

extension MXLValignTests {
    @Test
    func equality() {
        #expect(MXLValign.middle == .middle)
        #expect(MXLValign.top == .top)
    }

    @Test
    func hashable() {
        let values: Set<MXLValign> = [.baseline, .baseline, .bottom, .middle, .top]

        #expect(values.count == 4)
    }

    @Test
    func inequality() {
        #expect(MXLValign.top != .bottom)
    }
}
