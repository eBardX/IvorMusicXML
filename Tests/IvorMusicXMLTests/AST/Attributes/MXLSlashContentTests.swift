// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSlashContentTests {
}

// MARK: -

extension MXLSlashContentTests {
    @Test
    func equality() {
        #expect(MXLSlashContent() == MXLSlashContent())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLSlashContent> = [MXLSlashContent(), MXLSlashContent(), MXLSlashContent(exceptVoice: ["1"])]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSlashContent() != MXLSlashContent(exceptVoice: ["1"]))
    }

    @Test
    func init_defaultValues() {
        let value = MXLSlashContent()

        #expect(value.exceptVoice.isEmpty)
        #expect(value.group == nil)
    }

    @Test
    func init_explicitValues() {
        let group = MXLSlashContent.Group(slashKind: .quarter, slashDot: 0)
        let value = MXLSlashContent(group: group,
                                    exceptVoice: ["1"])

        #expect(value.exceptVoice == ["1"])
        #expect(value.group == group)
    }
}
