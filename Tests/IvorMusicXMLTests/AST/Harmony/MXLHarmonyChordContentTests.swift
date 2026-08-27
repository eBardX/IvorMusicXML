// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHarmonyChordContentTests {
}

// MARK: -

extension MXLHarmonyChordContentTests {
    @Test
    func equality() {
        let root = MXLRoot(step: MXLRoot.Step(value: .c))

        #expect(MXLHarmony.Chord.Content.root(root) == .root(root))
    }

    @Test
    func hashable() {
        let root = MXLHarmony.Chord.Content.root(MXLRoot(step: MXLRoot.Step(value: .c)))
        let function = MXLHarmony.Chord.Content.function(MXLStyleText(value: "I", printStyle: MXLPrintStyle()))
        let values: Set<MXLHarmony.Chord.Content> = [root, root, function]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let root = MXLHarmony.Chord.Content.root(MXLRoot(step: MXLRoot.Step(value: .c)))
        let function = MXLHarmony.Chord.Content.function(MXLStyleText(value: "I", printStyle: MXLPrintStyle()))

        #expect(root != function)
    }
}
