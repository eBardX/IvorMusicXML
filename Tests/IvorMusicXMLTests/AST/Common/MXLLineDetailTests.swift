// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLLineDetailTests {
}

// MARK: -

extension MXLLineDetailTests {
    @Test
    func equality() {
        let line = MXLStaffLine(uintValue: 1)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLLineDetail(line: line) == MXLLineDetail(line: line))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let line = MXLStaffLine(uintValue: 1)!    // swiftlint:disable:this force_unwrapping
        let values: Set<MXLLineDetail> = [MXLLineDetail(line: line),
                                          MXLLineDetail(line: line),
                                          MXLLineDetail(line: line, printsObject: false)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let line = MXLStaffLine(uintValue: 1)!    // swiftlint:disable:this force_unwrapping

        #expect(MXLLineDetail(line: line) != MXLLineDetail(line: line, printsObject: false))
    }

    @Test
    func init_defaultValues() {
        let line = MXLStaffLine(uintValue: 1)!    // swiftlint:disable:this force_unwrapping
        let value = MXLLineDetail(line: line)

        #expect(value.color == nil)
        #expect(value.line == line)
        #expect(value.lineKind == nil)
        #expect(value.printsObject == nil)
        #expect(value.width == nil)
    }

    @Test
    func init_explicitValues() {
        let line = MXLStaffLine(uintValue: 1)!    // swiftlint:disable:this force_unwrapping
        let color = MXLColor(stringValue: "#800080")
        let value = MXLLineDetail(line: line,
                                  width: 5,
                                  color: color,
                                  lineKind: .dashed,
                                  printsObject: false)

        #expect(value.color == color)
        #expect(value.line == line)
        #expect(value.lineKind == .dashed)
        #expect(value.printsObject == false)
        #expect(value.width == 5)
    }
}
