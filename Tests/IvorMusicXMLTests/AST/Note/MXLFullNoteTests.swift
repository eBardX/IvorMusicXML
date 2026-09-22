// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLFullNoteTests {
}

// MARK: -

extension MXLFullNoteTests {
    @Test
    func equality() {
        #expect(MXLFullNote(isChord: false, content: .rest(MXLRest())) ==    // swiftlint:disable:this identical_operands
                 MXLFullNote(isChord: false, content: .rest(MXLRest())))
    }

    @Test
    func hashable() {
        let values: Set<MXLFullNote> = [MXLFullNote(isChord: false, content: .rest(MXLRest())),
                                        MXLFullNote(isChord: false, content: .rest(MXLRest())),
                                        MXLFullNote(isChord: true, content: .rest(MXLRest()))]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLFullNote(isChord: false, content: .rest(MXLRest())) != MXLFullNote(isChord: true, content: .rest(MXLRest())))
    }

    @Test
    func init_values() {
        let value = MXLFullNote(isChord: true, content: .rest(MXLRest()))

        #expect(value.isChord == true)
        #expect(value.content == .rest(MXLRest()))
    }
}
