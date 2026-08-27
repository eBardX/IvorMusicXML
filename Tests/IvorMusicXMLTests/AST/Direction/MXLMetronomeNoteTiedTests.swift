// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMetronomeNoteTiedTests {
}

// MARK: -

extension MXLMetronomeNoteTiedTests {
    @Test
    func equality() {
        #expect(MXLMetronome.Note.Tied(kind: .start) == MXLMetronome.Note.Tied(kind: .start))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLMetronome.Note.Tied> = [MXLMetronome.Note.Tied(kind: .start),
                                                   MXLMetronome.Note.Tied(kind: .start),
                                                   MXLMetronome.Note.Tied(kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMetronome.Note.Tied(kind: .start) != MXLMetronome.Note.Tied(kind: .stop))
    }

    @Test
    func init_values() {
        let value = MXLMetronome.Note.Tied(kind: .start)

        #expect(value.kind == .start)
    }
}
