// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSlideTests {
}

// MARK: -

extension MXLSlideTests {
    @Test
    func equality() {
        #expect(MXLSlide(value: "slide", kind: .start) == MXLSlide(value: "slide", kind: .start))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLSlide> = [MXLSlide(value: "slide", kind: .start),
                                     MXLSlide(value: "slide", kind: .start),
                                     MXLSlide(value: "slide", kind: .stop)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSlide(value: "slide", kind: .start) != MXLSlide(value: "slide", kind: .stop))
    }

    @Test
    func init_defaultValues() {
        let value = MXLSlide(value: "slide", kind: .start)

        #expect(value.bendSound == MXLBendSound())
        #expect(value.color == nil)
        #expect(value.dashLength == nil)
        #expect(value.font == MXLFont())
        #expect(value.id == nil)
        #expect(value.lineKind == nil)
        #expect(value.number == MXLNumberLevel(uintValue: 1))
        #expect(value.position == MXLPosition())
        #expect(value.spaceLength == nil)
        #expect(value.kind == .start)
        #expect(value.value == "slide")
    }

    @Test
    func init_explicitValues() {
        let bendSound = MXLBendSound(accelerates: true)
        let value = MXLSlide(id: "s1",
                             value: "slide",
                             kind: .stop,
                             number: MXLNumberLevel(uintValue: 2),
                             lineKind: .dashed,
                             dashLength: 4,
                             spaceLength: 2,
                             position: MXLPosition(defaultX: 10),
                             font: MXLFont(style: .italic),
                             color: MXLColor(stringValue: "#800080"),
                             bendSound: bendSound)

        #expect(value.bendSound == bendSound)
        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.dashLength == 4)
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.id == "s1")
        #expect(value.lineKind == .dashed)
        #expect(value.number == MXLNumberLevel(uintValue: 2))
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.spaceLength == 2)
        #expect(value.kind == .stop)
        #expect(value.value == "slide")
    }
}
