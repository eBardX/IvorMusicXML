// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLForwardTests {
}

// MARK: -

extension MXLForwardTests {
    @Test
    func equality() {
        let duration = MXLPositiveDivisions(intValue: 4)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLForward(duration: duration) == MXLForward(duration: duration))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let duration = MXLPositiveDivisions(intValue: 4)!    // swiftlint:disable:this force_unwrapping
        let otherDuration = MXLPositiveDivisions(intValue: 8)!    // swiftlint:disable:this force_unwrapping
        let values: Set<MXLForward> = [MXLForward(duration: duration), MXLForward(duration: duration), MXLForward(duration: otherDuration)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let duration = MXLPositiveDivisions(intValue: 4)!    // swiftlint:disable:this force_unwrapping
        let otherDuration = MXLPositiveDivisions(intValue: 8)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLForward(duration: duration) != MXLForward(duration: otherDuration))
    }

    @Test
    func init_defaultValues() {
        let duration = MXLPositiveDivisions(intValue: 4)!    // swiftlint:disable:this force_unwrapping
        let value = MXLForward(duration: duration)

        #expect(value.duration == duration)
        #expect(value.footnote == nil)
        #expect(value.level == nil)
        #expect(value.staff == nil)
        #expect(value.voice == nil)
    }

    @Test
    func init_explicitValues() {
        let duration = MXLPositiveDivisions(intValue: 4)!    // swiftlint:disable:this force_unwrapping
        let footnote = MXLFormattedText(value: "note")
        let level = MXLLevel(value: "1", display: MXLLevel.Display())
        let voice = MXLVoice(voice: "1")
        let staff = MXLStaff(uintValue: 1)
        let value = MXLForward(duration: duration, footnote: footnote, level: level, voice: voice, staff: staff)

        #expect(value.duration == duration)
        #expect(value.footnote == footnote)
        #expect(value.level == level)
        #expect(value.staff == staff)
        #expect(value.voice == voice)
    }
}
