// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLKeyContentTests {
}

// MARK: -

extension MXLKeyContentTests {
    @Test
    func equality() {
        let key = MXLTraditionalKey(fifths: MXLFifths(intValue: 2)!)    // swiftlint:disable:this force_unwrapping

        #expect(MXLKey.Content.traditionalKey(key) == .traditionalKey(key))
    }

    @Test
    func hashable() {
        let nonTraditional = MXLKey.Content.nonTraditionalKey(MXLNonTraditionalKey(step: .c, alter: 0))
        let traditional = MXLKey.Content.traditionalKey(MXLTraditionalKey(fifths: MXLFifths(intValue: 2)!))    // swiftlint:disable:this force_unwrapping line_length
        let values: Set<MXLKey.Content> = [nonTraditional, nonTraditional, traditional]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let nonTraditional = MXLNonTraditionalKey(step: .c, alter: 0)
        let traditional = MXLTraditionalKey(fifths: MXLFifths(intValue: 2)!)    // swiftlint:disable:this force_unwrapping

        #expect(MXLKey.Content.nonTraditionalKey(nonTraditional) != .traditionalKey(traditional))
    }
}
