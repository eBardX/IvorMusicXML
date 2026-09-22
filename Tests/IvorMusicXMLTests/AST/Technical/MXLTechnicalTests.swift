// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTechnicalTests {
}

// MARK: -

extension MXLTechnicalTests {
    @Test
    func equality() {
        #expect(MXLTechnical() == MXLTechnical())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLTechnical> = [MXLTechnical(), MXLTechnical(), MXLTechnical(id: "t2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLTechnical() != MXLTechnical(id: "t2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLTechnical()

        #expect(value.id == nil)
        #expect(value.items.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let items: [MXLTechnical.Item] = [.fret(MXLFret(value: 3))]
        let value = MXLTechnical(id: "t1", items: items)

        #expect(value.id == "t1")
        #expect(value.items == items)
    }
}
