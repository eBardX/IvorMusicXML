// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTrillStepTests {
}

// MARK: -

extension MXLTrillStepTests {
    @Test
    func equality() {
        #expect(MXLTrillStep.whole == .whole)
    }

    @Test
    func hashable() {
        let values: Set<MXLTrillStep> = [.whole, .whole, .half]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTrillStep.whole != .half)
    }
}
