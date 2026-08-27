// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLInstrumentChangeTests {
}

// MARK: -

extension MXLInstrumentChangeTests {
    @Test
    func equality() {
        #expect(MXLInstrumentChange(id: "i1") == MXLInstrumentChange(id: "i1"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLInstrumentChange> = [MXLInstrumentChange(id: "i1"), MXLInstrumentChange(id: "i1"), MXLInstrumentChange(id: "i2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLInstrumentChange(id: "i1") != MXLInstrumentChange(id: "i2"))
    }

    @Test
    func init_values() {
        let value = MXLInstrumentChange(id: "i1")

        #expect(value.id == "i1")
    }
}
