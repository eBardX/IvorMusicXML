// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHarmonClosedTests {
}

// MARK: -

extension MXLHarmonClosedTests {
    @Test
    func equality() {
        #expect(MXLHarmonClosed(value: .yes) == MXLHarmonClosed(value: .yes))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLHarmonClosed> = [MXLHarmonClosed(value: .yes), MXLHarmonClosed(value: .yes), MXLHarmonClosed(value: .no)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHarmonClosed(value: .yes) != MXLHarmonClosed(value: .no))
    }

    @Test
    func init_defaultValues() {
        let value = MXLHarmonClosed(value: .yes)

        #expect(value.location == nil)
        #expect(value.value == .yes)
    }

    @Test
    func init_explicitValues() {
        let value = MXLHarmonClosed(value: .half, location: .top)

        #expect(value.location == .top)
        #expect(value.value == .half)
    }
}
