// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLInstrumentLinkTests {
}

// MARK: -

extension MXLInstrumentLinkTests {
    @Test
    func equality() {
        #expect(MXLInstrumentLink(id: "i1") == MXLInstrumentLink(id: "i1"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLInstrumentLink> = [MXLInstrumentLink(id: "i1"), MXLInstrumentLink(id: "i1"), MXLInstrumentLink(id: "i2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLInstrumentLink(id: "i1") != MXLInstrumentLink(id: "i2"))
    }

    @Test
    func init_values() {
        let value = MXLInstrumentLink(id: "i1")

        #expect(value.id == "i1")
    }
}
