// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLBarreTests {
}

// MARK: -

extension MXLBarreTests {
    @Test
    func equality() {
        #expect(MXLBarre(kind: .start) == MXLBarre(kind: .start))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLBarre> = [MXLBarre(kind: .start), MXLBarre(kind: .start), MXLBarre(kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLBarre(kind: .start) != MXLBarre(kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let value = MXLBarre(kind: .start)

        #expect(value.color == nil)
        #expect(value.kind == .start)
    }

    @Test
    func init_explicitValues() {
        let value = MXLBarre(kind: .stop, color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.kind == .stop)
    }
}
