// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLListenItemTests {
}

// MARK: -

extension MXLListenItemTests {
    @Test
    func equality() {
        let assess = MXLAssess(shouldAssess: true)

        #expect(MXLListen.Item.assess(assess) == .assess(assess))
    }

    @Test
    func hashable() {
        let assess = MXLListen.Item.assess(MXLAssess(shouldAssess: true))
        let wait = MXLListen.Item.wait(MXLWait())
        let values: Set<MXLListen.Item> = [assess, assess, wait]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let assess = MXLListen.Item.assess(MXLAssess(shouldAssess: true))
        let wait = MXLListen.Item.wait(MXLWait())

        #expect(assess != wait)
    }
}
