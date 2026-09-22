// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLKeyAccidentalTests {
}

// MARK: -

extension MXLKeyAccidentalTests {
    @Test
    func equality() {
        #expect(MXLKeyAccidental(value: .sharp) == MXLKeyAccidental(value: .sharp))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLKeyAccidental> = [MXLKeyAccidental(value: .sharp),
                                             MXLKeyAccidental(value: .sharp),
                                             MXLKeyAccidental(value: .flat)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLKeyAccidental(value: .sharp) != MXLKeyAccidental(value: .flat))
    }

    @Test
    func init_defaultValues() {
        let value = MXLKeyAccidental(value: .sharp)

        #expect(value.smufl == nil)
        #expect(value.value == .sharp)
    }

    @Test
    func init_explicitValues() {
        let value = MXLKeyAccidental(value: .sharp,
                                     smufl: MXLSmuflAccidentalGlyphName(stringValue: "accidentalSharp"))

        #expect(value.smufl == MXLSmuflAccidentalGlyphName(stringValue: "accidentalSharp"))
        #expect(value.value == .sharp)
    }
}
