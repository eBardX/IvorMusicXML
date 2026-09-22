// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLOffsetTests {
}

// MARK: -

extension MXLOffsetTests {
    @Test
    func equality() {
        #expect(MXLOffset(value: 4) == MXLOffset(value: 4))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLOffset> = [MXLOffset(value: 4), MXLOffset(value: 4), MXLOffset(value: 8)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLOffset(value: 4) != MXLOffset(value: 8))
    }

    @Test
    func init_defaultValues() {
        let value = MXLOffset(value: 4)

        #expect(value.affectsPlayback == false)
        #expect(value.value == 4)
    }

    @Test
    func init_explicitValues() {
        let value = MXLOffset(value: 8, affectsPlayback: true)

        #expect(value.affectsPlayback == true)
        #expect(value.value == 8)
    }
}
