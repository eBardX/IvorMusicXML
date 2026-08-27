// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLElementPositionTests {
}

// MARK: -

extension MXLElementPositionTests {
    @Test
    func equality() {
        #expect(MXLElementPosition(element: "beam", position: 2) ==    // swiftlint:disable:this identical_operands
                 MXLElementPosition(element: "beam", position: 2))
    }

    @Test
    func hashable() {
        let values: Set<MXLElementPosition> = [MXLElementPosition(element: "beam", position: 2),
                                               MXLElementPosition(element: "beam", position: 2),
                                               MXLElementPosition(element: "beam", position: 3)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLElementPosition(element: "beam", position: 2) != MXLElementPosition(element: "beam", position: 3))
    }

    @Test
    func init_defaultValues() {
        let value = MXLElementPosition()

        #expect(value.element == nil)
        #expect(value.position == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLElementPosition(element: "beam", position: 2)

        #expect(value.element == "beam")
        #expect(value.position == 2)
    }
}
