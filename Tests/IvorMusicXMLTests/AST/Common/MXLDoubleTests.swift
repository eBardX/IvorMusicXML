// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDoubleTests {
}

// MARK: -

extension MXLDoubleTests {
    @Test
    func equality() {
        #expect(MXLDouble(isAbove: true) == MXLDouble(isAbove: true))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLDouble> = [MXLDouble(isAbove: true), MXLDouble(isAbove: true), MXLDouble(isAbove: false)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLDouble(isAbove: true) != MXLDouble(isAbove: false))
    }

    @Test
    func init_defaultValues() {
        let value = MXLDouble()

        #expect(value.isAbove == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLDouble(isAbove: true)

        #expect(value.isAbove == true)
    }
}
