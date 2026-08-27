// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLGraceTests {
}

// MARK: -

extension MXLGraceTests {
    @Test
    func equality() {
        #expect(MXLGrace() == MXLGrace())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLGrace> = [MXLGrace(), MXLGrace(), MXLGrace(isSlashed: true)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLGrace() != MXLGrace(isSlashed: true))
    }

    @Test
    func init_defaultValues() {
        let value = MXLGrace()

        #expect(value.makeTime == nil)
        #expect(value.isSlashed == nil)
        #expect(value.stealTimeFollowing == nil)
        #expect(value.stealTimePrevious == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLGrace(stealTimePrevious: 20, stealTimeFollowing: 30, makeTime: MXLDivisions(intValue: 1), isSlashed: true)

        #expect(value.makeTime == MXLDivisions(intValue: 1))
        #expect(value.isSlashed == true)
        #expect(value.stealTimeFollowing == 30)
        #expect(value.stealTimePrevious == 20)
    }
}
