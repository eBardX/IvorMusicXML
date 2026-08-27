// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLevelDisplayTests {
}

// MARK: -

extension MXLLevelDisplayTests {
    @Test
    func equality() {
        #expect(MXLLevel.Display() == MXLLevel.Display())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLLevel.Display> = [MXLLevel.Display(), MXLLevel.Display(), MXLLevel.Display(hasParentheses: true)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLLevel.Display() != MXLLevel.Display(hasParentheses: true))
    }

    @Test
    func init_defaultValues() {
        let value = MXLLevel.Display()

        #expect(value.hasBracket == nil)
        #expect(value.hasParentheses == nil)
        #expect(value.size == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLLevel.Display(hasParentheses: true, hasBracket: true, size: .large)

        #expect(value.hasBracket == true)
        #expect(value.hasParentheses == true)
        #expect(value.size == .large)
    }
}
