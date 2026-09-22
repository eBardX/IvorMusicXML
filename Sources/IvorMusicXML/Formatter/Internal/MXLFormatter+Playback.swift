// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeInstrumentChange(_ instrumentChange: MXLInstrumentChange) {
        writeEmptyElement(.instrumentChange,
                          attributes: [(.id, instrumentChange.id)])
    }

    internal mutating func writeMidiDevice(_ midiDevice: MXLMidiDevice) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = midiDevice.id {
            attributes.append((.id, id))
        }

        if let port = midiDevice.port {
            attributes.append((.port, String(port.uintValue)))
        }

        writeTextElement(.midiDevice,
                         midiDevice.value,
                         attributes: attributes)
    }

    internal mutating func writeMidiInstrument(_ midiInstrument: MXLMidiInstrument) {
        openElement(.midiInstrument,
                    attributes: [(.id, midiInstrument.id)])

        if let midiChannel = midiInstrument.midiChannel {
            writeTextElement(.midiChannel, String(midiChannel.uintValue))
        }

        if let midiName = midiInstrument.midiName {
            writeTextElement(.midiName, midiName)
        }

        if let midiBank = midiInstrument.midiBank {
            writeTextElement(.midiBank, String(midiBank.uintValue))
        }

        if let midiProgram = midiInstrument.midiProgram {
            writeTextElement(.midiProgram, String(midiProgram.uintValue))
        }

        if let midiUnpitched = midiInstrument.midiUnpitched {
            writeTextElement(.midiUnpitched, String(midiUnpitched.uintValue))
        }

        if let volume = midiInstrument.volume {
            writeTextElement(.volume, formatDecimal(volume))
        }

        if let pan = midiInstrument.pan {
            writeTextElement(.pan, formatDecimal(pan))
        }

        if let elevation = midiInstrument.elevation {
            writeTextElement(.elevation, formatDecimal(elevation))
        }

        closeElement()
    }

    internal mutating func writeSound(_ sound: MXLSound) {
        openElement(.sound,
                    attributes: _soundAttributes(sound))

        writeSoundGroups(sound.group)

        if let swing = sound.swing {
            writeSwing(swing)
        }

        if let offset = sound.offset {
            writeOffset(offset)
        }

        closeElement()
    }

    internal mutating func writeSoundGroups(_ groups: [MXLSound.Group]) {
        // The parser collects each child kind (instrument-change, midi-device,
        // midi-instrument, play) into its own array and zips them back into groups
        // by index, so a parser-produced sound fills the lowest-indexed groups first
        // per kind. Emitting group by group reproduces that document order.
        for group in groups {
            if let instrumentChange = group.instrumentChange {
                writeInstrumentChange(instrumentChange)
            }

            if let midiDevice = group.midiDevice {
                writeMidiDevice(midiDevice)
            }

            if let midiInstrument = group.midiInstrument {
                writeMidiInstrument(midiInstrument)
            }

            if let play = group.play {
                writePlay(play)
            }
        }
    }

    internal mutating func writeSwing(_ swing: MXLSwing) {
        openElement(.swing)

        writeSwingContent(swing.content)

        if let style = swing.style {
            writeTextElement(.swingStyle, style)
        }

        closeElement()
    }

    internal mutating func writeSwingContent(_ content: MXLSwing.Content) {
        switch content {
        case let .first(first, second, kind):
            writeTextElement(.first, String(first))
            writeTextElement(.second, String(second))

            if let kind {
                writeTextElement(.swingType, _formatSwingKind(kind))
            }

        case .straight:
            writeEmptyElement(.straight)
        }
    }

    internal mutating func writeVirtualInstrument(_ virtualInstrument: MXLVirtualInstrument) {
        openElement(.virtualInstrument)

        if let virtualLibrary = virtualInstrument.virtualLibrary {
            writeTextElement(.virtualLibrary, virtualLibrary)
        }

        if let virtualName = virtualInstrument.virtualName {
            writeTextElement(.virtualName, virtualName)
        }

        closeElement()
    }

    internal mutating func writeVirtualInstrumentData(_ data: MXLVirtualInstrumentData) {
        if let instrumentSound = data.instrumentSound {
            writeTextElement(.instrumentSound, instrumentSound)
        }

        if let content = data.content {
            writeVirtualInstrumentDataContent(content)
        }

        if let virtualInstrument = data.virtualInstrument {
            writeVirtualInstrument(virtualInstrument)
        }
    }

    internal mutating func writeVirtualInstrumentDataContent(_ content: MXLVirtualInstrumentData.Content) {
        switch content {
        case let .ensemble(size):
            if let size {
                writeTextElement(.ensemble, String(size))
            } else {
                writeEmptyElement(.ensemble)
            }

        case .solo:
            writeEmptyElement(.solo)
        }
    }

    // MARK: Private Instance Methods

    private func _formatSwingKind(_ value: MXLSwing.Kind) -> String {
        switch value {
        case .eighth:
            "eighth"

        case .n16th:
            "16th"
        }
    }

    private func _soundAttributes(_ sound: MXLSound) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = sound.id {
            attributes.append((.id, id))
        }

        attributes += _soundNavigationAttributes(sound)
        attributes += _soundPlaybackAttributes(sound)
        attributes += _soundPedalAttributes(sound)

        return attributes
    }

    private func _soundNavigationAttributes(_ sound: MXLSound) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let coda = sound.coda {
            attributes.append((.coda, coda))
        }

        if let isDaCapo = sound.isDaCapo {
            attributes.append((.dacapo, formatYesNo(isDaCapo)))
        }

        if let dalsegno = sound.dalsegno {
            attributes.append((.dalsegno, dalsegno))
        }

        if let fine = sound.fine {
            attributes.append((.fine, fine))
        }

        if let impliesForwardRepeat = sound.impliesForwardRepeat {
            attributes.append((.forwardRepeat, formatYesNo(impliesForwardRepeat)))
        }

        if let segno = sound.segno {
            attributes.append((.segno, segno))
        }

        if let tocoda = sound.tocoda {
            attributes.append((.tocoda, tocoda))
        }

        return attributes
    }

    private func _soundPedalAttributes(_ sound: MXLSound) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let damperPedal = sound.damperPedal {
            attributes.append((.damperPedal, formatYesNoNumber(damperPedal)))
        }

        if let elevation = sound.elevation {
            attributes.append((.elevation, formatDecimal(elevation)))
        }

        if let pan = sound.pan {
            attributes.append((.pan, formatDecimal(pan)))
        }

        if let softPedal = sound.softPedal {
            attributes.append((.softPedal, formatYesNoNumber(softPedal)))
        }

        if let sostenutoPedal = sound.sostenutoPedal {
            attributes.append((.sostenutoPedal, formatYesNoNumber(sostenutoPedal)))
        }

        return attributes
    }

    private func _soundPlaybackAttributes(_ sound: MXLSound) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = []

        if let divisions = sound.divisions {
            attributes.append((.divisions, String(divisions.intValue)))
        }

        if let dynamics = sound.dynamics {
            attributes.append((.dynamics, formatDecimal(dynamics)))
        }

        if let isPizzicato = sound.isPizzicato {
            attributes.append((.pizzicato, formatYesNo(isPizzicato)))
        }

        if let tempo = sound.tempo {
            attributes.append((.tempo, formatDecimal(tempo)))
        }

        if let timeOnly = sound.timeOnly {
            attributes.append((.timeOnly, formatTimeOnly(timeOnly)))
        }

        return attributes
    }
}
