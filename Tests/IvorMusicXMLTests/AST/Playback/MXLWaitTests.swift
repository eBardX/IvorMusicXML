// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLWaitTests {
}

// MARK: -

extension MXLWaitTests {
    @Test
    func equality() {
        #expect(MXLWait() == MXLWait())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLWait> = [MXLWait(), MXLWait(), MXLWait(player: "p1")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLWait() != MXLWait(player: "p1"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLWait()

        #expect(value.player == nil)
        #expect(value.timeOnly == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLWait(player: "p1", timeOnly: [1])

        #expect(value.player == "p1")
        #expect(value.timeOnly == [1])
    }
}
