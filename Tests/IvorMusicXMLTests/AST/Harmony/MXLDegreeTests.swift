// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDegreeTests {
}

// MARK: -

extension MXLDegreeTests {
    @Test
    func equality() {
        let value = MXLDegree.Value(value: 3)
        let alter = MXLDegree.Alter(value: 0)
        let kind = MXLDegree.Kind(value: .add)

        #expect(MXLDegree(value: value, alter: alter, kind: kind) ==    // swiftlint:disable:this identical_operands
                 MXLDegree(value: value, alter: alter, kind: kind))
    }

    @Test
    func hashable() {
        let value = MXLDegree.Value(value: 3)
        let alter = MXLDegree.Alter(value: 0)
        let kind = MXLDegree.Kind(value: .add)
        let otherKind = MXLDegree.Kind(value: .alter)
        let values: Set<MXLDegree> = [MXLDegree(value: value, alter: alter, kind: kind),
                                      MXLDegree(value: value, alter: alter, kind: kind),
                                      MXLDegree(value: value, alter: alter, kind: otherKind)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let value = MXLDegree.Value(value: 3)
        let alter = MXLDegree.Alter(value: 0)
        let kind = MXLDegree.Kind(value: .add)
        let otherKind = MXLDegree.Kind(value: .alter)

        #expect(MXLDegree(value: value, alter: alter, kind: kind) != MXLDegree(value: value, alter: alter, kind: otherKind))
    }

    @Test
    func init_defaultValues() {
        let value = MXLDegree.Value(value: 3)
        let alter = MXLDegree.Alter(value: 0)
        let kind = MXLDegree.Kind(value: .add)
        let degree = MXLDegree(value: value, alter: alter, kind: kind)

        #expect(degree.alter == alter)
        #expect(degree.kind == kind)
        #expect(degree.printsObject == nil)
        #expect(degree.value == value)
    }

    @Test
    func init_explicitValues() {
        let value = MXLDegree.Value(value: 3)
        let alter = MXLDegree.Alter(value: 0)
        let kind = MXLDegree.Kind(value: .add)
        let degree = MXLDegree(value: value, alter: alter, kind: kind, printsObject: false)

        #expect(degree.alter == alter)
        #expect(degree.kind == kind)
        #expect(degree.printsObject == false)
        #expect(degree.value == value)
    }
}
