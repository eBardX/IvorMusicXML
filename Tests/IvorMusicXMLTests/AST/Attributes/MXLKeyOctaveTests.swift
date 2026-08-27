// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLKeyOctaveTests {
}

// MARK: -

extension MXLKeyOctaveTests {
    @Test
    func equality() {
        #expect(MXLKey.Octave(value: 4, number: 1) == MXLKey.Octave(value: 4, number: 1))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLKey.Octave> = [MXLKey.Octave(value: 4, number: 1),
                                          MXLKey.Octave(value: 4, number: 1),
                                          MXLKey.Octave(value: 5, number: 1)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLKey.Octave(value: 4, number: 1) != MXLKey.Octave(value: 5, number: 1))
    }

    @Test
    func init_defaultValues() {
        let value = MXLKey.Octave(value: 4, number: 1)

        #expect(value.isCancelling == nil)
        #expect(value.number == 1)
        #expect(value.value == 4)
    }

    @Test
    func init_explicitValues() {
        let value = MXLKey.Octave(value: 4, number: 1, isCancelling: true)

        #expect(value.isCancelling == true)
        #expect(value.number == 1)
        #expect(value.value == 4)
    }
}
