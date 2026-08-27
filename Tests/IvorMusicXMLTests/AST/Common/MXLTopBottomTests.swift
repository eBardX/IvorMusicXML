// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTopBottomTests {
}

// MARK: -

extension MXLTopBottomTests {
    @Test
    func equality() {
        #expect(MXLTopBottom.bottom == .bottom)
        #expect(MXLTopBottom.top == .top)
    }

    @Test
    func hashable() {
        let values: Set<MXLTopBottom> = [.bottom, .bottom, .top]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTopBottom.bottom != .top)
    }
}
