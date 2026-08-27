// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPrintTests {
}

// MARK: -

extension MXLPrintTests {
    @Test
    func equality() {
        #expect(MXLPrint(attributes: MXLPrint.Attributes()) == MXLPrint(attributes: MXLPrint.Attributes()))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLPrint> = [MXLPrint(attributes: MXLPrint.Attributes()),
                                     MXLPrint(attributes: MXLPrint.Attributes()),
                                     MXLPrint(id: "p2", attributes: MXLPrint.Attributes())]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPrint(attributes: MXLPrint.Attributes()) != MXLPrint(id: "p2", attributes: MXLPrint.Attributes()))
    }

    @Test
    func init_defaultValues() {
        let value = MXLPrint(attributes: MXLPrint.Attributes())

        #expect(value.attributes == MXLPrint.Attributes())
        #expect(value.id == nil)
        #expect(value.layout == MXLLayout())
        #expect(value.measureLayout == nil)
        #expect(value.measureNumbering == nil)
        #expect(value.partAbbreviationDisplay == nil)
        #expect(value.partNameDisplay == nil)
    }

    @Test
    func init_explicitValues() {
        let attributes = MXLPrint.Attributes(startsNewSystem: true)
        let layout = MXLLayout()
        let measureLayout = MXLMeasureLayout(measureDistance: 20)
        let measureNumbering = MXLMeasureNumbering(value: .system)
        let partNameDisplay = MXLNameDisplay()
        let partAbbreviationDisplay = MXLNameDisplay(printsObject: false)
        let value = MXLPrint(id: "p1",
                             layout: layout,
                             measureLayout: measureLayout,
                             measureNumbering: measureNumbering,
                             partNameDisplay: partNameDisplay,
                             partAbbreviationDisplay: partAbbreviationDisplay,
                             attributes: attributes)

        #expect(value.attributes == attributes)
        #expect(value.id == "p1")
        #expect(value.layout == layout)
        #expect(value.measureLayout == measureLayout)
        #expect(value.measureNumbering == measureNumbering)
        #expect(value.partAbbreviationDisplay == partAbbreviationDisplay)
        #expect(value.partNameDisplay == partNameDisplay)
    }
}
