// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeAssess(_ assess: MXLAssess) {
        var attributes: [(MXLAttributeName, String)] = [(.type, formatYesNo(assess.shouldAssess))]

        if let player = assess.player {
            attributes.append((.player, player))
        }

        if let timeOnly = assess.timeOnly {
            attributes.append((.timeOnly, formatTimeOnly(timeOnly)))
        }

        writeEmptyElement(.assess,
                          attributes: attributes)
    }

    internal mutating func writeListen(_ listen: MXLListen) {
        openElement(.listen)

        for item in listen.items {
            writeListenItem(item)
        }

        closeElement()
    }

    internal mutating func writeListening(_ listening: MXLListening) {
        openElement(.listening)

        for item in listening.items {
            writeListeningItem(item)
        }

        if let offset = listening.offset {
            writeOffset(offset)
        }

        closeElement()
    }

    internal mutating func writeListeningItem(_ item: MXLListening.Item) {
        switch item {
        case let .otherListening(otherListening):
            writeOtherListening(.otherListening, otherListening)

        case let .sync(sync):
            writeSync(sync)
        }
    }

    internal mutating func writeListenItem(_ item: MXLListen.Item) {
        switch item {
        case let .assess(assess):
            writeAssess(assess)

        case let .otherListen(otherListen):
            writeOtherListening(.otherListen, otherListen)

        case let .wait(wait):
            writeWait(wait)
        }
    }

    internal mutating func writeOtherListening(_ name: MXLElementName,
                                               _ otherListening: MXLOtherListening) {
        var attributes: [(MXLAttributeName, String)] = [(.type, otherListening.kind)]

        if let player = otherListening.player {
            attributes.append((.player, player))
        }

        if let timeOnly = otherListening.timeOnly {
            attributes.append((.timeOnly, formatTimeOnly(timeOnly)))
        }

        writeTextElement(name,
                         otherListening.value,
                         attributes: attributes)
    }

    internal mutating func writePlay(_ play: MXLPlay) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = play.id {
            attributes.append((.id, id))
        }

        openElement(.play,
                    attributes: attributes)

        for item in play.items {
            writePlayItem(item)
        }

        closeElement()
    }

    internal mutating func writePlayItem(_ item: MXLPlay.Item) {
        switch item {
        case let .ipa(ipa):
            writeTextElement(.ipa, ipa)

        case let .mute(mute):
            writeTextElement(.mute, _formatMute(mute))

        case let .otherPlay(otherPlay):
            writeTextElement(.otherPlay,
                             otherPlay.value,
                             attributes: [(.type, otherPlay.kind)])

        case let .semiPitched(semiPitched):
            writeTextElement(.semiPitched, _formatSemiPitched(semiPitched))
        }
    }

    internal mutating func writeSync(_ sync: MXLSync) {
        var attributes: [(MXLAttributeName, String)] = [(.type, _formatSyncKind(sync.kind))]

        if let latency = sync.latency {
            attributes.append((.latency, String(latency.uintValue)))
        }

        if let player = sync.player {
            attributes.append((.player, player))
        }

        if let timeOnly = sync.timeOnly {
            attributes.append((.timeOnly, formatTimeOnly(timeOnly)))
        }

        writeEmptyElement(.sync,
                          attributes: attributes)
    }

    internal mutating func writeWait(_ wait: MXLWait) {
        var attributes: [(MXLAttributeName, String)] = []

        if let player = wait.player {
            attributes.append((.player, player))
        }

        if let timeOnly = wait.timeOnly {
            attributes.append((.timeOnly, formatTimeOnly(timeOnly)))
        }

        writeEmptyElement(.wait,
                          attributes: attributes)
    }

    // MARK: Private Instance Methods

    private func _formatMute(_ value: MXLMute) -> String {
        switch value {
        case .bucket:
            "bucket"

        case .cup:
            "cup"

        case .echo:
            "echo"

        case .harmonNoStem:
            "harmon-no-stem"

        case .harmonStem:
            "harmon-stem"

        case .hat:
            "hat"

        case .off:
            "off"

        case .on:
            "on"

        case .palm:
            "palm"

        case .plunger:
            "plunger"

        case .practice:
            "practice"

        case .solotone:
            "solotone"

        case .stopHand:
            "stop-hand"

        case .stopMute:
            "stop-mute"

        case .straight:
            "straight"
        }
    }

    private func _formatSemiPitched(_ value: MXLSemiPitched) -> String {
        switch value {
        case .high:
            "high"

        case .low:
            "low"

        case .medium:
            "medium"

        case .mediumHigh:
            "medium-high"

        case .mediumLow:
            "medium-low"

        case .veryLow:
            "very-low"
        }
    }

    private func _formatSyncKind(_ value: MXLSync.Kind) -> String {
        switch value {
        case .alwaysEvent:
            "always-event"

        case .event:
            "event"

        case .mostlyEvent:
            "mostly-event"

        case .mostlyTempo:
            "mostly-tempo"

        case .tempo:
            "tempo"

        case .unsynchronized:
            "none"
        }
    }
}
