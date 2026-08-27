// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTextDirectionTests {
}

// MARK: -

extension MXLTextDirectionTests {
    @Test
    func equality() {
        #expect(MXLTextDirection.ltr == .ltr)
        #expect(MXLTextDirection.rtl == .rtl)
    }

    @Test
    func hashable() {
        let values: Set<MXLTextDirection> = [.lro, .lro, .ltr, .rlo, .rtl]

        #expect(values.count == 4)
    }

    @Test
    func inequality() {
        #expect(MXLTextDirection.ltr != .rtl)
    }
}
