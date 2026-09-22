// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHammerOnPullOffTests {
}

// MARK: -

extension MXLHammerOnPullOffTests {
    @Test
    func equality() {
        #expect(MXLHammerOnPullOff(value: "H", kind: .start) == MXLHammerOnPullOff(value: "H", kind: .start))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLHammerOnPullOff> = [MXLHammerOnPullOff(value: "H", kind: .start),
                                               MXLHammerOnPullOff(value: "H", kind: .start),
                                               MXLHammerOnPullOff(value: "P", kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLHammerOnPullOff(value: "H", kind: .start) != MXLHammerOnPullOff(value: "P", kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let value = MXLHammerOnPullOff(value: "H", kind: .start)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.number == MXLNumberLevel(uintValue: 1))
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
        #expect(value.kind == .start)
        #expect(value.value == "H")
    }

    @Test
    func init_explicitValues() {
        let value = MXLHammerOnPullOff(value: "P",
                                       kind: .stop,
                                       number: MXLNumberLevel(uintValue: 2),
                                       position: MXLPosition(defaultX: 10),
                                       font: MXLFont(style: .italic),
                                       color: MXLColor(stringValue: "#800080"),
                                       placement: .above)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.number == MXLNumberLevel(uintValue: 2))
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.kind == .stop)
        #expect(value.value == "P")
    }
}
