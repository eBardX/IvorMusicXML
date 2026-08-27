// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLXLinkActuateTests {
}

// MARK: -

extension MXLXLinkActuateTests {
    @Test
    func equality() {
        #expect(MXLXLink.Actuate.onRequest == .onRequest)
    }

    @Test
    func hashable() {
        let values: Set<MXLXLink.Actuate> = [.onRequest, .onRequest, .onLoad]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLXLink.Actuate.onRequest != .onLoad)
    }
}
