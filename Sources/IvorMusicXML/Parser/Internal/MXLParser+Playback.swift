// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

extension MXLParser {

    // MARK: Internal Type Methods

    internal static func parseAssess(_ node: Node) throws -> MXLAssess {
        try MXLAssess(shouldAssess: node.valueOfRequiredAttribute(.type, parseYesNo),
                      player: node.valueOfOptionalAttribute(.player),
                      timeOnly: node.valueOfOptionalAttribute(.timeOnly, parseTimeOnly))
    }

    internal static func parseListen(_ node: Node) throws -> MXLListen {
        try MXLListen(items: node.optionalChildElements([.assess, .otherListen, .wait], parseListenItem))
    }

    internal static func parseListening(_ node: Node) throws -> MXLListening {
        try MXLListening(items: node.optionalChildElements([.otherListening, .sync], parseListeningItem),
                         offset: node.optionalChildElement(.offset, parseOffset))
    }

    internal static func parseListeningItem(_ node: Node) throws -> MXLListening.Item {
        switch node.element {
        case .otherListening:
            try .otherListening(parseOtherListening(node))

        case .sync:
            try .sync(parseSync(node))

        default:
            try node.unexpectedElement([.otherListening, .sync])
        }
    }

    internal static func parseListenItem(_ node: Node) throws -> MXLListen.Item {
        switch node.element {
        case .assess:
            try .assess(parseAssess(node))

        case .otherListen:
            try .otherListen(parseOtherListening(node))

        case .wait:
            try .wait(parseWait(node))

        default:
            try node.unexpectedElement([.assess, .otherListen, .wait])
        }
    }

    internal static func parseMidi128(_ text: String) -> MXLMidi128? {
        UInt(text).flatMap(MXLMidi128.init(uintValue:))
    }

    internal static func parseMidi16(_ text: String) -> MXLMidi16? {
        UInt(text).flatMap(MXLMidi16.init(uintValue:))
    }

    internal static func parseMidi16384(_ text: String) -> MXLMidi16384? {
        UInt(text).flatMap(MXLMidi16384.init(uintValue:))
    }

    internal static func parseMidiDevice(_ node: Node) throws -> MXLMidiDevice {
        try MXLMidiDevice(id: node.valueOfOptionalAttribute(.id),
                          value: node.value ?? "",
                          port: node.valueOfOptionalAttribute(.port, parseMidi16))
    }

    internal static func parseMidiInstrument(_ node: Node) throws -> MXLMidiInstrument {
        try MXLMidiInstrument(id: node.valueOfRequiredAttribute(.id),
                              midiChannel: node.valueOfOptionalChildElement(.midiChannel, parseMidi16),
                              midiName: node.valueOfOptionalChildElement(.midiName),
                              midiBank: node.valueOfOptionalChildElement(.midiBank, parseMidi16384),
                              midiProgram: node.valueOfOptionalChildElement(.midiProgram, parseMidi128),
                              midiUnpitched: node.valueOfOptionalChildElement(.midiUnpitched, parseMidi128),
                              volume: node.valueOfOptionalChildElement(.volume, parsePercent),
                              pan: node.valueOfOptionalChildElement(.pan, parseRotationDegrees),
                              elevation: node.valueOfOptionalChildElement(.elevation, parseRotationDegrees))
    }

    internal static func parseMute(_ text: String) -> MXLMute? {
        switch text {
        case "bucket":
            .bucket

        case "cup":
            .cup

        case "echo":
            .echo

        case "harmon-no-stem":
            .harmonNoStem

        case "harmon-stem":
            .harmonStem

        case "hat":
            .hat

        case "off":
            .off

        case "on":
            .on

        case "palm":
            .palm

        case "plunger":
            .plunger

        case "practice":
            .practice

        case "solotone":
            .solotone

        case "stop-hand":
            .stopHand

        case "stop-mute":
            .stopMute

        case "straight":
            .straight

        default:
            nil
        }
    }

