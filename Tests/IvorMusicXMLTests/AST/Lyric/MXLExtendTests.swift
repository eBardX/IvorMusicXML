// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLExtendTests {
}

// MARK: -

extension MXLExtendTests {
    @Test
    func equality() {
        #expect(MXLExtend() == MXLExtend())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLExtend> = [MXLExtend(), MXLExtend(), MXLExtend(kind: .start)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLExtend() != MXLExtend(kind: .start))
    }

    @Test
    func init_defaultValues() {
        let value = MXLExtend()

        #expect(value.color == nil)
        #expect(value.position == MXLPosition())
        #expect(value.kind == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLExtend(kind: .start, position: MXLPosition(defaultX: 10), color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.kind == .start)
    }
}
