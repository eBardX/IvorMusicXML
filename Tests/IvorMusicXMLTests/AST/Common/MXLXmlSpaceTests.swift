// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLXmlSpaceTests {
}

// MARK: -

extension MXLXmlSpaceTests {
    @Test
    func equality() {
        #expect(MXLXmlSpace.default == .default)
        #expect(MXLXmlSpace.preserve == .preserve)
    }

    @Test
    func hashable() {
        let values: Set<MXLXmlSpace> = [.default, .default, .preserve]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLXmlSpace.default != .preserve)
    }
}
