// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLGroupBarlineTests {
}

// MARK: -

extension MXLGroupBarlineTests {
    @Test
    func equality() {
        #expect(MXLGroupBarline(value: .yes) == MXLGroupBarline(value: .yes))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLGroupBarline> = [MXLGroupBarline(value: .yes), MXLGroupBarline(value: .yes), MXLGroupBarline(value: .no)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLGroupBarline(value: .yes) != MXLGroupBarline(value: .no))
    }

    @Test
    func init_defaultValues() {
        let value = MXLGroupBarline(value: .yes)

        #expect(value.color == nil)
        #expect(value.value == .yes)
    }

    @Test
    func init_explicitValues() {
        let value = MXLGroupBarline(value: .no, color: MXLColor(stringValue: "#800080"))

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.value == .no)
    }
}
