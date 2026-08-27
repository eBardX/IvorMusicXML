// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHarmonyChordTests {
}

// MARK: -

extension MXLHarmonyChordTests {
    @Test
    func equality() {
        let content = MXLHarmony.Chord.Content.root(MXLRoot(step: MXLRoot.Step(value: .c)))
        let kind = MXLHarmony.Chord.Kind(value: .major)

        #expect(MXLHarmony.Chord(content: content, kind: kind) == MXLHarmony.Chord(content: content, kind: kind))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let content = MXLHarmony.Chord.Content.root(MXLRoot(step: MXLRoot.Step(value: .c)))
        let kind = MXLHarmony.Chord.Kind(value: .major)
        let otherKind = MXLHarmony.Chord.Kind(value: .minor)
        let values: Set<MXLHarmony.Chord> = [MXLHarmony.Chord(content: content, kind: kind),
                                             MXLHarmony.Chord(content: content, kind: kind),
                                             MXLHarmony.Chord(content: content, kind: otherKind)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let content = MXLHarmony.Chord.Content.root(MXLRoot(step: MXLRoot.Step(value: .c)))
        let kind = MXLHarmony.Chord.Kind(value: .major)
        let otherKind = MXLHarmony.Chord.Kind(value: .minor)

        #expect(MXLHarmony.Chord(content: content, kind: kind) != MXLHarmony.Chord(content: content, kind: otherKind))
    }

    @Test
    func init_defaultValues() {
        let content = MXLHarmony.Chord.Content.root(MXLRoot(step: MXLRoot.Step(value: .c)))
        let kind = MXLHarmony.Chord.Kind(value: .major)
        let value = MXLHarmony.Chord(content: content, kind: kind)

        #expect(value.bass == nil)
        #expect(value.content == content)
        #expect(value.degree.isEmpty)
        #expect(value.inversion == nil)
        #expect(value.kind == kind)
    }

    @Test
    func init_explicitValues() {
        let content = MXLHarmony.Chord.Content.root(MXLRoot(step: MXLRoot.Step(value: .c)))
        let kind = MXLHarmony.Chord.Kind(value: .major)
        let inversion = MXLInversion(value: 1)
        let bass = MXLBass(step: MXLBass.Step(value: .g))
        let degree = [MXLDegree(value: MXLDegree.Value(value: 3), alter: MXLDegree.Alter(value: 0), kind: MXLDegree.Kind(value: .add))]
        let value = MXLHarmony.Chord(content: content, kind: kind, inversion: inversion, bass: bass, degree: degree)

        #expect(value.bass == bass)
        #expect(value.content == content)
        #expect(value.degree == degree)
        #expect(value.inversion == inversion)
        #expect(value.kind == kind)
    }
}
