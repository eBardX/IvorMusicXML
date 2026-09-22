// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLValignImageTests {
}

// MARK: -

extension MXLValignImageTests {
    @Test
    func equality() {
        #expect(MXLValignImage.middle == .middle)
        #expect(MXLValignImage.top == .top)
    }

    @Test
    func hashable() {
        let values: Set<MXLValignImage> = [.bottom, .bottom, .middle, .top]

        #expect(values.count == 3)
    }

    @Test
    func inequality() {
        #expect(MXLValignImage.top != .bottom)
    }
}
