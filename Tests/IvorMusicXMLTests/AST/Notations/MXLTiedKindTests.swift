// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTiedKindTests {
}

// MARK: -

extension MXLTiedKindTests {
    @Test
    func equality() {
        #expect(MXLTied.Kind.start == .start)
        #expect(MXLTied.Kind.continue == .continue)
    }

    @Test
    func hashable() {
        let values: Set<MXLTied.Kind> = [.start, .start, .stop]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTied.Kind.start != .stop)
    }
}
