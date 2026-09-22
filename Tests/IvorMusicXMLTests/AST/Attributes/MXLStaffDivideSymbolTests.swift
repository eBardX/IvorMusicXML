// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStaffDivideSymbolTests {
}

// MARK: -

extension MXLStaffDivideSymbolTests {
    @Test
    func equality() {
        #expect(MXLStaffDivide.Symbol.down == .down)
        #expect(MXLStaffDivide.Symbol.up == .up)
    }

    @Test
    func hashable() {
        let values: Set<MXLStaffDivide.Symbol> = [.down, .down, .up, .upDown]

        #expect(values.count == 3)
    }

    @Test
    func inequality() {
        #expect(MXLStaffDivide.Symbol.down != .up)
    }
}
