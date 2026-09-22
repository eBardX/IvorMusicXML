// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLHarmonMuteTests {
}

// MARK: -

extension MXLHarmonMuteTests {
    @Test
    func equality() {
        let harmonClosed = MXLHarmonClosed(value: .yes)

        #expect(MXLHarmonMute(harmonClosed: harmonClosed) == MXLHarmonMute(harmonClosed: harmonClosed))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let harmonClosed = MXLHarmonClosed(value: .yes)
        let otherHarmonClosed = MXLHarmonClosed(value: .no)
        let values: Set<MXLHarmonMute> = [MXLHarmonMute(harmonClosed: harmonClosed),
                                          MXLHarmonMute(harmonClosed: harmonClosed),
                                          MXLHarmonMute(harmonClosed: otherHarmonClosed)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let harmonClosed = MXLHarmonClosed(value: .yes)
        let otherHarmonClosed = MXLHarmonClosed(value: .no)

        #expect(MXLHarmonMute(harmonClosed: harmonClosed) != MXLHarmonMute(harmonClosed: otherHarmonClosed))
    }

    @Test
    func init_defaultValues() {
        let harmonClosed = MXLHarmonClosed(value: .yes)
        let value = MXLHarmonMute(harmonClosed: harmonClosed)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.harmonClosed == harmonClosed)
        #expect(value.placement == nil)
        #expect(value.position == MXLPosition())
    }

    @Test
    func init_explicitValues() {
        let harmonClosed = MXLHarmonClosed(value: .half, location: .top)
        let value = MXLHarmonMute(harmonClosed: harmonClosed,
                                  position: MXLPosition(defaultX: 10),
                                  font: MXLFont(style: .italic),
                                  color: MXLColor(stringValue: "#800080"),
                                  placement: .above)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.harmonClosed == harmonClosed)
        #expect(value.placement == .above)
        #expect(value.position == MXLPosition(defaultX: 10))
    }
}