    internal static func parseOffset(_ node: Node) throws -> MXLOffset {
        try MXLOffset(value: node.value.flatMap(parseDouble) ?? 0,
                      affectsPlayback: node.valueOfOptionalAttribute(.sound, parseYesNo))
    }

    internal static func parseOtherListening(_ node: Node) throws -> MXLOtherListening {
        try MXLOtherListening(value: node.value ?? "",
                              kind: node.valueOfRequiredAttribute(.type),
                              player: node.valueOfOptionalAttribute(.player),
                              timeOnly: node.valueOfOptionalAttribute(.timeOnly, parseTimeOnly))
    }

    internal static func parseOtherPlay(_ node: Node) throws -> MXLOtherPlay {
        try MXLOtherPlay(value: node.value ?? "",
                         kind: node.valueOfRequiredAttribute(.type))
    }

    internal static func parsePlay(_ node: Node) throws -> MXLPlay {
        try MXLPlay(id: node.valueOfOptionalAttribute(.id),
                    items: node.optionalChildElements([.ipa, .mute, .otherPlay, .semiPitched], parsePlayItem))
    }

    internal static func parsePlayItem(_ node: Node) throws -> MXLPlay.Item {
        switch node.element {
        case .ipa:
            .ipa(node.value ?? "")

        case .mute:
            try .mute(node.requiredValue(parseMute))

        case .otherPlay:
            try .otherPlay(parseOtherPlay(node))

        case .semiPitched:
            try .semiPitched(node.requiredValue(parseSemiPitched))

        default:
            try node.unexpectedElement([.ipa, .mute, .otherPlay, .semiPitched])
        }
    }

    internal static func parseSemiPitched(_ text: String) -> MXLSemiPitched? {
        switch text {
        case "high":
            .high

        case "low":
            .low

        case "medium":
            .medium

        case "medium-high":
            .mediumHigh

        case "medium-low":
            .mediumLow

        case "very-low":
            .veryLow

        default:
            nil
        }
    }

    internal static func parseSound(_ node: Node) throws -> MXLSound {
        try MXLSound(id: node.valueOfOptionalAttribute(.id),
                     group: parseSoundGroups(node),
                     swing: node.optionalChildElement(.swing, parseSwing),
                     offset: node.optionalChildElement(.offset, parseOffset),
                     tempo: node.valueOfOptionalAttribute(.tempo, parseNonNegativeDecimal),
                     dynamics: node.valueOfOptionalAttribute(.dynamics, parseNonNegativeDecimal),
                     isDaCapo: node.valueOfOptionalAttribute(.dacapo, parseYesNo),
                     segno: node.valueOfOptionalAttribute(.segno),
                     dalsegno: node.valueOfOptionalAttribute(.dalsegno),
                     coda: node.valueOfOptionalAttribute(.coda),
                     tocoda: node.valueOfOptionalAttribute(.tocoda),
                     divisions: node.valueOfOptionalAttribute(.divisions, parseDivisions),
                     impliesForwardRepeat: node.valueOfOptionalAttribute(.forwardRepeat, parseYesNo),
                     fine: node.valueOfOptionalAttribute(.fine),
                     timeOnly: node.valueOfOptionalAttribute(.timeOnly, parseTimeOnly),
                     isPizzicato: node.valueOfOptionalAttribute(.pizzicato, parseYesNo),
                     pan: node.valueOfOptionalAttribute(.pan, parseRotationDegrees),
                     elevation: node.valueOfOptionalAttribute(.elevation, parseRotationDegrees),
                     damperPedal: node.valueOfOptionalAttribute(.damperPedal, parseYesNoNumber),
                     softPedal: node.valueOfOptionalAttribute(.softPedal, parseYesNoNumber),
                     sostenutoPedal: node.valueOfOptionalAttribute(.sostenutoPedal, parseYesNoNumber))
    }

