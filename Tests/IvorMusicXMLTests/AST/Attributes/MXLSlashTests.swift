// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSlashTests {
}

// MARK: -

extension MXLSlashTests {
    @Test
    func equality() {
        #expect(MXLSlash(kind: .start) == MXLSlash(kind: .start))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLSlash> = [MXLSlash(kind: .start), MXLSlash(kind: .start), MXLSlash(kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSlash(kind: .start) != MXLSlash(kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let value = MXLSlash(kind: .start)

        #expect(value.content == nil)
        #expect(value.kind == .start)
        #expect(value.usesDots == nil)
        #expect(value.usesStems == false)
    }

    @Test
    func init_explicitValues() {
        let content = MXLSlashContent(exceptVoice: ["1"])
        let value = MXLSlash(content: content,
                             kind: .stop,
                             usesDots: true,
                             usesStems: true)

        #expect(value.content == content)
        #expect(value.kind == .stop)
        #expect(value.usesDots == true)
        #expect(value.usesStems == true)
    }
}
