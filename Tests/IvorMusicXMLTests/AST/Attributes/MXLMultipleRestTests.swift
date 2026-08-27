// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLMultipleRestTests {
}

// MARK: -

extension MXLMultipleRestTests {
    @Test
    func equality() {
        #expect(MXLMultipleRest(value: 4) == MXLMultipleRest(value: 4))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLMultipleRest> = [MXLMultipleRest(value: 4), MXLMultipleRest(value: 4), MXLMultipleRest(value: 8)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLMultipleRest(value: 4) != MXLMultipleRest(value: 8))
    }

    @Test
    func init_defaultValues() {
        let value = MXLMultipleRest(value: 4)

        #expect(value.usesSymbols == false)
        #expect(value.value == 4)
    }

    @Test
    func init_explicitValues() {
        let value = MXLMultipleRest(value: 4, usesSymbols: true)

        #expect(value.usesSymbols == true)
        #expect(value.value == 4)
    }
}
