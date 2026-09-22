// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeAllMargins(_ allMargins: MXLAllMargins) {
        writeLeftRightMargins(allMargins.leftRightMargins)

        writeTextElement(.topMargin, formatDecimal(allMargins.topMargin))
        writeTextElement(.bottomMargin, formatDecimal(allMargins.bottomMargin))
    }

    internal mutating func writeAppearance(_ appearance: MXLAppearance) {
        openElement(.appearance)

        for lineWidth in appearance.lineWidth {
            writeLineWidth(lineWidth)
        }

        for noteSize in appearance.noteSize {
            writeNoteSize(noteSize)
        }

        for distance in appearance.distance {
            writeDistance(distance)
        }

        for glyph in appearance.glyph {
            writeGlyph(glyph)
        }

        for otherAppearance in appearance.otherAppearance {
            writeOtherAppearance(otherAppearance)
        }

        closeElement()
    }

    internal mutating func writeDistance(_ distance: MXLDistance) {
        writeTextElement(.distance,
                         formatDecimal(distance.value),
                         attributes: [(.type, distance.kind)])
    }

    internal mutating func writeGlyph(_ glyph: MXLGlyph) {
        writeTextElement(.glyph,
                         glyph.value,
                         attributes: [(.type, glyph.kind)])
    }

    internal mutating func writeLayout(_ layout: MXLLayout) {
        if let pageLayout = layout.pageLayout {
            writePageLayout(pageLayout)
        }

        if let systemLayout = layout.systemLayout {
            writeSystemLayout(systemLayout)
        }

        for staffLayout in layout.staffLayout {
            writeStaffLayout(staffLayout)
        }
    }

    internal mutating func writeLeftRightMargins(_ margins: MXLLeftRightMargins) {
        writeTextElement(.leftMargin, formatDecimal(margins.leftMargin))
        writeTextElement(.rightMargin, formatDecimal(margins.rightMargin))
    }

    internal mutating func writeLineWidth(_ lineWidth: MXLLineWidth) {
        writeTextElement(.lineWidth,
                         formatDecimal(lineWidth.value),
                         attributes: [(.type, lineWidth.kind)])
    }

    internal mutating func writeMeasureLayout(_ measureLayout: MXLMeasureLayout) {
        openElement(.measureLayout)

        if let measureDistance = measureLayout.measureDistance {
            writeTextElement(.measureDistance, formatDecimal(measureDistance))
        }

        closeElement()
    }

    internal mutating func writeMeasureNumbering(_ measureNumbering: MXLMeasureNumbering) {
        var attributes: [(MXLAttributeName, String)] = []

        if let system = measureNumbering.system {
            attributes.append((.system, _formatSystemRelationNumber(system)))
        }

        if let staff = measureNumbering.staff {
            attributes.append((.staff, String(staff.uintValue)))
        }

        if let alwaysShowsOnMultipleRest = measureNumbering.alwaysShowsOnMultipleRest {
            attributes.append((.multipleRestAlways, formatYesNo(alwaysShowsOnMultipleRest)))
        }

        if let showsRangeOnMultipleRest = measureNumbering.showsRangeOnMultipleRest {
            attributes.append((.multipleRestRange, formatYesNo(showsRangeOnMultipleRest)))
        }

        attributes += positionAttributes(measureNumbering.position)
        attributes += fontAttributes(measureNumbering.font)
        attributes += colorAttributes(measureNumbering.color)

        if let halign = measureNumbering.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = measureNumbering.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        writeTextElement(.measureNumbering,
                         _formatMeasureNumberingValue(measureNumbering.value),
                         attributes: attributes)
    }

    internal mutating func writeOtherAppearance(_ otherAppearance: MXLOtherAppearance) {
        writeTextElement(.otherAppearance,
                         otherAppearance.value,
                         attributes: [(.type, otherAppearance.kind)])
    }

    internal mutating func writePageLayout(_ pageLayout: MXLPageLayout) {
        openElement(.pageLayout)

        if let group = pageLayout.group {
            writeTextElement(.pageHeight, formatDecimal(group.pageHeight))
            writeTextElement(.pageWidth, formatDecimal(group.pageWidth))
        }

        for pageMargins in pageLayout.pageMargins {
            writePageMargins(pageMargins)
        }

        closeElement()
    }

    internal mutating func writePageMargins(_ pageMargins: MXLPageMargins) {
        openElement(.pageMargins,
                    attributes: [(.type, _formatPageMarginsKind(pageMargins.kind))])

        writeAllMargins(pageMargins.allMargins)

        closeElement()
    }

    internal mutating func writePrint(_ print: MXLPrint) {
        openElement(.print,
                    attributes: _printAttributes(print))

        writeLayout(print.layout)

        if let measureLayout = print.measureLayout {
            writeMeasureLayout(measureLayout)
        }

        if let measureNumbering = print.measureNumbering {
            writeMeasureNumbering(measureNumbering)
        }

        if let partNameDisplay = print.partNameDisplay {
            writeNameDisplay(.partNameDisplay, partNameDisplay)
        }

        if let partAbbreviationDisplay = print.partAbbreviationDisplay {
            writeNameDisplay(.partAbbreviationDisplay, partAbbreviationDisplay)
        }

        closeElement()
    }

    internal mutating func writeScaling(_ scaling: MXLScaling) {
        openElement(.scaling)

        writeTextElement(.millimeters, formatDecimal(scaling.millimeters))
        writeTextElement(.tenths, formatDecimal(scaling.tenths))

        closeElement()
    }

    internal mutating func writeStaffLayout(_ staffLayout: MXLStaffLayout) {
        var attributes: [(MXLAttributeName, String)] = []

        if let number = staffLayout.number {
            attributes.append((.number, String(number.uintValue)))
        }

        openElement(.staffLayout,
                    attributes: attributes)

        if let staffDistance = staffLayout.staffDistance {
            writeTextElement(.staffDistance, formatDecimal(staffDistance))
        }

        closeElement()
    }

    internal mutating func writeSystemDividers(_ systemDividers: MXLSystemDividers) {
        openElement(.systemDividers)

        writeEmptyElement(.leftDivider,
                          attributes: _emptyPrintObjectStyleAlignAttributes(systemDividers.leftDivider))
        writeEmptyElement(.rightDivider,
                          attributes: _emptyPrintObjectStyleAlignAttributes(systemDividers.rightDivider))

        closeElement()
    }

    internal mutating func writeSystemLayout(_ systemLayout: MXLSystemLayout) {
        openElement(.systemLayout)

        if let systemMargins = systemLayout.systemMargins {
            writeSystemMargins(systemMargins)
        }

        if let systemDistance = systemLayout.systemDistance {
            writeTextElement(.systemDistance, formatDecimal(systemDistance))
        }

        if let topSystemDistance = systemLayout.topSystemDistance {
            writeTextElement(.topSystemDistance, formatDecimal(topSystemDistance))
        }

        if let systemDividers = systemLayout.systemDividers {
            writeSystemDividers(systemDividers)
        }

        closeElement()
    }

    internal mutating func writeSystemMargins(_ systemMargins: MXLSystemMargins) {
        openElement(.systemMargins)

        writeLeftRightMargins(systemMargins.leftRightMargins)

        closeElement()
    }

    // MARK: Private Instance Methods

    private func _emptyPrintObjectStyleAlignAttributes(_ element: MXLEmptyPrintObjectStyleAlign) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let printsObject = element.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        attributes += printStyleAlignAttributes(element.printStyleAlign)

        return attributes
    }

    private func _formatMeasureNumberingValue(_ value: MXLMeasureNumbering.Value) -> String {
        switch value {
        case .measure:
            "measure"

        case .never:
            "none"

        case .system:
            "system"
        }
    }

    private func _formatPageMarginsKind(_ value: MXLPageMargins.Kind) -> String {
        switch value {
        case .both:
            "both"

        case .even:
            "even"

        case .odd:
            "odd"
        }
    }

    private func _formatSystemRelationNumber(_ value: MXLSystemRelationNumber) -> String {
        switch value {
        case .alsoBottom:
            "also-bottom"

        case .alsoTop:
            "also-top"

        case .onlyBottom:
            "only-bottom"

        case .onlyPart:
            "none"

        case .onlyTop:
            "only-top"
        }
    }

    private func _printAttributes(_ print: MXLPrint) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = print.id {
            attributes.append((.id, id))
        }

        if let staffSpacing = print.attributes.staffSpacing {
            attributes.append((.staffSpacing, formatDecimal(staffSpacing)))
        }

        if let startsNewSystem = print.attributes.startsNewSystem {
            attributes.append((.newSystem, formatYesNo(startsNewSystem)))
        }

        if let startsNewPage = print.attributes.startsNewPage {
            attributes.append((.newPage, formatYesNo(startsNewPage)))
        }

        if let blankPage = print.attributes.blankPage {
            attributes.append((.blankPage, String(blankPage)))
        }

        if let pageNumber = print.attributes.pageNumber {
            attributes.append((.pageNumber, pageNumber))
        }

        return attributes
    }
}
