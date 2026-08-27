// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTimeTests {
}

// MARK: -

extension MXLTimeTests {
    @Test
    func equality() {
        let content = MXLTime.Content.timeSignature([MXLTimeSignature(beats: "4", beatType: "4")],
                                                    interchangeable: nil)

        #expect(MXLTime(content: content) == MXLTime(content: content))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let content1 = MXLTime.Content.timeSignature([MXLTimeSignature(beats: "4", beatType: "4")],
                                                     interchangeable: nil)
        let content2 = MXLTime.Content.senzaMisura("X")
        let values: Set<MXLTime> = [MXLTime(content: content1), MXLTime(content: content1), MXLTime(content: content2)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let content1 = MXLTime.Content.timeSignature([MXLTimeSignature(beats: "4", beatType: "4")],
                                                     interchangeable: nil)
        let content2 = MXLTime.Content.senzaMisura("X")

        #expect(MXLTime(content: content1) != MXLTime(content: content2))
    }

    @Test
    func init_defaultValues() {
        let content = MXLTime.Content.timeSignature([MXLTimeSignature(beats: "4", beatType: "4")],
                                                    interchangeable: nil)
        let value = MXLTime(content: content)

        #expect(value.color == nil)
        #expect(value.content == content)
        #expect(value.font == MXLFont())
        #expect(value.halign == nil)
        #expect(value.id == nil)
        #expect(value.number == nil)
        #expect(value.position == MXLPosition())
        #expect(value.printsObject == nil)
        #expect(value.separator == .stacked)
        #expect(value.symbol == nil)
        #expect(value.valign == nil)
    }

    @Test
    func init_explicitValues() {
        let content = MXLTime.Content.timeSignature([MXLTimeSignature(beats: "4", beatType: "4")],
                                                    interchangeable: nil)
        let value = MXLTime(id: "time1",
                            content: content,
                            number: MXLStaffNumber(uintValue: 1),
                            symbol: .common,
                            separator: .vertical,
                            position: MXLPosition(defaultX: 10),
                            font: MXLFont(style: .italic),
                            color: MXLColor(stringValue: "#800080"),
                            halign: .center,
                            valign: .middle,
                            printsObject: false)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.content == content)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.halign == .center)
        #expect(value.id == "time1")
        #expect(value.number == MXLStaffNumber(uintValue: 1))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.printsObject == false)
        #expect(value.separator == .vertical)
        #expect(value.symbol == .common)
        #expect(value.valign == .middle)
    }
}
