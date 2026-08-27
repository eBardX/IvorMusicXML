// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLRepeatTests {
}

// MARK: -

extension MXLRepeatTests {
    @Test
    func equality() {
        #expect(MXLRepeat(direction: .forward) == MXLRepeat(direction: .forward))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLRepeat> = [MXLRepeat(direction: .forward), MXLRepeat(direction: .forward), MXLRepeat(direction: .backward)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLRepeat(direction: .forward) != MXLRepeat(direction: .backward))
    }

    @Test
    func init_defaultValues() {
        let value = MXLRepeat(direction: .forward)

        #expect(value.direction == .forward)
        #expect(value.isAfterJump == nil)
        #expect(value.times == nil)
        #expect(value.winged == .wingless)
    }

    @Test
    func init_explicitValues() {
        let value = MXLRepeat(direction: .backward,
                              times: 2,
                              isAfterJump: true,
                              winged: .curved)

        #expect(value.direction == .backward)
        #expect(value.isAfterJump == true)
        #expect(value.times == 2)
        #expect(value.winged == .curved)
    }
}
