// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeScorePartwise(_ score: MXLScorePartwise) {
        openElement(.scorePartwise,
                    attributes: [(.version, "\(score.version.major).\(score.version.minor)")])

        if let work = score.work {
            writeWork(work)
        }

        if let movementNumber = score.movementNumber {
            writeTextElement(.movementNumber, movementNumber)
        }

        if let movementTitle = score.movementTitle {
            writeTextElement(.movementTitle, movementTitle)
        }

        if let identification = score.identification {
            writeIdentification(identification)
        }

        if let defaults = score.defaults {
            writeDefaults(defaults)
        }

        for credit in score.credit {
            writeCredit(credit)
        }

        writePartList(score.partList)

        for part in score.parts {
            writeScorePartwisePart(part)
        }

        closeElement()
    }

    internal mutating func writeScorePartwisePart(_ part: MXLScorePartwise.Part) {
        openElement(.part,
                    attributes: [(.id, part.id)])

        for measure in part.measures {
            writeScorePartwisePartMeasure(measure)
        }

        closeElement()
    }

    internal mutating func writeScorePartwisePartMeasure(_ measure: MXLScorePartwise.Part.Measure) {
        var attributes: [(MXLAttributeName, String)] = [(.number, measure.number)]

        if let id = measure.id {
            attributes.append((.id, id))
        }

        if measure.isImplicit {
            attributes.append((.implicit, formatYesNo(measure.isImplicit)))
        }

        if measure.isNonControlling {
            attributes.append((.nonControlling, formatYesNo(measure.isNonControlling)))
        }

        if let text = measure.text {
            attributes.append((.text, text.stringValue))
        }

        if let width = measure.width {
            attributes.append((.width, formatDecimal(width)))
        }

        openElement(.measure,
                    attributes: attributes)

        writeMusicItems(measure.items)

        closeElement()
    }
}
