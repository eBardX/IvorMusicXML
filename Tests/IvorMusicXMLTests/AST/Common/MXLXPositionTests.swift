// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLXPositionTests {
}

// MARK: -

extension MXLXPositionTests {
    @Test
    func equality() {
        #expect(MXLXPosition(defaultX: 10) == MXLXPosition(defaultX: 10))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLXPosition> = [MXLXPosition(defaultX: 10), MXLXPosition(defaultX: 10), MXLXPosition(defaultX: 20)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLXPosition(defaultX: 10) != MXLXPosition(defaultX: 20))
    }

    @Test
    func init_defaultValues() {
        let value = MXLXPosition()

        #expect(value.defaultX == nil)
        #expect(value.defaultY == nil)
        #expect(value.relativeX == nil)
        #expect(value.relativeY == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLXPosition(defaultX: 10,
                                 defaultY: 20,
                                 relativeX: 30,
                                 relativeY: 40)

        #expect(value.defaultX == 10)
        #expect(value.defaultY == 20)
        #expect(value.relativeX == 30)
        #expect(value.relativeY == 40)
    }
}
