// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal func formatAccidentalValue(_ value: MXLAccidentalValue) -> String {
        switch value {
        case .arrowDown:
            "arrow-down"

        case .arrowUp:
            "arrow-up"

        case .doubleSharp:
            "double-sharp"

        case .doubleSharpDown:
            "double-sharp-down"

        case .doubleSharpUp:
            "double-sharp-up"

        case .doubleSlashFlat:
            "double-slash-flat"

        case .flat:
            "flat"

        case .flat1:
            "flat-1"

        case .flat2:
            "flat-2"

        case .flat3:
            "flat-3"

        case .flat4:
            "flat-4"

        case .flatDown:
            "flat-down"

        case .flatFlat:
            "flat-flat"

        case .flatFlatDown:
            "flat-flat-down"

        case .flatFlatUp:
            "flat-flat-up"

        case .flatUp:
            "flat-up"

        case .koron:
            "koron"

        case .natural:
            "natural"

        case .naturalDown:
            "natural-down"

        case .naturalFlat:
            "natural-flat"

        case .naturalSharp:
            "natural-sharp"

        case .naturalUp:
            "natural-up"

        case .other:
            "other"

        case .quarterFlat:
            "quarter-flat"

        case .quarterSharp:
            "quarter-sharp"

        case .sharp:
            "sharp"

        case .sharp1:
            "sharp-1"

        case .sharp2:
            "sharp-2"

        case .sharp3:
            "sharp-3"

        case .sharp5:
            "sharp-5"

        case .sharpDown:
            "sharp-down"

        case .sharpSharp:
            "sharp-sharp"

        case .sharpUp:
            "sharp-up"

        case .slashFlat:
            "slash-flat"

        case .slashQuarterSharp:
            "slash-quarter-sharp"

        case .slashSharp:
            "slash-sharp"

        case .sori:
            "sori"

        case .threeQuartersFlat:
            "three-quarters-flat"

        case .threeQuartersSharp:
            "three-quarters-sharp"

        case .tripleFlat:
            "triple-flat"

        case .tripleSharp:
            "triple-sharp"
        }
    }

    internal func formatEnclosureShape(_ value: MXLEnclosureShape) -> String {
        switch value {
        case .bracket:
            "bracket"

        case .circle:
            "circle"

        case .decagon:
            "decagon"

        case .diamond:
            "diamond"

        case .heptagon:
            "heptagon"

        case .hexagon:
            "hexagon"

        case .invertedBracket:
            "inverted-bracket"

        case .nonagon:
            "nonagon"

        case .octagon:
            "octagon"

        case .oval:
            "oval"

        case .pentagon:
            "pentagon"

        case .rectangle:
            "rectangle"

        case .square:
            "square"

        case .triangle:
            "triangle"

        case .unenclosed:
            "none"
        }
    }

    internal func formatLineEnd(_ value: MXLLineEnd) -> String {
        switch value {
        case .arrow:
            "arrow"

        case .both:
            "both"

        case .down:
            "down"

        case .plain:
            "none"

        case .up:
            "up"
        }
    }

    internal func formatTextDirection(_ value: MXLTextDirection) -> String {
        switch value {
        case .lro:
            "lro"

        case .ltr:
            "ltr"

        case .rlo:
            "rlo"

        case .rtl:
            "rtl"
        }
    }

    internal func formatUpDownStopContinue(_ value: MXLUpDownStopContinue) -> String {
        switch value {
        case .continue:
            "continue"

        case .down:
            "down"

        case .stop:
            "stop"

        case .up:
            "up"
        }
    }

    internal func formatXmlSpace(_ value: MXLXmlSpace) -> String {
        switch value {
        case .default:
            "default"

        case .preserve:
            "preserve"
        }
    }

    internal func formatYesNoNumber(_ value: MXLYesNoNumber) -> String {
        switch value {
        case .no:
            "no"

        case let .number(number):
            formatDecimal(number)

        case .yes:
            "yes"
        }
    }

    internal func printStyleAlignAttributes(_ printStyleAlign: MXLPrintStyleAlign) -> [(MXLAttributeName, String)] {
        var attributes = printStyleAttributes(printStyleAlign.printStyle)

        if let halign = printStyleAlign.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = printStyleAlign.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        return attributes
    }

    internal func textDecorationAttributes(_ underline: MXLNumberOfLines?,
                                           _ overline: MXLNumberOfLines?,
                                           _ lineThrough: MXLNumberOfLines?) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let underline {
            attributes.append((.underline, String(underline.uintValue)))
        }

        if let overline {
            attributes.append((.overline, String(overline.uintValue)))
        }

        if let lineThrough {
            attributes.append((.lineThrough, String(lineThrough.uintValue)))
        }

        return attributes
    }

    internal mutating func writeEmptyLine(_ name: MXLElementName,
                                          _ line: MXLEmptyLine) {
        var attributes: [(MXLAttributeName, String)] = []

        if let shape = line.shape {
            attributes.append((.lineShape, formatLineShape(shape)))
        }

        if let kind = line.kind {
            attributes.append((.lineType, formatLineKind(kind)))
        }

        if let length = line.length {
            attributes.append((.lineLength, formatLineLength(length)))
        }

        attributes += dashedFormattingAttributes(line.dashedFormatting)
        attributes += printStyleAttributes(line.printStyle)

        if let placement = line.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        writeEmptyElement(name,
                          attributes: attributes)
    }

    internal mutating func writeEmptyPrintStyleAlignID(_ name: MXLElementName,
                                                       _ value: MXLEmptyPrintStyleAlignID) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = value.id {
            attributes.append((.id, id))
        }

        attributes += printStyleAlignAttributes(value.printStyleAlign)

        writeEmptyElement(name,
                          attributes: attributes)
    }

    internal mutating func writeFormattedSymbolID(_ name: MXLElementName,
                                                  _ text: MXLFormattedSymbolID) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = text.id {
            attributes.append((.id, id))
        }

        if let justify = text.justify {
            attributes.append((.justify, formatLeftCenterRight(justify)))
        }

        attributes += positionAttributes(text.position)
        attributes += fontAttributes(text.font)
        attributes += colorAttributes(text.color)

        if let halign = text.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = text.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        attributes += textDecorationAttributes(text.underline, text.overline, text.lineThrough)

        if let rotation = text.rotation {
            attributes.append((.rotation, formatDecimal(rotation)))
        }

        attributes.append((.letterSpacing, formatNumberOrNormal(text.letterSpacing)))
        attributes.append((.lineHeight, formatNumberOrNormal(text.lineHeight)))
        attributes.append((.dir, formatTextDirection(text.dir)))

        if let enclosure = text.enclosure {
            attributes.append((.enclosure, formatEnclosureShape(enclosure)))
        }

        writeTextElement(name,
                         text.value,
                         attributes: attributes)
    }

    internal mutating func writeFormattedText(_ name: MXLElementName,
                                              _ text: MXLFormattedText) {
        var attributes: [(MXLAttributeName, String)] = []

        if let justify = text.justify {
            attributes.append((.justify, formatLeftCenterRight(justify)))
        }

        attributes += positionAttributes(text.position)
        attributes += fontAttributes(text.font)
        attributes += colorAttributes(text.color)

        if let halign = text.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = text.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        attributes += textDecorationAttributes(text.underline, text.overline, text.lineThrough)

        if let rotation = text.rotation {
            attributes.append((.rotation, formatDecimal(rotation)))
        }

        attributes.append((.letterSpacing, formatNumberOrNormal(text.letterSpacing)))
        attributes.append((.lineHeight, formatNumberOrNormal(text.lineHeight)))

        if let xmlLang = text.xmlLang {
            attributes.append((.xmlLang, xmlLang))
        }

        if let xmlSpace = text.xmlSpace {
            attributes.append((.xmlSpace, formatXmlSpace(xmlSpace)))
        }

        attributes.append((.dir, formatTextDirection(text.dir)))

        if let enclosure = text.enclosure {
            attributes.append((.enclosure, formatEnclosureShape(enclosure)))
        }

        writeTextElement(name,
                         text.value,
                         attributes: attributes)
    }

    internal mutating func writeFormattedTextID(_ name: MXLElementName,
                                                _ text: MXLFormattedTextID) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = text.id {
            attributes.append((.id, id))
        }

        if let justify = text.justify {
            attributes.append((.justify, formatLeftCenterRight(justify)))
        }

        attributes += positionAttributes(text.position)
        attributes += fontAttributes(text.font)
        attributes += colorAttributes(text.color)

        if let halign = text.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = text.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        attributes += textDecorationAttributes(text.underline, text.overline, text.lineThrough)

        if let rotation = text.rotation {
            attributes.append((.rotation, formatDecimal(rotation)))
        }

        attributes.append((.letterSpacing, formatNumberOrNormal(text.letterSpacing)))
        attributes.append((.lineHeight, formatNumberOrNormal(text.lineHeight)))

        if let xmlLang = text.xmlLang {
            attributes.append((.xmlLang, xmlLang))
        }

        if let xmlSpace = text.xmlSpace {
            attributes.append((.xmlSpace, formatXmlSpace(xmlSpace)))
        }

        attributes.append((.dir, formatTextDirection(text.dir)))

        if let enclosure = text.enclosure {
            attributes.append((.enclosure, formatEnclosureShape(enclosure)))
        }

        writeTextElement(name,
                         text.value,
                         attributes: attributes)
    }

    internal mutating func writeImage(_ name: MXLElementName,
                                      _ image: MXLImage) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = image.id {
            attributes.append((.id, id))
        }

        attributes.append((.source, image.attributes.source))
        attributes.append((.type, image.attributes.kind))

        if let height = image.attributes.height {
            attributes.append((.height, formatDecimal(height)))
        }

        if let width = image.attributes.width {
            attributes.append((.width, formatDecimal(width)))
        }

        attributes += positionAttributes(image.attributes.position)

        if let halign = image.attributes.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = image.attributes.valign {
            attributes.append((.valign, formatValignImage(valign)))
        }

        writeEmptyElement(name,
                          attributes: attributes)
    }

    internal mutating func writeOtherPlacementText(_ name: MXLElementName,
                                                   _ text: MXLOtherPlacementText) {
        var attributes = printStyleAttributes(text.printStyle)

        if let placement = text.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        if let smufl = text.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(name,
                         text.value,
                         attributes: attributes)
    }

    internal mutating func writePlacementStyle(_ name: MXLElementName,
                                               position: MXLPosition,
                                               font: MXLFont,
                                               color: MXLColor?,
                                               placement: MXLAboveBelow?,
                                               smufl: MXLSmuflGlyphName? = nil) {
        var attributes = positionAttributes(position)

        attributes += fontAttributes(font)
        attributes += colorAttributes(color)

        if let placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        if let smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeEmptyElement(name,
                          attributes: attributes)
    }

    internal mutating func writePlacementText(_ name: MXLElementName,
                                              _ text: MXLPlacementText) {
        var attributes = printStyleAttributes(text.printStyle)

        if let placement = text.placement {
            attributes.append((.placement, formatAboveBelow(placement)))
        }

        writeTextElement(name,
                         text.value,
                         attributes: attributes)
    }

    internal mutating func writeStyleText(_ name: MXLElementName,
                                          _ text: MXLStyleText) {
        writeTextElement(name,
                         text.value,
                         attributes: printStyleAttributes(text.printStyle))
    }

    internal mutating func writeTextElementData(_ name: MXLElementName,
                                                _ text: MXLTextElementData) {
        var attributes = fontAttributes(text.font)

        attributes += colorAttributes(text.color)

        if let underline = text.underline {
            attributes.append((.underline, String(underline.uintValue)))
        }

        if let overline = text.overline {
            attributes.append((.overline, String(overline.uintValue)))
        }

        if let lineThrough = text.lineThrough {
            attributes.append((.lineThrough, String(lineThrough.uintValue)))
        }

        if let rotation = text.rotation {
            attributes.append((.rotation, formatDecimal(rotation)))
        }

        attributes.append((.letterSpacing, formatNumberOrNormal(text.letterSpacing)))

        if let xmlLang = text.xmlLang {
            attributes.append((.xmlLang, xmlLang))
        }

        attributes.append((.dir, formatTextDirection(text.dir)))

        writeTextElement(name,
                         text.value,
                         attributes: attributes)
    }

    internal mutating func writeTypedText(_ name: MXLElementName,
                                          _ text: MXLTypedText) {
        var attributes: [(MXLAttributeName, String)] = []

        if let kind = text.kind {
            attributes.append((.type, kind))
        }

        writeTextElement(name,
                         text.value,
                         attributes: attributes)
    }
}
