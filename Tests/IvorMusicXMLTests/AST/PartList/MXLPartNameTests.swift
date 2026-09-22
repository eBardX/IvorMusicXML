// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPartNameTests {
}

// MARK: -

extension MXLPartNameTests {
    @Test
    func equality() {
        #expect(MXLPartName(value: "Violin", text: MXLPartName.Text()) == MXLPartName(value: "Violin", text: MXLPartName.Text()))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLPartName> = [MXLPartName(value: "Violin", text: MXLPartName.Text()),
                                        MXLPartName(value: "Violin", text: MXLPartName.Text()),
                                        MXLPartName(value: "Viola", text: MXLPartName.Text())]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPartName(value: "Violin", text: MXLPartName.Text()) != MXLPartName(value: "Viola", text: MXLPartName.Text()))
    }

    @Test
    func init_values() {
        let text = MXLPartName.Text(justify: .center)
        let value = MXLPartName(value: "Violin", text: text)

        #expect(value.text == text)
        #expect(value.value == "Violin")
    }
}
