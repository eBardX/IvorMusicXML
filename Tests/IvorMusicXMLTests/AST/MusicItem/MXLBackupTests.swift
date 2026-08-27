// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBackupTests {
}

// MARK: -

extension MXLBackupTests {
    @Test
    func equality() {
        let duration = MXLPositiveDivisions(intValue: 4)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLBackup(duration: duration) == MXLBackup(duration: duration))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let duration = MXLPositiveDivisions(intValue: 4)!    // swiftlint:disable:this force_unwrapping
        let otherDuration = MXLPositiveDivisions(intValue: 8)!    // swiftlint:disable:this force_unwrapping
        let values: Set<MXLBackup> = [MXLBackup(duration: duration), MXLBackup(duration: duration), MXLBackup(duration: otherDuration)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let duration = MXLPositiveDivisions(intValue: 4)!    // swiftlint:disable:this force_unwrapping
        let otherDuration = MXLPositiveDivisions(intValue: 8)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLBackup(duration: duration) != MXLBackup(duration: otherDuration))
    }

    @Test
    func init_defaultValues() {
        let duration = MXLPositiveDivisions(intValue: 4)!    // swiftlint:disable:this force_unwrapping
        let value = MXLBackup(duration: duration)

        #expect(value.duration == duration)
        #expect(value.footnote == nil)
        #expect(value.level == nil)
    }

    @Test
    func init_explicitValues() {
        let duration = MXLPositiveDivisions(intValue: 4)!    // swiftlint:disable:this force_unwrapping
        let footnote = MXLFormattedText(value: "note")
        let level = MXLLevel(value: "1", display: MXLLevel.Display())
        let value = MXLBackup(duration: duration, footnote: footnote, level: level)

        #expect(value.duration == duration)
        #expect(value.footnote == footnote)
        #expect(value.level == level)
    }
}