    internal static func parseSoundGroups(_ node: Node) throws -> [MXLSound.Group] {
        let instrumentChanges = try node.optionalChildElements(.instrumentChange, parseInstrumentChange)
        let midiDevices = try node.optionalChildElements(.midiDevice, parseMidiDevice)
        let midiInstruments = try node.optionalChildElements(.midiInstrument, parseMidiInstrument)
        let plays = try node.optionalChildElements(.play, parsePlay)
        guard !instrumentChanges.isEmpty || !midiDevices.isEmpty || !midiInstruments.isEmpty || !plays.isEmpty
        else { return [] }

        let count = max(instrumentChanges.count, midiDevices.count, midiInstruments.count, plays.count)

        return (0..<count).map { index in
            MXLSound.Group(instrumentChange: index < instrumentChanges.count ? instrumentChanges[index] : nil,
                           midiDevice: index < midiDevices.count ? midiDevices[index] : nil,
                           midiInstrument: index < midiInstruments.count ? midiInstruments[index] : nil,
                           play: index < plays.count ? plays[index] : nil)
        }
    }

    internal static func parseSwing(_ node: Node) throws -> MXLSwing {
        try MXLSwing(content: parseSwingContent(node),
                     style: node.valueOfOptionalChildElement(.swingStyle))
    }

    internal static func parseSwingContent(_ node: Node) throws -> MXLSwing.Content {
        if node.hasChildElement(.straight) {
            return .straight
        }

        return try .first(node.valueOfRequiredChildElement(.first, parseInt),
                          second: node.valueOfRequiredChildElement(.second, parseInt),
                          kind: node.valueOfOptionalChildElement(.swingType, parseSwingKind))
    }

    internal static func parseSwingKind(_ text: String) -> MXLSwing.Kind? {
        switch text {
        case "16th":
            .n16th

        case "eighth":
            .eighth

        default:
            nil
        }
    }

    internal static func parseSync(_ node: Node) throws -> MXLSync {
        try MXLSync(kind: node.valueOfRequiredAttribute(.type, parseSyncKind),
                    latency: node.valueOfOptionalAttribute(.latency, parseMilliseconds),
                    player: node.valueOfOptionalAttribute(.player),
                    timeOnly: node.valueOfOptionalAttribute(.timeOnly, parseTimeOnly))
    }

    internal static func parseSyncKind(_ text: String) -> MXLSync.Kind? {
        switch text {
        case "always-event":
            .alwaysEvent

        case "event":
            .event

        case "mostly-event":
            .mostlyEvent

        case "mostly-tempo":
            .mostlyTempo

        case "none":
            .unsynchronized

        case "tempo":
            .tempo

        default:
            nil
        }
    }

    internal static func parseVirtualInstrument(_ node: Node) throws -> MXLVirtualInstrument {
        try MXLVirtualInstrument(virtualLibrary: node.valueOfOptionalChildElement(.virtualLibrary),
                                 virtualName: node.valueOfOptionalChildElement(.virtualName))
    }

    internal static func parseVirtualInstrumentData(_ node: Node) throws -> MXLVirtualInstrumentData {
        try MXLVirtualInstrumentData(instrumentSound: node.valueOfOptionalChildElement(.instrumentSound),
                                     content: node.optionalChildElement([.ensemble, .solo], parseVirtualInstrumentDataContent),
                                     virtualInstrument: node.optionalChildElement(.virtualInstrument, parseVirtualInstrument))
    }

    internal static func parseVirtualInstrumentDataContent(_ node: Node) throws -> MXLVirtualInstrumentData.Content {
        switch node.element {
        case .ensemble:
            .ensemble(node.value.flatMap(parseInt))

        case .solo:
            .solo

        default:
            try node.unexpectedElement([.ensemble, .solo])
        }
    }

    internal static func parseWait(_ node: Node) throws -> MXLWait {
        try MXLWait(player: node.valueOfOptionalAttribute(.player),
                    timeOnly: node.valueOfOptionalAttribute(.timeOnly, parseTimeOnly))
    }
}
