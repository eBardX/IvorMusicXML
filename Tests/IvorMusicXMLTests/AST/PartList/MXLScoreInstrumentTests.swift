// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLScoreInstrumentTests {
}

// MARK: -

extension MXLScoreInstrumentTests {
    @Test
    func equality() {
        #expect(MXLScoreInstrument(id: "i1", name: "Violin") == MXLScoreInstrument(id: "i1", name: "Violin"))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLScoreInstrument> = [MXLScoreInstrument(id: "i1", name: "Violin"),
                                               MXLScoreInstrument(id: "i1", name: "Violin"),
                                               MXLScoreInstrument(id: "i2", name: "Viola")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLScoreInstrument(id: "i1", name: "Violin") != MXLScoreInstrument(id: "i2", name: "Viola"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLScoreInstrument(id: "i1", name: "Violin")

        #expect(value.abbreviation == nil)
        #expect(value.id == "i1")
        #expect(value.name == "Violin")
        #expect(value.virtualInstrumentData == MXLVirtualInstrumentData())
    }

    @Test
    func init_explicitValues() {
        let virtualInstrumentData = MXLVirtualInstrumentData(instrumentSound: "strings.violin")
        let value = MXLScoreInstrument(id: "i1", name: "Violin", abbreviation: "Vln.", virtualInstrumentData: virtualInstrumentData)

        #expect(value.abbreviation == "Vln.")
        #expect(value.id == "i1")
        #expect(value.name == "Violin")
        #expect(value.virtualInstrumentData == virtualInstrumentData)
    }
}
