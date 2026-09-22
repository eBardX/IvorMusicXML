// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLCancelTests {
}

// MARK: -

extension MXLCancelTests {
    @Test
    func equality() {
        #expect(MXLCancel(value: -2) == MXLCancel(value: -2))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLCancel> = [MXLCancel(value: -2), MXLCancel(value: -2), MXLCancel(value: 2)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLCancel(value: -2) != MXLCancel(value: 2))
    }

    @Test
    func init_defaultValues() {
        let value = MXLCancel(value: -2)

        #expect(value.location == nil)
        #expect(value.value == -2)
    }

    @Test
    func init_explicitValues() {
        let value = MXLCancel(value: -2,
                              location: .left)

        #expect(value.location == .left)
        #expect(value.value == -2)
    }
}
