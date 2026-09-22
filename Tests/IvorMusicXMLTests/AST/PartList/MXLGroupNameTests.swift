// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLGroupNameTests {
}

// MARK: -

extension MXLGroupNameTests {
    @Test
    func equality() {
        #expect(MXLGroupName(value: "Strings", text: MXLGroupName.Text()) ==    // swiftlint:disable:this identical_operands
                 MXLGroupName(value: "Strings", text: MXLGroupName.Text()))
    }

    @Test
    func hashable() {
        let values: Set<MXLGroupName> = [MXLGroupName(value: "Strings", text: MXLGroupName.Text()),
                                         MXLGroupName(value: "Strings", text: MXLGroupName.Text()),
                                         MXLGroupName(value: "Brass", text: MXLGroupName.Text())]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLGroupName(value: "Strings", text: MXLGroupName.Text()) != MXLGroupName(value: "Brass", text: MXLGroupName.Text()))
    }

    @Test
    func init_values() {
        let text = MXLGroupName.Text(justify: .center)
        let value = MXLGroupName(value: "Strings", text: text)

        #expect(value.text == text)
        #expect(value.value == "Strings")
    }
}
