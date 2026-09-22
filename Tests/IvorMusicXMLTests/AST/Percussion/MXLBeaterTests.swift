// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBeaterTests {
}

// MARK: -

extension MXLBeaterTests {
    @Test
    func equality() {
        #expect(MXLBeater(value: .bow) == MXLBeater(value: .bow))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLBeater> = [MXLBeater(value: .bow), MXLBeater(value: .bow), MXLBeater(value: .hammer)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBeater(value: .bow) != MXLBeater(value: .hammer))
    }

    @Test
    func init_defaultValues() {
        let value = MXLBeater(value: .bow)

        #expect(value.tip == nil)
        #expect(value.value == .bow)
    }

    @Test
    func init_explicitValues() {
        let value = MXLBeater(value: .hammer, tip: .up)

        #expect(value.tip == .up)
        #expect(value.value == .hammer)
    }
}
