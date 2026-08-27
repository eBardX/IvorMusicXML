// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMeasureStyleContentTests {
}

// MARK: -

extension MXLMeasureStyleContentTests {
    @Test
    func equality() {
        let rest = MXLMultipleRest(value: 4)

        #expect(MXLMeasureStyle.Content.multipleRest(rest) == .multipleRest(rest))
    }

    @Test
    func hashable() {
        let multipleRest = MXLMeasureStyle.Content.multipleRest(MXLMultipleRest(value: 4))
        let slash = MXLMeasureStyle.Content.slash(MXLSlash(kind: .start))
        let values: Set<MXLMeasureStyle.Content> = [multipleRest, multipleRest, slash]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let multipleRest = MXLMultipleRest(value: 4)
        let slash = MXLSlash(kind: .start)

        #expect(MXLMeasureStyle.Content.multipleRest(multipleRest) != .slash(slash))
    }
}
