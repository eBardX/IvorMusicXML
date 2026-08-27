// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLGroupNameTextTests {
}

// MARK: -

extension MXLGroupNameTextTests {
    @Test
    func equality() {
        #expect(MXLGroupName.Text() == MXLGroupName.Text())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLGroupName.Text> = [MXLGroupName.Text(), MXLGroupName.Text(), MXLGroupName.Text(justify: .center)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLGroupName.Text() != MXLGroupName.Text(justify: .center))
    }

    @Test
    func init_defaultValues() {
        let value = MXLGroupName.Text()

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.justify == nil)
        #expect(value.position == MXLPosition())
    }

    @Test
    func init_explicitValues() {
        let value = MXLGroupName.Text(position: MXLPosition(defaultX: 10),
                                      font: MXLFont(style: .italic),
                                      color: MXLColor(stringValue: "#800080"),
                                      justify: .center)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.justify == .center)
        #expect(value.position == MXLPosition(defaultX: 10))
    }
}
