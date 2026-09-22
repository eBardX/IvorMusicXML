// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPartNameTextTests {
}

// MARK: -

extension MXLPartNameTextTests {
    @Test
    func equality() {
        #expect(MXLPartName.Text() == MXLPartName.Text())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLPartName.Text> = [MXLPartName.Text(), MXLPartName.Text(), MXLPartName.Text(printsObject: false)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPartName.Text() != MXLPartName.Text(printsObject: false))
    }

    @Test
    func init_defaultValues() {
        let value = MXLPartName.Text()

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.justify == nil)
        #expect(value.position == MXLPosition())
        #expect(value.printsObject == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLPartName.Text(position: MXLPosition(defaultX: 10),
                                     font: MXLFont(style: .italic),
                                     color: MXLColor(stringValue: "#800080"),
                                     printsObject: false,
                                     justify: .center)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.justify == .center)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.printsObject == false)
    }
}
