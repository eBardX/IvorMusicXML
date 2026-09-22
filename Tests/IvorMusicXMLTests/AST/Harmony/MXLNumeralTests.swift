// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLNumeralTests {
}

// MARK: -

extension MXLNumeralTests {
    @Test
    func equality() {
        let root = MXLNumeral.Root(value: MXLNumeral.Value(uintValue: 5)!)    // swiftlint:disable:this force_unwrapping

        #expect(MXLNumeral(root: root) == MXLNumeral(root: root))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let root = MXLNumeral.Root(value: MXLNumeral.Value(uintValue: 5)!)    // swiftlint:disable:this force_unwrapping
        let otherRoot = MXLNumeral.Root(value: MXLNumeral.Value(uintValue: 2)!)    // swiftlint:disable:this force_unwrapping
        let values: Set<MXLNumeral> = [MXLNumeral(root: root), MXLNumeral(root: root), MXLNumeral(root: otherRoot)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let root = MXLNumeral.Root(value: MXLNumeral.Value(uintValue: 5)!)    // swiftlint:disable:this force_unwrapping
        let otherRoot = MXLNumeral.Root(value: MXLNumeral.Value(uintValue: 2)!)    // swiftlint:disable:this force_unwrapping

        #expect(MXLNumeral(root: root) != MXLNumeral(root: otherRoot))
    }

    @Test
    func init_defaultValues() {
        let root = MXLNumeral.Root(value: MXLNumeral.Value(uintValue: 5)!)    // swiftlint:disable:this force_unwrapping
        let value = MXLNumeral(root: root)

        #expect(value.alter == nil)
        #expect(value.key == nil)
        #expect(value.root == root)
    }

    @Test
    func init_explicitValues() {
        let root = MXLNumeral.Root(value: MXLNumeral.Value(uintValue: 5)!)    // swiftlint:disable:this force_unwrapping
        let alter = MXLHarmonyAlter(value: 1)
        let key = MXLNumeral.Key(fifths: MXLFifths(intValue: 2)!, mode: .major)    // swiftlint:disable:this force_unwrapping
        let value = MXLNumeral(root: root, alter: alter, key: key)

        #expect(value.alter == alter)
        #expect(value.key == key)
        #expect(value.root == root)
    }
}
