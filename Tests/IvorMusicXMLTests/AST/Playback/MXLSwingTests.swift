// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSwingTests {
}

// MARK: -

extension MXLSwingTests {
    @Test
    func equality() {
        #expect(MXLSwing(content: .straight) == MXLSwing(content: .straight))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLSwing> = [MXLSwing(content: .straight), MXLSwing(content: .straight), MXLSwing(content: .first(2, second: 1, kind: .eighth))]    // swiftlint:disable:this line_length

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSwing(content: .straight) != MXLSwing(content: .first(2, second: 1, kind: .eighth)))
    }

    @Test
    func init_defaultValues() {
        let value = MXLSwing(content: .straight)

        #expect(value.content == .straight)
        #expect(value.style == nil)
    }

    @Test
    func init_explicitValues() {
        let content = MXLSwing.Content.first(2, second: 1, kind: .eighth)
        let value = MXLSwing(content: content, style: "swing")

        #expect(value.content == content)
        #expect(value.style == "swing")
    }
}
