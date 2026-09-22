// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLWavyLineTests {
}

// MARK: -

extension MXLWavyLineTests {
    @Test
    func equality() {
        #expect(MXLWavyLine(kind: .start) == MXLWavyLine(kind: .start))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLWavyLine> = [MXLWavyLine(kind: .start), MXLWavyLine(kind: .start), MXLWavyLine(kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLWavyLine(kind: .start) != MXLWavyLine(kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let value = MXLWavyLine(kind: .start)

        #expect(value.color == nil)
        #expect(value.number == nil)
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.smufl == nil)
        #expect(value.trillSound == MXLTrillSound())
        #expect(value.kind == .start)
    }

    @Test
    func init_explicitValues() {
        let trillSound = MXLTrillSound(startNote: .below)
        let value = MXLWavyLine(kind: .stop,
                                number: MXLNumberLevel(uintValue: 1),
                                smufl: MXLSmuflWavyLineGlyphName(stringValue: "wiggleTrill"),
                                position: MXLPosition(defaultX: 10),
                                placement: .above,
                                color: MXLColor(stringValue: "#800080"),
                                trillSound: trillSound)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.number == MXLNumberLevel(uintValue: 1))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.smufl == MXLSmuflWavyLineGlyphName(stringValue: "wiggleTrill"))
        #expect(value.trillSound == trillSound)
        #expect(value.kind == .stop)
    }
}
