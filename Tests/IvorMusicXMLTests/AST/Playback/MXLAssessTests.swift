// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLAssessTests {
}

// MARK: -

extension MXLAssessTests {
    @Test
    func equality() {
        #expect(MXLAssess(shouldAssess: true) == MXLAssess(shouldAssess: true))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLAssess> = [MXLAssess(shouldAssess: true), MXLAssess(shouldAssess: true), MXLAssess(shouldAssess: false)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLAssess(shouldAssess: true) != MXLAssess(shouldAssess: false))
    }

    @Test
    func init_defaultValues() {
        let value = MXLAssess(shouldAssess: true)

        #expect(value.player == nil)
        #expect(value.timeOnly == nil)
        #expect(value.shouldAssess == true)
    }

    @Test
    func init_explicitValues() {
        let value = MXLAssess(shouldAssess: false, player: "p1", timeOnly: [1])

        #expect(value.player == "p1")
        #expect(value.timeOnly == [1])
        #expect(value.shouldAssess == false)
    }
}
