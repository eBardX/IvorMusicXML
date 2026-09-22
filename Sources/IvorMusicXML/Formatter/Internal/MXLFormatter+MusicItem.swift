// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeBackup(_ backup: MXLBackup) {
        openElement(.backup)

        writeTextElement(.duration, String(backup.duration.intValue))

        if let footnote = backup.footnote {
            writeFormattedText(.footnote, footnote)
        }

        if let level = backup.level {
            writeLevel(level)
        }

        closeElement()
    }

    internal mutating func writeFeature(_ feature: MXLFeature) {
        var attributes: [(MXLAttributeName, String)] = []

        if let kind = feature.kind {
            attributes.append((.type, kind))
        }

        writeTextElement(.feature,
                         feature.value,
                         attributes: attributes)
    }

    internal mutating func writeForward(_ forward: MXLForward) {
        openElement(.forward)

        writeTextElement(.duration, String(forward.duration.intValue))

        if let footnote = forward.footnote {
            writeFormattedText(.footnote, footnote)
        }

        if let level = forward.level {
            writeLevel(level)
        }

        if let voice = forward.voice {
            writeTextElement(.voice, voice.voice)
        }

        if let staff = forward.staff {
            writeTextElement(.staff, String(staff.uintValue))
        }

        closeElement()
    }

    internal mutating func writeGrouping(_ grouping: MXLGrouping) {
        var attributes: [(MXLAttributeName, String)] = []

        if let id = grouping.id {
            attributes.append((.id, id))
        }

        attributes.append((.type, formatStartStopSingle(grouping.kind)))
        attributes.append((.number, grouping.number))

        if let memberOf = grouping.memberOf {
            attributes.append((.memberOf, memberOf))
        }

        openElement(.grouping,
                    attributes: attributes)

        for feature in grouping.feature {
            writeFeature(feature)
        }

        closeElement()
    }

    internal mutating func writeLevel(_ level: MXLLevel) {
        var attributes: [(MXLAttributeName, String)] = []

        if let isReferenceOnly = level.isReferenceOnly {
            attributes.append((.reference, formatYesNo(isReferenceOnly)))
        }

        if let kind = level.kind {
            attributes.append((.type, formatStartStopSingle(kind)))
        }

        attributes += levelDisplayAttributes(level.display)

        writeTextElement(.level,
                         level.value,
                         attributes: attributes)
    }

    internal mutating func writeMusicItem(_ item: MXLMusicItem) {
        switch item {
        case let .attributes(attributes):
            writeAttributes(attributes)

        case let .backup(backup):
            writeBackup(backup)

        case let .barline(barline):
            writeBarline(barline)

        case let .bookmark(bookmark):
            writeBookmark(bookmark)

        case let .direction(direction):
            writeDirection(direction)

        case let .figuredBass(figuredBass):
            writeFiguredBass(figuredBass)

        case let .forward(forward):
            writeForward(forward)

        case let .grouping(grouping):
            writeGrouping(grouping)

        case let .harmony(harmony):
            writeHarmony(harmony)

        case let .link(link):
            writeLink(link)

        case let .listening(listening):
            writeListening(listening)

        case let .note(note):
            writeNote(note)

        case let .print(print):
            writePrint(print)

        case let .sound(sound):
            writeSound(sound)
        }
    }

    internal mutating func writeMusicItems(_ items: [MXLMusicItem]) {
        for item in items {
            writeMusicItem(item)
        }
    }
}
