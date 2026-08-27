// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLevelTests {
}

// MARK: -

extension MXLLevelTests {
    @Test
    func equality() {
        #expect(MXLLevel(value: "1", display: MXLLevel.Display()) ==    // swiftlint:disable:this identical_operands
                 MXLLevel(value: "1", display: MXLLevel.Display()))
    }

    @Test
    func hashable() {
        let values: Set<MXLLevel> = [MXLLevel(value: "1", display: MXLLevel.Display()),
                                     MXLLevel(value: "1", display: MXLLevel.Display()),
                                     MXLLevel(value: "2", display: MXLLevel.Display())]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLLevel(value: "1", display: MXLLevel.Display()) != MXLLevel(value: "2", display: MXLLevel.Display()))
    }

    @Test
    func init_defaultValues() {
        let value = MXLLevel(value: "1", display: MXLLevel.Display())

        #expect(value.display == MXLLevel.Display())
        #expect(value.isReferenceOnly == nil)
        #expect(value.kind == nil)
        #expect(value.value == "1")
    }

    @Test
    func init_explicitValues() {
        let display = MXLLevel.Display(hasParentheses: true)
        let value = MXLLevel(value: "1", isReferenceOnly: true, kind: .start, display: display)

        #expect(value.display == display)
        #expect(value.isReferenceOnly == true)
        #expect(value.kind == .start)
        #expect(value.value == "1")
    }
}
