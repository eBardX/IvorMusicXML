// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLVirtualInstrumentTests {
}

// MARK: -

extension MXLVirtualInstrumentTests {
    @Test
    func equality() {
        #expect(MXLVirtualInstrument() == MXLVirtualInstrument())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLVirtualInstrument> = [MXLVirtualInstrument(), MXLVirtualInstrument(), MXLVirtualInstrument(virtualLibrary: "lib")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLVirtualInstrument() != MXLVirtualInstrument(virtualLibrary: "lib"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLVirtualInstrument()

        #expect(value.virtualLibrary == nil)
        #expect(value.virtualName == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLVirtualInstrument(virtualLibrary: "lib", virtualName: "Violin")

        #expect(value.virtualLibrary == "lib")
        #expect(value.virtualName == "Violin")
    }
}
