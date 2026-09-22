// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPlayTests {
}

// MARK: -

extension MXLPlayTests {
    @Test
    func equality() {
        #expect(MXLPlay() == MXLPlay())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLPlay> = [MXLPlay(), MXLPlay(), MXLPlay(id: "p2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPlay() != MXLPlay(id: "p2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLPlay()

        #expect(value.id == nil)
        #expect(value.items.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let items: [MXLPlay.Item] = [.mute(.on)]
        let value = MXLPlay(id: "p1", items: items)

        #expect(value.id == "p1")
        #expect(value.items == items)
    }
}
