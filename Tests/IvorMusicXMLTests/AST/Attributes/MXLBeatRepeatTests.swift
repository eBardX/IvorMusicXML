// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBeatRepeatTests {
}

// MARK: -

extension MXLBeatRepeatTests {
    @Test
    func equality() {
        #expect(MXLBeatRepeat(kind: .start) == MXLBeatRepeat(kind: .start))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLBeatRepeat> = [MXLBeatRepeat(kind: .start),
                                          MXLBeatRepeat(kind: .start),
                                          MXLBeatRepeat(kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBeatRepeat(kind: .start) != MXLBeatRepeat(kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let value = MXLBeatRepeat(kind: .start)

        #expect(value.kind == .start)
        #expect(value.slashContent == nil)
        #expect(value.slashes == nil)
        #expect(value.usesDots == nil)
    }

    @Test
    func init_explicitValues() {
        let slashContent = MXLSlashContent(exceptVoice: ["1"])
        let value = MXLBeatRepeat(slashContent: slashContent,
                                  kind: .stop,
                                  slashes: 2,
                                  usesDots: true)

        #expect(value.kind == .stop)
        #expect(value.slashContent == slashContent)
        #expect(value.slashes == 2)
        #expect(value.usesDots == true)
    }
}
