// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFirstFretTests {
}

// MARK: -

extension MXLFirstFretTests {
    @Test
    func equality() {
        #expect(MXLFirstFret(value: 1) == MXLFirstFret(value: 1))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLFirstFret> = [MXLFirstFret(value: 1), MXLFirstFret(value: 1), MXLFirstFret(value: 2)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLFirstFret(value: 1) != MXLFirstFret(value: 2))
    }

    @Test
    func init_defaultValues() {
        let value = MXLFirstFret(value: 1)

        #expect(value.location == nil)
        #expect(value.text == nil)
        #expect(value.value == 1)
    }

    @Test
    func init_explicitValues() {
        let value = MXLFirstFret(value: 2, text: "2fr", location: .left)

        #expect(value.location == .left)
        #expect(value.text == "2fr")
        #expect(value.value == 2)
    }
}
