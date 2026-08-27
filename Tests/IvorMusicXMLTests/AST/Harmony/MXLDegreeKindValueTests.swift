// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDegreeKindValueTests {
}

// MARK: -

extension MXLDegreeKindValueTests {
    @Test
    func equality() {
        #expect(MXLDegree.Kind.Value.add == .add)
    }

    @Test
    func hashable() {
        let values: Set<MXLDegree.Kind.Value> = [.add, .add, .alter]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLDegree.Kind.Value.add != .alter)
    }
}
