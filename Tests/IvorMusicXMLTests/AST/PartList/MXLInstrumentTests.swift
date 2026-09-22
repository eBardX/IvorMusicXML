// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLInstrumentTests {
}

// MARK: -

extension MXLInstrumentTests {
    @Test
    func equality() {
        #expect(MXLInstrument(id: "i1") == MXLInstrument(id: "i1"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLInstrument> = [MXLInstrument(id: "i1"), MXLInstrument(id: "i1"), MXLInstrument(id: "i2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLInstrument(id: "i1") != MXLInstrument(id: "i2"))
    }

    @Test
    func init_values() {
        let value = MXLInstrument(id: "i1")

        #expect(value.id == "i1")
    }
}
