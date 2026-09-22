// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLGlassTests {
}

// MARK: -

extension MXLGlassTests {
    @Test
    func equality() {
        #expect(MXLGlass(value: .windChimes) == MXLGlass(value: .windChimes))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLGlass> = [MXLGlass(value: .windChimes), MXLGlass(value: .windChimes), MXLGlass(value: .glassHarp)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLGlass(value: .windChimes) != MXLGlass(value: .glassHarp))
    }

    @Test
    func init_defaultValues() {
        let value = MXLGlass(value: .windChimes)

        #expect(value.smufl == nil)
        #expect(value.value == .windChimes)
    }

    @Test
    func init_explicitValues() {
        let value = MXLGlass(value: .glassHarp, smufl: MXLSmuflPictogramGlyphName(stringValue: "pictGlassHarp"))

        #expect(value.smufl == MXLSmuflPictogramGlyphName(stringValue: "pictGlassHarp"))
        #expect(value.value == .glassHarp)
    }
}
