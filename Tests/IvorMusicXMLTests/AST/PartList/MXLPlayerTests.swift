// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPlayerTests {
}

// MARK: -

extension MXLPlayerTests {
    @Test
    func equality() {
        #expect(MXLPlayer(id: "p1", name: "Jane") == MXLPlayer(id: "p1", name: "Jane"))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLPlayer> = [MXLPlayer(id: "p1", name: "Jane"), MXLPlayer(id: "p1", name: "Jane"), MXLPlayer(id: "p2", name: "John")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPlayer(id: "p1", name: "Jane") != MXLPlayer(id: "p2", name: "John"))
    }

    @Test
    func init_values() {
        let value = MXLPlayer(id: "p1", name: "Jane")

        #expect(value.id == "p1")
        #expect(value.name == "Jane")
    }
}
