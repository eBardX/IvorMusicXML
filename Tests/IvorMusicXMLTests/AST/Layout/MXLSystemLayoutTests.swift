// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSystemLayoutTests {
}

// MARK: -

extension MXLSystemLayoutTests {
    @Test
    func equality() {
        #expect(MXLSystemLayout() == MXLSystemLayout())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLSystemLayout> = [MXLSystemLayout(), MXLSystemLayout(), MXLSystemLayout(systemDistance: 100)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSystemLayout() != MXLSystemLayout(systemDistance: 100))
    }

    @Test
    func init_defaultValues() {
        let value = MXLSystemLayout()

        #expect(value.systemDistance == nil)
        #expect(value.systemDividers == nil)
        #expect(value.systemMargins == nil)
        #expect(value.topSystemDistance == nil)
    }

    @Test
    func init_explicitValues() {
        let systemMargins = MXLSystemMargins(leftRightMargins: MXLLeftRightMargins(leftMargin: 10, rightMargin: 10))
        let printStyleAlign = MXLPrintStyleAlign(printStyle: MXLPrintStyle())
        let divider = MXLEmptyPrintObjectStyleAlign(printStyleAlign: printStyleAlign)
        let systemDividers = MXLSystemDividers(leftDivider: divider, rightDivider: divider)
        let value = MXLSystemLayout(systemMargins: systemMargins,
                                    systemDistance: 100,
                                    topSystemDistance: 150,
                                    systemDividers: systemDividers)

        #expect(value.systemDistance == 100)
        #expect(value.systemDividers == systemDividers)
        #expect(value.systemMargins == systemMargins)
        #expect(value.topSystemDistance == 150)
    }
}
