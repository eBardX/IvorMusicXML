// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLVirtualInstrumentDataTests {
}

// MARK: -

extension MXLVirtualInstrumentDataTests {
    @Test
    func equality() {
        #expect(MXLVirtualInstrumentData() == MXLVirtualInstrumentData())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLVirtualInstrumentData> = [MXLVirtualInstrumentData(), MXLVirtualInstrumentData(), MXLVirtualInstrumentData(instrumentSound: "strings.violin")]    // swiftlint:disable:this line_length

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLVirtualInstrumentData() != MXLVirtualInstrumentData(instrumentSound: "strings.violin"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLVirtualInstrumentData()

        #expect(value.content == nil)
        #expect(value.instrumentSound == nil)
        #expect(value.virtualInstrument == nil)
    }

    @Test
    func init_explicitValues() {
        let virtualInstrument = MXLVirtualInstrument(virtualLibrary: "lib")
        let value = MXLVirtualInstrumentData(instrumentSound: "strings.violin", content: .solo, virtualInstrument: virtualInstrument)

        #expect(value.content == .solo)
        #expect(value.instrumentSound == "strings.violin")
        #expect(value.virtualInstrument == virtualInstrument)
    }
}
