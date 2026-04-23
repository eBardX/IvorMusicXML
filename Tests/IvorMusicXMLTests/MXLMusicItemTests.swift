// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMusicItemTests {
}

// MARK: -

extension MXLMusicItemTests {
    @Test
    func test_caseAttributes() {
        let item = MXLMusicItem.attributes(4)

        if case let .attributes(divisions) = item {
            #expect(divisions == 4)
        } else {
            Issue.record("Expected .attributes case")
        }
    }

    @Test
    func test_caseBackup() {
        let item = MXLMusicItem.backup(480)

        if case let .backup(duration) = item {
            #expect(duration == 480)
        } else {
            Issue.record("Expected .backup case")
        }
    }

    @Test
    func test_caseForward() {
        let item = MXLMusicItem.forward(240)

        if case let .forward(duration) = item {
            #expect(duration == 240)
        } else {
            Issue.record("Expected .forward case")
        }
    }

    @Test
    func test_caseGraceNote() {
        let graceNote = MXLGraceNote(isChord: false,
                                     value: .rest,
                                     duration: .unspecified,
                                     ties: [])
        let item = MXLMusicItem.graceNote(graceNote)

        if case let .graceNote(value) = item {
            #expect(!value.isChord)
        } else {
            Issue.record("Expected .graceNote case")
        }
    }

    @Test
    func test_caseNote() {
        let note = MXLNote(isChord: false,
                           value: .rest,
                           duration: 480,
                           ties: [])
        let item = MXLMusicItem.note(note)

        if case let .note(value) = item {
            #expect(value.duration == 480)
        } else {
            Issue.record("Expected .note case")
        }
    }

    @Test
    func test_caseSound() {
        let item = MXLMusicItem.sound(120.0)

        if case let .sound(tempo) = item {
            #expect(tempo == 120.0)
        } else {
            Issue.record("Expected .sound case")
        }
    }
}
