// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHarmonyKindTests {
}

// MARK: -

extension MXLHarmonyKindTests {
    @Test
    func equality() {
        #expect(MXLHarmony.Kind.explicit == .explicit)
    }

    @Test
    func hashable() {
        let values: Set<MXLHarmony.Kind> = [.explicit, .explicit, .implied]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHarmony.Kind.explicit != .implied)
    }
}
