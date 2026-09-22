// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBendSoundTests {
}

// MARK: -

extension MXLBendSoundTests {
    @Test
    func equality() {
        #expect(MXLBendSound() == MXLBendSound())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLBendSound> = [MXLBendSound(), MXLBendSound(), MXLBendSound(accelerates: true)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBendSound() != MXLBendSound(accelerates: true))
    }

    @Test
    func init_defaultValues() {
        let value = MXLBendSound()

        #expect(value.accelerates == nil)
        #expect(value.beats == nil)
        #expect(value.firstBeat == nil)
        #expect(value.lastBeat == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLBendSound(accelerates: true, beats: 4, firstBeat: 25, lastBeat: 75)

        #expect(value.accelerates == true)
        #expect(value.beats == 4)
        #expect(value.firstBeat == 25)
        #expect(value.lastBeat == 75)
    }
}
