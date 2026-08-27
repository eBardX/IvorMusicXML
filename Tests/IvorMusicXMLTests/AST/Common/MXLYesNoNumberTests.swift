// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLYesNoNumberTests {
}

// MARK: -

extension MXLYesNoNumberTests {
    @Test
    func equality() {
        #expect(MXLYesNoNumber.yes == .yes)
        #expect(MXLYesNoNumber.number(2) == .number(2))
    }

    @Test
    func hashable() {
        let values: Set<MXLYesNoNumber> = [.no, .no, .number(2), .yes]

        #expect(values.count == 3)
    }

    @Test
    func inequality() {
        #expect(MXLYesNoNumber.yes != .no)
        #expect(MXLYesNoNumber.number(2) != .number(3))
    }
}
