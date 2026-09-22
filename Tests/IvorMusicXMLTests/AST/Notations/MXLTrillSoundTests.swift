// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTrillSoundTests {
}

// MARK: -

extension MXLTrillSoundTests {
    @Test
    func equality() {
        #expect(MXLTrillSound() == MXLTrillSound())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLTrillSound> = [MXLTrillSound(), MXLTrillSound(), MXLTrillSound(startNote: .below)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTrillSound() != MXLTrillSound(startNote: .below))
    }

    @Test
    func init_defaultValues() {
        let value = MXLTrillSound()

        #expect(value.accelerates == nil)
        #expect(value.beats == nil)
        #expect(value.lastBeat == nil)
        #expect(value.secondBeat == nil)
        #expect(value.startNote == nil)
        #expect(value.trillStep == nil)
        #expect(value.twoNoteTurn == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLTrillSound(startNote: .below,
                                  trillStep: .half,
                                  twoNoteTurn: .whole,
                                  accelerates: true,
                                  beats: 4,
                                  secondBeat: 25,
                                  lastBeat: 75)

        #expect(value.accelerates == true)
        #expect(value.beats == 4)
        #expect(value.lastBeat == 75)
        #expect(value.secondBeat == 25)
        #expect(value.startNote == .below)
        #expect(value.trillStep == .half)
        #expect(value.twoNoteTurn == .whole)
    }
}
