// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLListeningTests {
}

// MARK: -

extension MXLListeningTests {
    @Test
    func equality() {
        #expect(MXLListening() == MXLListening())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let offset = MXLOffset(value: 4)
        let values: Set<MXLListening> = [MXLListening(), MXLListening(), MXLListening(offset: offset)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let offset = MXLOffset(value: 4)

        #expect(MXLListening() != MXLListening(offset: offset))
    }

    @Test
    func init_defaultValues() {
        let value = MXLListening()

        #expect(value.items.isEmpty)
        #expect(value.offset == nil)
    }

    @Test
    func init_explicitValues() {
        let items: [MXLListening.Item] = [.sync(MXLSync(kind: .event))]
        let offset = MXLOffset(value: 4)
        let value = MXLListening(items: items, offset: offset)

        #expect(value.items == items)
        #expect(value.offset == offset)
    }
}
