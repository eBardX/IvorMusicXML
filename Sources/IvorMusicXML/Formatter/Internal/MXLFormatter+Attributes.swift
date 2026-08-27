// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeAttributes(_ attributes: MXLAttributes) {
        openElement(.attributes)

        // The editorial footnote and level elements are written in a later phase.

        if let divisions = attributes.divisions {
            writeTextElement(.divisions, String(divisions.intValue))
        }

        for key in attributes.key {
            writeKey(key)
        }

        for time in attributes.time {
            writeTime(time)
        }

        if let staves = attributes.staves {
            writeTextElement(.staves, String(staves))
        }

        // The part-symbol element is written in a later phase.

        if let instruments = attributes.instruments {
            writeTextElement(.instruments, String(instruments))
        }

        for clef in attributes.clef {
            writeClef(clef)
        }

        for staffDetails in attributes.staffDetails {
            writeStaffDetails(staffDetails)
        }

        writeAttributesContent(attributes.content)

        for directive in attributes.directive {
            writeAttributesDirective(directive)
        }

        for measureStyle in attributes.measureStyle {
            writeMeasureStyle(measureStyle)
        }

        closeElement()
    }

    internal mutating func writeAttributesContent(_ content: MXLAttributes.Content) {
        switch content {
        case let .forPart(forParts):
            for forPart in forParts {
                writeForPart(forPart)
            }

        case let .transpose(transposes):
            for transpose in transposes {
                writeTranspose(transpose)
            }
        }
    }

    internal mutating func writeAttributesDirective(_ directive: MXLAttributes.Directive) {
        var attributes = positionAttributes(directive.position)

        attributes += fontAttributes(directive.font)
        attributes += colorAttributes(directive.color)

        if let xmlLang = directive.xmlLang {
            attributes.append((.xmlLang, xmlLang))
        }

        writeTextElement(.directive,
                         directive.value,
                         attributes: attributes)
    }

    internal mutating func writeBeatRepeat(_ beatRepeat: MXLBeatRepeat) {
        var attributes: [(MXLAttributeName, String)] = [(.type, formatStartStop(beatRepeat.kind))]

        if let slashes = beatRepeat.slashes {
            attributes.append((.slashes, String(slashes)))
        }

        if let usesDots = beatRepeat.usesDots {
            attributes.append((.useDots, formatYesNo(usesDots)))
        }

        guard let slashContent = beatRepeat.slashContent
        else {
            writeEmptyElement(.beatRepeat,
                              attributes: attributes)

            return
        }

        openElement(.beatRepeat,
                    attributes: attributes)
        writeSlashContent(slashContent)
        closeElement()
    }

    internal mutating func writeCancel(_ cancel: MXLCancel) {
        var attributes: [(MXLAttributeName, String)] = []

        if let location = cancel.location {
            attributes.append((.location, _formatCancelLocation(location)))
        }

        writeTextElement(.cancel,
                         String(cancel.value),
                         attributes: attributes)
    }

    internal mutating func writeClef(_ clef: MXLClef) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = clef.id {
            attributes.append((.id, id))
        }

        if let number = clef.number {
            attributes.append((.number, String(number.uintValue)))
        }

        if let isAdditional = clef.isAdditional {
            attributes.append((.additional, formatYesNo(isAdditional)))
        }

        if let size = clef.size {
            attributes.append((.size, formatSymbolSize(size)))
        }

        if let isAfterBarline = clef.isAfterBarline {
            attributes.append((.afterBarline, formatYesNo(isAfterBarline)))
        }

        attributes += positionAttributes(clef.position)
        attributes += fontAttributes(clef.font)
        attributes += colorAttributes(clef.color)

        if let printsObject = clef.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        openElement(.clef,
                    attributes: attributes)
        writeClefContent(clef.content)
        closeElement()
    }

    internal mutating func writeClefContent(_ content: MXLClef.Content) {
        writeTextElement(.sign, _formatClefSign(content.sign))

        if let line = content.line {
            writeTextElement(.line, String(line.intValue))
        }

        if let octaveChange = content.octaveChange {
            writeTextElement(.clefOctaveChange, String(octaveChange.intValue))
        }
    }

    internal mutating func writeForPart(_ forPart: MXLForPart) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = forPart.id {
            attributes.append((.id, id))
        }

        if let number = forPart.number {
            attributes.append((.number, String(number.uintValue)))
        }

        openElement(.forPart,
                    attributes: attributes)

        if let clef = forPart.clef {
            openElement(.partClef)
            writeClefContent(clef)
            closeElement()
        }

        openElement(.partTranspose)
        writeTransposeContent(forPart.transpose)
        closeElement()

        closeElement()
    }

    internal mutating func writeInterchangeable(_ interchangeable: MXLInterchangeable) {
        var attributes: [(MXLAttributeName, String)] = []

        if let symbol = interchangeable.symbol {
            attributes.append((.symbol, _formatTimeSymbol(symbol)))
        }

        attributes.append((.separator, _formatTimeSeparator(interchangeable.separator)))

        openElement(.interchangeable,
                    attributes: attributes)

        if let timeRelation = interchangeable.timeRelation {
            writeTextElement(.timeRelation, _formatTimeRelation(timeRelation))
        }

        for signature in interchangeable.timeSignature {
            writeTextElement(.beats, signature.beats)
            writeTextElement(.beatType, signature.beatType)
        }

        closeElement()
    }

    internal mutating func writeKey(_ key: MXLKey) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = key.id {
            attributes.append((.id, id))
        }

        if let number = key.number {
            attributes.append((.number, String(number.uintValue)))
        }

        attributes += positionAttributes(key.position)
        attributes += fontAttributes(key.font)
        attributes += colorAttributes(key.color)

        if let printsObject = key.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        openElement(.key,
                    attributes: attributes)
        writeKeyContent(key.content)

        for octave in key.octave {
            writeKeyOctave(octave)
        }

        closeElement()
    }

    internal mutating func writeKeyAccidental(_ accidental: MXLKeyAccidental) {
        var attributes: [(MXLAttributeName, String)] = []

        if let smufl = accidental.smufl {
            attributes.append((.smufl, smufl.stringValue))
        }

        writeTextElement(.keyAccidental,
                         formatAccidentalValue(accidental.value),
                         attributes: attributes)
    }

    internal mutating func writeKeyContent(_ content: MXLKey.Content) {
        switch content {
        case let .nonTraditionalKey(nonTraditionalKey):
            writeNonTraditionalKey(nonTraditionalKey)

        case let .traditionalKey(traditionalKey):
            if let cancel = traditionalKey.cancel {
                writeCancel(cancel)
            }

            writeTextElement(.fifths, String(traditionalKey.fifths.intValue))

            if let mode = traditionalKey.mode {
                writeTextElement(.mode, mode)
            }
        }
    }

    internal mutating func writeKeyOctave(_ octave: MXLKey.Octave) {
        var attributes: [(MXLAttributeName, String)] = [(.number, String(octave.number))]

        if let isCancelling = octave.isCancelling {
            attributes.append((.cancel, formatYesNo(isCancelling)))
        }

        writeTextElement(.keyOctave,
                         String(octave.value),
                         attributes: attributes)
    }

    internal mutating func writeLineDetail(_ lineDetail: MXLLineDetail) {
        var attributes: [(MXLAttributeName, String)] = [(.line, String(lineDetail.line.uintValue))]

        if let width = lineDetail.width {
            attributes.append((.width, formatDecimal(width)))
        }

        attributes += colorAttributes(lineDetail.color)

        if let lineKind = lineDetail.lineKind {
            attributes.append((.lineType, formatLineKind(lineKind)))
        }

        if let printsObject = lineDetail.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        writeEmptyElement(.lineDetail,
                          attributes: attributes)
    }

    internal mutating func writeMeasureRepeat(_ measureRepeat: MXLMeasureRepeat) {
        var attributes: [(MXLAttributeName, String)] = [(.type, formatStartStop(measureRepeat.kind))]

        if let slashes = measureRepeat.slashes {
            attributes.append((.slashes, String(slashes)))
        }

        guard let value = measureRepeat.value
        else {
            writeEmptyElement(.measureRepeat,
                              attributes: attributes)

            return
        }

        writeTextElement(.measureRepeat,
                         String(value),
                         attributes: attributes)
    }

    internal mutating func writeMeasureStyle(_ measureStyle: MXLMeasureStyle) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = measureStyle.id {
            attributes.append((.id, id))
        }

        if let number = measureStyle.number {
            attributes.append((.number, String(number.uintValue)))
        }

        attributes += fontAttributes(measureStyle.font)
        attributes += colorAttributes(measureStyle.color)

        openElement(.measureStyle,
                    attributes: attributes)
        writeMeasureStyleContent(measureStyle.content)
        closeElement()
    }

    internal mutating func writeMeasureStyleContent(_ content: MXLMeasureStyle.Content) {
        switch content {
        case let .beatRepeat(beatRepeat):
            writeBeatRepeat(beatRepeat)

        case let .measureRepeat(measureRepeat):
            writeMeasureRepeat(measureRepeat)

        case let .multipleRest(multipleRest):
            writeMultipleRest(multipleRest)

        case let .slash(slash):
            writeSlash(slash)
        }
    }

    internal mutating func writeMultipleRest(_ multipleRest: MXLMultipleRest) {
        let attributes: [(MXLAttributeName, String)] = [(.useSymbols, formatYesNo(multipleRest.usesSymbols))]

        writeTextElement(.multipleRest,
                         String(multipleRest.value),
                         attributes: attributes)
    }

    internal mutating func writeNonTraditionalKey(_ nonTraditionalKey: MXLNonTraditionalKey) {
        writeTextElement(.keyStep, formatStep(nonTraditionalKey.step))
        writeTextElement(.keyAlter, formatDecimal(nonTraditionalKey.alter))

        if let accidental = nonTraditionalKey.accidental {
            writeKeyAccidental(accidental)
        }
    }

    internal mutating func writeSlash(_ slash: MXLSlash) {
        var attributes: [(MXLAttributeName, String)] = [(.type, formatStartStop(slash.kind))]

        if let usesDots = slash.usesDots {
            attributes.append((.useDots, formatYesNo(usesDots)))
        }

        attributes.append((.useStems, formatYesNo(slash.usesStems)))

        guard let content = slash.content
        else {
            writeEmptyElement(.slash,
                              attributes: attributes)

            return
        }

        openElement(.slash,
                    attributes: attributes)
        writeSlashContent(content)
        closeElement()
    }

    internal mutating func writeSlashContent(_ content: MXLSlashContent) {
        if let group = content.group {
            writeTextElement(.slashType, formatNoteKindValue(group.slashKind))

            for _ in 0..<group.slashDot {
                writeEmptyElement(.slashDot)
            }
        }

        for voice in content.exceptVoice {
            writeTextElement(.exceptVoice, voice)
        }
    }

    internal mutating func writeStaffDetails(_ staffDetails: MXLStaffDetails) {
        var attributes: [(MXLAttributeName, String)] = []

        if let number = staffDetails.number {
            attributes.append((.number, String(number.uintValue)))
        }

        attributes.append((.showFrets, formatShowFrets(staffDetails.showFrets)))

        if let printsObject = staffDetails.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        if let printsSpacing = staffDetails.printsSpacing {
            attributes.append((.printSpacing, formatYesNo(printsSpacing)))
        }

        openElement(.staffDetails,
                    attributes: attributes)

        if let staffKind = staffDetails.staffKind {
            writeTextElement(.staffType, _formatStaffDetailsKind(staffKind))
        }

        if let group = staffDetails.group {
            writeStaffDetailsGroup(group)
        }

        for staffTuning in staffDetails.staffTuning {
            writeStaffTuning(staffTuning)
        }

        if let capo = staffDetails.capo {
            writeTextElement(.capo, String(capo))
        }

        if let staffSize = staffDetails.staffSize {
            writeStaffSize(staffSize)
        }

        closeElement()
    }

    internal mutating func writeStaffDetailsGroup(_ group: MXLStaffDetails.Group) {
        writeTextElement(.staffLines, String(group.staffLines))

        for lineDetail in group.lineDetail {
            writeLineDetail(lineDetail)
        }
    }

    internal mutating func writeStaffSize(_ staffSize: MXLStaffSize) {
        var attributes: [(MXLAttributeName, String)] = []

        if let scaling = staffSize.scaling {
            attributes.append((.scaling, formatDecimal(scaling)))
        }

        writeTextElement(.staffSize,
                         formatDecimal(staffSize.value),
                         attributes: attributes)
    }

    internal mutating func writeStaffTuning(_ staffTuning: MXLStaffTuning) {
        openElement(.staffTuning,
                    attributes: [(.line, String(staffTuning.line.uintValue))])
        writeTuning(staffTuning.tuning)
        closeElement()
    }

    internal mutating func writeTime(_ time: MXLTime) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = time.id {
            attributes.append((.id, id))
        }

        if let number = time.number {
            attributes.append((.number, String(number.uintValue)))
        }

        if let symbol = time.symbol {
            attributes.append((.symbol, _formatTimeSymbol(symbol)))
        }

        attributes.append((.separator, _formatTimeSeparator(time.separator)))

        attributes += positionAttributes(time.position)
        attributes += fontAttributes(time.font)
        attributes += colorAttributes(time.color)

        if let halign = time.halign {
            attributes.append((.halign, formatLeftCenterRight(halign)))
        }

        if let valign = time.valign {
            attributes.append((.valign, formatValign(valign)))
        }

        if let printsObject = time.printsObject {
            attributes.append((.printObject, formatYesNo(printsObject)))
        }

        openElement(.time,
                    attributes: attributes)
        writeTimeContent(time.content)
        closeElement()
    }

    internal mutating func writeTimeContent(_ content: MXLTime.Content) {
        switch content {
        case let .senzaMisura(value):
            writeTextElement(.senzaMisura, value)

        case let .timeSignature(signatures, interchangeable):
            for signature in signatures {
                writeTextElement(.beats, signature.beats)
                writeTextElement(.beatType, signature.beatType)
            }

            if let interchangeable {
                writeInterchangeable(interchangeable)
            }
        }
    }

    // MARK: Private Instance Methods

    private func _formatCancelLocation(_ value: MXLCancel.Location) -> String {
        switch value {
        case .beforeBarline:
            "before-barline"

        case .left:
            "left"

        case .right:
            "right"
        }
    }

    private func _formatClefSign(_ value: MXLClef.Sign) -> String {
        switch value {
        case .c:
            "C"

        case .f:
            "F"

        case .g:
            "G"

        case .invisible:
            "none"

        case .jianpu:
            "jianpu"

        case .percussion:
            "percussion"

        case .tAB:
            "TAB"
        }
    }

    private func _formatStaffDetailsKind(_ value: MXLStaffDetails.Kind) -> String {
        switch value {
        case .alternate:
            "alternate"

        case .cue:
            "cue"

        case .editorial:
            "editorial"

        case .ossia:
            "ossia"

        case .regular:
            "regular"
        }
    }

    private func _formatTimeRelation(_ value: MXLTimeRelation) -> String {
        switch value {
        case .bracket:
            "bracket"

        case .equals:
            "equals"

        case .hyphen:
            "hyphen"

        case .parentheses:
            "parentheses"

        case .slash:
            "slash"

        case .space:
            "space"
        }
    }

    private func _formatTimeSeparator(_ value: MXLTimeSeparator) -> String {
        switch value {
        case .adjacent:
            "adjacent"

        case .diagonal:
            "diagonal"

        case .horizontal:
            "horizontal"

        case .stacked:
            "none"

        case .vertical:
            "vertical"
        }
    }

    private func _formatTimeSymbol(_ value: MXLTimeSymbol) -> String {
        switch value {
        case .common:
            "common"

        case .cut:
            "cut"

        case .dottedNote:
            "dotted-note"

        case .normal:
            "normal"

        case .note:
            "note"

        case .singleNumber:
            "single-number"
        }
    }
}
