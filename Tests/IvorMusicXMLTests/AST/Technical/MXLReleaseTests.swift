// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLReleaseTests {
}

// MARK: -

extension MXLReleaseTests {
    @Test
    func equality() {
        #expect(MXLRelease() == MXLRelease())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLRelease> = [MXLRelease(), MXLRelease(), MXLRelease(offset: MXLDivisions(intValue: 4))]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLRelease() != MXLRelease(offset: MXLDivisions(intValue: 4)))
    }

    @Test
    func init_defaultValues() {
        let value = MXLRelease()

        #expect(value.offset == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLRelease(offset: MXLDivisions(intValue: 4))

        #expect(value.offset == MXLDivisions(intValue: 4))
    }
}
