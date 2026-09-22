// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMetalTests {
}

// MARK: -

extension MXLMetalTests {
    @Test
    func equality() {
        #expect(MXLMetal(value: .bell) == MXLMetal(value: .bell))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLMetal> = [MXLMetal(value: .bell), MXLMetal(value: .bell), MXLMetal(value: .cowbell)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMetal(value: .bell) != MXLMetal(value: .cowbell))
    }

    @Test
    func init_defaultValues() {
        let value = MXLMetal(value: .bell)

        #expect(value.smufl == nil)
        #expect(value.value == .bell)
    }

    @Test
    func init_explicitValues() {
        let value = MXLMetal(value: .cowbell, smufl: MXLSmuflPictogramGlyphName(stringValue: "pictCowbell"))

        #expect(value.smufl == MXLSmuflPictogramGlyphName(stringValue: "pictCowbell"))
        #expect(value.value == .cowbell)
    }
}
