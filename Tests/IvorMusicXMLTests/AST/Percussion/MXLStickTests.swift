// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLStickTests {
}

// MARK: -

extension MXLStickTests {
    @Test
    func equality() {
        #expect(MXLStick(kind: .bassDrum, material: .hard) == MXLStick(kind: .bassDrum, material: .hard))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLStick> = [MXLStick(kind: .bassDrum, material: .hard),
                                     MXLStick(kind: .bassDrum, material: .hard),
                                     MXLStick(kind: .timpani, material: .soft)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLStick(kind: .bassDrum, material: .hard) != MXLStick(kind: .timpani, material: .soft))
    }

    @Test
    func init_defaultValues() {
        let value = MXLStick(kind: .bassDrum, material: .hard)

        #expect(value.hasDashedCircle == false)
        #expect(value.hasParentheses == false)
        #expect(value.kind == .bassDrum)
        #expect(value.material == .hard)
        #expect(value.tip == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLStick(kind: .timpani, material: .soft, tip: .up, hasParentheses: true, hasDashedCircle: true)

        #expect(value.hasDashedCircle == true)
        #expect(value.hasParentheses == true)
        #expect(value.kind == .timpani)
        #expect(value.material == .soft)
        #expect(value.tip == .up)
    }
}
