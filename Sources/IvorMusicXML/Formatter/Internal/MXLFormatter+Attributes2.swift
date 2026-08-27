// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeTranspose(_ transpose: MXLTranspose) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = transpose.id {
            attributes.append((.id, id))
        }

        if let number = transpose.number {
            attributes.append((.number, String(number.uintValue)))
        }

        openElement(.transpose,
                    attributes: attributes)
        writeTransposeContent(transpose.content)
        closeElement()
    }

    internal mutating func writeTransposeContent(_ content: MXLTranspose.Content) {
        if let diatonic = content.diatonic {
            writeTextElement(.diatonic, String(diatonic.intValue))
        }

        writeTextElement(.chromatic, formatDecimal(content.chromatic))

        if let octaveChange = content.octaveChange {
            writeTextElement(.octaveChange, String(octaveChange.intValue))
        }

        if let double = content.double {
            var attributes: [(MXLAttributeName, String)] = []

            if let isAbove = double.isAbove {
                attributes.append((.above, formatYesNo(isAbove)))
            }

            writeEmptyElement(.double,
                              attributes: attributes)
        }
    }

    internal mutating func writeTuning(_ tuning: MXLTuning) {
        writeTextElement(.tuningStep, formatStep(tuning.step))

        if let alter = tuning.alter {
            writeTextElement(.tuningAlter, formatDecimal(alter))
        }

        writeTextElement(.tuningOctave, String(tuning.octave.uintValue))
    }
}
