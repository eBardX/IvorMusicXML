// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHarmonicTests {
}

// MARK: -

extension MXLHarmonicTests {
    @Test
    func equality() {
        #expect(MXLHarmonic() == MXLHarmonic())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLHarmonic> = [MXLHarmonic(), MXLHarmonic(), MXLHarmonic(content: .natural)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHarmonic() != MXLHarmonic(content: .natural))
    }

    @Test
    func init_defaultValues() {
        let value = MXLHarmonic()

        #expect(value.color == nil)
        #expect(value.content == nil)
        #expect(value.content2 == nil)
        #expect(value.font == MXLFont())
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.printsObject == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLHarmonic(content: .natural,
                                content2: .soundingPitch,
                                printsObject: false,
                                position: MXLPosition(defaultX: 10),
                                font: MXLFont(style: .italic),
                                color: MXLColor(stringValue: "#800080"),
                                placement: .above)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.content == .natural)
        #expect(value.content2 == .soundingPitch)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.printsObject == false)
    }
}
