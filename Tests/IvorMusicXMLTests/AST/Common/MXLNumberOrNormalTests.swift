// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNumberOrNormalTests {
}

// MARK: -

extension MXLNumberOrNormalTests {
    @Test
    func equality() {
        #expect(MXLNumberOrNormal.normal == .normal)
        #expect(MXLNumberOrNormal.number(100) == .number(100))
    }

    @Test
    func hashable() {
        let values: Set<MXLNumberOrNormal> = [.normal, .normal, .number(100), .number(120)]

        #expect(values.count == 3)
    }

    @Test
    func inequality() {
        #expect(MXLNumberOrNormal.normal != .number(100))
        #expect(MXLNumberOrNormal.number(100) != .number(120))
    }
}
