// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLEndingTests {
}

// MARK: -

extension MXLEndingTests {
    @Test
    func equality() {
        #expect(MXLEnding(value: "1.", number: [1], kind: .start) ==    // swiftlint:disable:this identical_operands
                 MXLEnding(value: "1.", number: [1], kind: .start))
    }

    @Test
    func hashable() {
        let values: Set<MXLEnding> = [MXLEnding(value: "1.", number: [1], kind: .start),
                                      MXLEnding(value: "1.", number: [1], kind: .start),
                                      MXLEnding(value: "2.", number: [2], kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLEnding(value: "1.", number: [1], kind: .start) != MXLEnding(value: "2.", number: [2], kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let value = MXLEnding(value: "1.", number: [1], kind: .start)

        #expect(value.color == nil)
        #expect(value.endLength == nil)
        #expect(value.font == MXLFont())
        #expect(value.kind == .start)
        #expect(value.number == [1])
        #expect(value.position == MXLPosition())
        #expect(value.printsObject == nil)
        #expect(value.system == nil)
        #expect(value.textX == nil)
        #expect(value.textY == nil)
        #expect(value.value == "1.")
    }

    @Test
    func init_explicitValues() {
        let value = MXLEnding(value: "1.",
                              number: [1],
                              kind: .start,
                              printsObject: false,
                              position: MXLPosition(defaultX: 10),
                              font: MXLFont(style: .italic),
                              color: MXLColor(stringValue: "#800080"),
                              system: .onlyTop,
                              endLength: 10,
                              textX: 5,
                              textY: 5)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.endLength == 10)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.kind == .start)
        #expect(value.number == [1])
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.printsObject == false)
        #expect(value.system == .onlyTop)
        #expect(value.textX == 5)
        #expect(value.textY == 5)
        #expect(value.value == "1.")
    }
}
