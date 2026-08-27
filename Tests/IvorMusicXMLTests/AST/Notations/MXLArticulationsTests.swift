// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLArticulationsTests {
}

// MARK: -

extension MXLArticulationsTests {
    @Test
    func equality() {
        #expect(MXLArticulations() == MXLArticulations())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLArticulations> = [MXLArticulations(), MXLArticulations(), MXLArticulations(id: "a2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLArticulations() != MXLArticulations(id: "a2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLArticulations()

        #expect(value.id == nil)
        #expect(value.items.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let items: [MXLArticulations.Item] = [.breathMark(MXLBreathMark(value: .comma))]
        let value = MXLArticulations(id: "a1", items: items)

        #expect(value.id == "a1")
        #expect(value.items == items)
    }
}
