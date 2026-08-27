// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTieTests {
}

// MARK: -

extension MXLTieTests {
    @Test
    func equality() {
        #expect(MXLTie(kind: .start) == MXLTie(kind: .start))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLTie> = [MXLTie(kind: .start), MXLTie(kind: .start), MXLTie(kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTie(kind: .start) != MXLTie(kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let value = MXLTie(kind: .start)

        #expect(value.timeOnly == nil)
        #expect(value.kind == .start)
    }

    @Test
    func init_explicitValues() {
        let value = MXLTie(kind: .stop, timeOnly: [1, 2])

        #expect(value.timeOnly == [1, 2])
        #expect(value.kind == .stop)
    }
}
