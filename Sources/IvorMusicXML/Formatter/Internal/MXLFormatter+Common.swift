// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal func bendSoundAttributes(_ sound: MXLBendSound) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let accelerates = sound.accelerates {
            attributes.append((.accelerate, formatYesNo(accelerates)))
        }

        if let beats = sound.beats {
            attributes.append((.beats, formatDecimal(beats)))
        }

        if let firstBeat = sound.firstBeat {
            attributes.append((.firstBeat, formatDecimal(firstBeat)))
        }

        if let lastBeat = sound.lastBeat {
            attributes.append((.lastBeat, formatDecimal(lastBeat)))
        }

        return attributes
    }

    internal func colorAttributes(_ color: MXLColor?) -> [(MXLAttributeName, String)] {
        guard let color
        else { return [] }

        return [(.color, color.stringValue)]
    }

    internal func dashedFormattingAttributes(_ formatting: MXLDashedFormatting) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let dashLength = formatting.dashLength {
            attributes.append((.dashLength, formatDecimal(dashLength)))
        }

        if let spaceLength = formatting.spaceLength {
            attributes.append((.spaceLength, formatDecimal(spaceLength)))
        }

        return attributes
    }

    internal func elementPositionAttributes(_ elementPosition: MXLElementPosition) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let element = elementPosition.element {
            attributes.append((.element, element))
        }

        if let position = elementPosition.position {
            attributes.append((.position, String(position)))
        }

        return attributes
    }

    internal func fontAttributes(_ font: MXLFont) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let family = font.family {
            attributes.append((.fontFamily, family.joined(separator: ",")))
        }

        if let size = font.size {
            attributes.append((.fontSize, _formatFontSize(size)))
        }

        if let style = font.style {
            attributes.append((.fontStyle, _formatFontStyle(style)))
        }

        if let weight = font.weight {
            attributes.append((.fontWeight, _formatFontWeight(weight)))
        }

        return attributes
    }

    internal func formatAboveBelow(_ value: MXLAboveBelow) -> String {
        switch value {
        case .above:
            "above"

        case .below:
            "below"
        }
    }

    internal func formatDecimal(_ value: Double) -> String {
        String(value)
    }

    internal func formatLeftCenterRight(_ value: MXLLeftCenterRight) -> String {
        switch value {
        case .center:
            "center"

        case .left:
            "left"

        case .right:
            "right"
        }
    }

    internal func formatLeftRight(_ value: MXLLeftRight) -> String {
        switch value {
        case .left:
            "left"

        case .right:
            "right"
        }
    }

    internal func formatLineKind(_ value: MXLLineKind) -> String {
        switch value {
        case .dashed:
            "dashed"

        case .dotted:
            "dotted"

        case .solid:
            "solid"

        case .wavy:
            "wavy"
        }
    }

    internal func formatLineLength(_ value: MXLLineLength) -> String {
        switch value {
        case .long:
            "long"

        case .medium:
            "medium"

        case .short:
            "short"
        }
    }

    internal func formatLineShape(_ value: MXLLineShape) -> String {
        switch value {
        case .curved:
            "curved"

        case .straight:
            "straight"
        }
    }

    internal func formatNoteKindValue(_ value: MXLNoteKindValue) -> String {
        switch value {
        case .breve:
            "breve"

        case .eighth:
            "eighth"

        case .half:
            "half"

        case .long:
            "long"

        case .maxima:
            "maxima"

        case .n1024th:
            "1024th"

        case .n128th:
            "128th"

        case .n16th:
            "16th"

        case .n256th:
            "256th"

        case .n32nd:
            "32nd"

        case .n512th:
            "512th"

        case .n64th:
            "64th"

        case .quarter:
            "quarter"

        case .whole:
            "whole"
        }
    }

    internal func formatNumberOrNormal(_ value: MXLNumberOrNormal) -> String {
        switch value {
        case .normal:
            "normal"

        case let .number(number):
            formatDecimal(number)
        }
    }

    internal func formatOverUnder(_ value: MXLOverUnder) -> String {
        switch value {
        case .over:
            "over"

        case .under:
            "under"
        }
    }

    internal func formatRightLeftMiddle(_ value: MXLRightLeftMiddle) -> String {
        switch value {
        case .left:
            "left"

        case .middle:
            "middle"

        case .right:
            "right"
        }
    }

    internal func formatShowFrets(_ value: MXLShowFrets) -> String {
        switch value {
        case .letters:
            "letters"

        case .numbers:
            "numbers"
        }
    }

    internal func formatShowTuplet(_ value: MXLShowTuplet) -> String {
        switch value {
        case .actual:
            "actual"

        case .both:
            "both"

        case .neither:
            "none"
        }
    }

    internal func formatStartStop(_ value: MXLStartStop) -> String {
        switch value {
        case .start:
            "start"

        case .stop:
            "stop"
        }
    }

    internal func formatStartStopContinue(_ value: MXLStartStopContinue) -> String {
        switch value {
        case .continue:
            "continue"

        case .start:
            "start"

        case .stop:
            "stop"
        }
    }

    internal func formatStartStopDiscontinue(_ value: MXLStartStopDiscontinue) -> String {
        switch value {
        case .discontinue:
            "discontinue"

        case .start:
            "start"

        case .stop:
            "stop"
        }
    }

    internal func formatStartStopSingle(_ value: MXLStartStopSingle) -> String {
        switch value {
        case .single:
            "single"

        case .start:
            "start"

        case .stop:
            "stop"
        }
    }

    internal func formatStep(_ step: MXLStep) -> String {
        switch step {
        case .a:
            "A"

        case .b:
            "B"

        case .c:
            "C"

        case .d:
            "D"

        case .e:
            "E"

        case .f:
            "F"

        case .g:
            "G"
        }
    }

    internal func formatSymbolSize(_ value: MXLSymbolSize) -> String {
        switch value {
        case .cue:
            "cue"

        case .full:
            "full"

        case .graceCue:
            "grace-cue"

        case .large:
            "large"
        }
    }

    internal func formatSystemRelation(_ value: MXLSystemRelation) -> String {
        switch value {
        case .alsoTop:
            "also-top"

        case .onlyPart:
            "none"

        case .onlyTop:
            "only-top"
        }
    }

    internal func formatTimeOnly(_ value: MXLTimeOnly) -> String {
        value.map(String.init).joined(separator: ",")
    }

    internal func formatTopBottom(_ value: MXLTopBottom) -> String {
        switch value {
        case .bottom:
            "bottom"

        case .top:
            "top"
        }
    }

    internal func formatUpDown(_ value: MXLUpDown) -> String {
        switch value {
        case .down:
            "down"

        case .up:
            "up"
        }
    }

    internal func formatUprightInverted(_ value: MXLUprightInverted) -> String {
        switch value {
        case .inverted:
            "inverted"

        case .upright:
            "upright"
        }
    }

    internal func formatValign(_ value: MXLValign) -> String {
        switch value {
        case .baseline:
            "baseline"

        case .bottom:
            "bottom"

        case .middle:
            "middle"

        case .top:
            "top"
        }
    }

    internal func formatValignImage(_ value: MXLValignImage) -> String {
        switch value {
        case .bottom:
            "bottom"

        case .middle:
            "middle"

        case .top:
            "top"
        }
    }

    internal func formatWinged(_ value: MXLWinged) -> String {
        switch value {
        case .curved:
            "curved"

        case .doubleCurved:
            "double-curved"

        case .doubleStraight:
            "double-straight"

        case .straight:
            "straight"

        case .wingless:
            "none"
        }
    }

    internal func formatYesNo(_ value: Bool) -> String {
        value ? "yes" : "no"
    }

    internal func levelDisplayAttributes(_ display: MXLLevel.Display) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let hasParentheses = display.hasParentheses {
            attributes.append((.parentheses, formatYesNo(hasParentheses)))
        }

        if let hasBracket = display.hasBracket {
            attributes.append((.bracket, formatYesNo(hasBracket)))
        }

        if let size = display.size {
            attributes.append((.size, formatSymbolSize(size)))
        }

        return attributes
    }

    internal func positionAttributes(_ position: MXLPosition) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let defaultX = position.defaultX {
            attributes.append((.defaultX, formatDecimal(defaultX)))
        }

        if let defaultY = position.defaultY {
            attributes.append((.defaultY, formatDecimal(defaultY)))
        }

        if let relativeX = position.relativeX {
            attributes.append((.relativeX, formatDecimal(relativeX)))
        }

        if let relativeY = position.relativeY {
            attributes.append((.relativeY, formatDecimal(relativeY)))
        }

        return attributes
    }

    internal func printoutAttributes(_ printout: MXLPrintout) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let printsObject = printout.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        attributes.append((.printDot, formatYesNo(printout.printsDot)))

        if let printsSpacing = printout.printsSpacing {
            attributes.append((.printSpacing, formatYesNo(printsSpacing)))
        }

        attributes.append((.printLyric, formatYesNo(printout.printsLyric)))

        return attributes
    }

    internal func printStyleAttributes(_ printStyle: MXLPrintStyle) -> [(MXLAttributeName, String)] {
        var attributes = positionAttributes(printStyle.position)

        attributes += fontAttributes(printStyle.font)
        attributes += colorAttributes(printStyle.color)

        return attributes
    }

    internal func xPositionAttributes(_ position: MXLXPosition) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let defaultX = position.defaultX {
            attributes.append((.defaultX, formatDecimal(defaultX)))
        }

        if let defaultY = position.defaultY {
            attributes.append((.defaultY, formatDecimal(defaultY)))
        }

        if let relativeX = position.relativeX {
            attributes.append((.relativeX, formatDecimal(relativeX)))
        }

        if let relativeY = position.relativeY {
            attributes.append((.relativeY, formatDecimal(relativeY)))
        }

        return attributes
    }

    internal func yPositionAttributes(_ position: MXLYPosition) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let defaultX = position.defaultX {
            attributes.append((.defaultX, formatDecimal(defaultX)))
        }

        if let defaultY = position.defaultY {
            attributes.append((.defaultY, formatDecimal(defaultY)))
        }

        if let relativeX = position.relativeX {
            attributes.append((.relativeX, formatDecimal(relativeX)))
        }

        if let relativeY = position.relativeY {
            attributes.append((.relativeY, formatDecimal(relativeY)))
        }

        return attributes
    }

    // MARK: Private Instance Methods

    private func _formatCssFontSize(_ value: MXLCssFontSize) -> String {
        switch value {
        case .large:
            "large"

        case .medium:
            "medium"

        case .small:
            "small"

        case .xLarge:
            "x-large"

        case .xSmall:
            "x-small"

        case .xxLarge:
            "xx-large"

        case .xxSmall:
            "xx-small"
        }
    }

    private func _formatFontSize(_ value: MXLFont.Size) -> String {
        switch value {
        case let .css(css):
            _formatCssFontSize(css)

        case let .point(points):
            formatDecimal(points)
        }
    }

    private func _formatFontStyle(_ value: MXLFont.Style) -> String {
        switch value {
        case .italic:
            "italic"

        case .normal:
            "normal"
        }
    }

    private func _formatFontWeight(_ value: MXLFont.Weight) -> String {
        switch value {
        case .bold:
            "bold"

        case .normal:
            "normal"
        }
    }
}
