// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHoleClosedTests {
}

// MARK: -

extension MXLHoleClosedTests {
    @Test
    func equality() {
        #expect(MXLHole.Closed(value: .yes) == MXLHole.Closed(value: .yes))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLHole.Closed> = [MXLHole.Closed(value: .yes), MXLHole.Closed(value: .yes), MXLHole.Closed(value: .no)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHole.Closed(value: .yes) != MXLHole.Closed(value: .no))
    }

    @Test
    func init_defaultValues() {
        let value = MXLHole.Closed(value: .yes)

        #expect(value.location == nil)
        #expect(value.value == .yes)
    }

    @Test
    func init_explicitValues() {
        let value = MXLHole.Closed(value: .half, location: .top)

        #expect(value.location == .top)
        #expect(value.value == .half)
    }
}
