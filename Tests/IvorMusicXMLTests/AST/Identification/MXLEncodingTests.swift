// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLEncodingTests {
}

// MARK: -

extension MXLEncodingTests {
    @Test
    func equality() {
        #expect(MXLEncoding() == MXLEncoding())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLEncoding> = [MXLEncoding(), MXLEncoding(), MXLEncoding(items: [.software("Finale")])]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLEncoding() != MXLEncoding(items: [.software("Finale")]))
    }

    @Test
    func init_defaultValues() {
        let value = MXLEncoding()

        #expect(value.items.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let items: [MXLEncoding.Item] = [.software("Finale")]
        let value = MXLEncoding(items: items)

        #expect(value.items == items)
    }
}
