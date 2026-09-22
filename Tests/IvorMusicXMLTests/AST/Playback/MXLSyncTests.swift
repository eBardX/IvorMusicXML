// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSyncTests {
}

// MARK: -

extension MXLSyncTests {
    @Test
    func equality() {
        #expect(MXLSync(kind: .event) == MXLSync(kind: .event))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLSync> = [MXLSync(kind: .event), MXLSync(kind: .event), MXLSync(kind: .tempo)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSync(kind: .event) != MXLSync(kind: .tempo))
    }

    @Test
    func init_defaultValues() {
        let value = MXLSync(kind: .event)

        #expect(value.latency == nil)
        #expect(value.player == nil)
        #expect(value.timeOnly == nil)
        #expect(value.kind == .event)
    }

    @Test
    func init_explicitValues() {
        let value = MXLSync(kind: .tempo, latency: MXLMilliseconds(uintValue: 100), player: "p1", timeOnly: [1])

        #expect(value.latency == MXLMilliseconds(uintValue: 100))
        #expect(value.player == "p1")
        #expect(value.timeOnly == [1])
        #expect(value.kind == .tempo)
    }
}
