// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLKeyTests {
}

// MARK: -

extension MXLKeyTests {
    @Test
    func equality() {
        let content = MXLKey.Content.traditionalKey(MXLTraditionalKey(fifths: MXLFifths(intValue: 2)!))    // swiftlint:disable:this force_unwrapping

        #expect(MXLKey(content: content) == MXLKey(content: content))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let content1 = MXLKey.Content.traditionalKey(MXLTraditionalKey(fifths: MXLFifths(intValue: 2)!))    // swiftlint:disable:this force_unwrapping
        let content2 = MXLKey.Content.traditionalKey(MXLTraditionalKey(fifths: MXLFifths(intValue: -2)!))    // swiftlint:disable:this force_unwrapping line_length
        let values: Set<MXLKey> = [MXLKey(content: content1), MXLKey(content: content1), MXLKey(content: content2)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let content1 = MXLKey.Content.traditionalKey(MXLTraditionalKey(fifths: MXLFifths(intValue: 2)!))    // swiftlint:disable:this force_unwrapping
        let content2 = MXLKey.Content.traditionalKey(MXLTraditionalKey(fifths: MXLFifths(intValue: -2)!))    // swiftlint:disable:this force_unwrapping line_length

        #expect(MXLKey(content: content1) != MXLKey(content: content2))
    }

    @Test
    func init_defaultValues() {
        let content = MXLKey.Content.traditionalKey(MXLTraditionalKey(fifths: MXLFifths(intValue: 2)!))    // swiftlint:disable:this force_unwrapping
        let value = MXLKey(content: content)

        #expect(value.color == nil)
        #expect(value.content == content)
        #expect(value.font == MXLFont())
        #expect(value.id == nil)
        #expect(value.number == nil)
        #expect(value.octave.isEmpty)
        #expect(value.position == MXLPosition())
        #expect(value.printsObject == nil)
    }

    @Test
    func init_explicitValues() {
        let content = MXLKey.Content.traditionalKey(MXLTraditionalKey(fifths: MXLFifths(intValue: 2)!))    // swiftlint:disable:this force_unwrapping
        let octave = [MXLKey.Octave(value: 4, number: 1)]
        let value = MXLKey(id: "key1",
                           content: content,
                           octave: octave,
                           number: MXLStaffNumber(uintValue: 1),
                           position: MXLPosition(defaultX: 10),
                           font: MXLFont(style: .italic),
                           color: MXLColor(stringValue: "#800080"),
                           printsObject: false)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.content == content)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.id == "key1")
        #expect(value.number == MXLStaffNumber(uintValue: 1))
        #expect(value.octave == octave)
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.printsObject == false)
    }
}
