// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLListenTests {
}

// MARK: -

extension MXLListenTests {
    @Test
    func equality() {
        #expect(MXLListen() == MXLListen())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let items: [MXLListen.Item] = [.assess(MXLAssess(shouldAssess: true))]
        let values: Set<MXLListen> = [MXLListen(), MXLListen(), MXLListen(items: items)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let items: [MXLListen.Item] = [.assess(MXLAssess(shouldAssess: true))]

        #expect(MXLListen() != MXLListen(items: items))
    }

    @Test
    func init_defaultValues() {
        let value = MXLListen()

        #expect(value.items.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let items: [MXLListen.Item] = [.assess(MXLAssess(shouldAssess: true))]
        let value = MXLListen(items: items)

        #expect(value.items == items)
    }
}
