// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLNormalizer {

    // The MusicXML 1.1 to 2.0 migration pass.
    //
    // Implements migration rows M3, M4, and M5 of `Design/MigrationTable.md`:
    //
    // - M3 — the deprecated formatting attributes on `<part-name>` and
    //   `<part-abbreviation>` are moved into a synthesized
    //   `<part-name-display>` / `<part-abbreviation-display>`.
    // - M4 — the equivalent move for `<group-name>` and `<group-abbreviation>`.
    // - M5 — the deprecated `<sound>` `pan` and `elevation` attributes are
    //   moved onto the sound’s `<midi-instrument>` children. This migration
    //   is conditional: a sound with no `<midi-instrument>` child has no
    //   target, so its attributes are left in place.
    internal struct Pass1_1 {   // swiftlint:disable:this type_name

        // MARK: Internal Initializers

        internal init() {
        }
    }
}

// MARK: -

extension MXLNormalizer.Pass1_1 {

    // MARK: Internal Instance Methods

    internal func apply(to score: MXLScorePartwise) -> (MXLScorePartwise, [MXLNormalizer.Change]) {
        var changes: [MXLNormalizer.Change] = []

        let named = score.mappingPartListItems { item in
            switch item {
            case let .partGroup(partGroup):
                .partGroup(Self._migrate(partGroup, &changes))

            case let .scorePart(scorePart):
                .scorePart(Self._migrate(scorePart, &changes))
            }
        }

        let edited = named.mappingMusicItems { item in
            switch item {
            case let .direction(direction):
                .direction(Self._migrate(direction, &changes))

            case let .sound(sound):
                .sound(Self._migrate(sound, &changes))

            default:
                item
            }
        }

        return (edited, changes)
    }
}

// MARK: -

extension MXLNormalizer.Pass1_1 {

    // MARK: Private Type Methods

    private static func _display(from name: MXLPartName) -> MXLNameDisplay {
        MXLNameDisplay(items: [.displayText(MXLFormattedText(value: name.value,
                                                             justify: name.text.justify,
                                                             position: name.text.position,
                                                             font: name.text.font,
                                                             color: name.text.color))],
                       printsObject: name.text.printsObject)
    }

    private static func _display(from name: MXLGroupName) -> MXLNameDisplay {
        MXLNameDisplay(items: [.displayText(MXLFormattedText(value: name.value,
                                                             justify: name.text.justify,
                                                             position: name.text.position,
                                                             font: name.text.font,
                                                             color: name.text.color))])
    }

    private static func _hasFormatting(_ text: MXLPartName.Text) -> Bool {
        text.color != nil
            || text.justify != nil
            || text.printsObject != nil
            || text.font != MXLFont()
            || text.position != MXLPosition()
    }

    private static func _hasFormatting(_ text: MXLGroupName.Text) -> Bool {
        text.color != nil
            || text.justify != nil
            || text.font != MXLFont()
            || text.position != MXLPosition()
    }

    private static func _migrate(_ partGroup: MXLPartGroup,
                                 _ changes: inout [MXLNormalizer.Change]) -> MXLPartGroup {
        var name = partGroup.name
        var nameDisplay = partGroup.nameDisplay
        var abbreviation = partGroup.abbreviation
        var abbreviationDisplay = partGroup.abbreviationDisplay

        if let existing = partGroup.name,
           _hasFormatting(existing.text) {
            if nameDisplay == nil {
                nameDisplay = _display(from: existing)
            }

            name = MXLGroupName(value: existing.value,
                                text: MXLGroupName.Text())

            changes.append(.replacedConstruct("group-name/@font-size", "group-name-display/display-text"))
        }

        if let existing = partGroup.abbreviation,
           _hasFormatting(existing.text) {
            if abbreviationDisplay == nil {
                abbreviationDisplay = _display(from: existing)
            }

            abbreviation = MXLGroupName(value: existing.value,
                                        text: MXLGroupName.Text())

            changes.append(.replacedConstruct("group-abbreviation/@font-size",
                                              "group-abbreviation-display/display-text"))
        }

        return MXLPartGroup(name: name,
                            nameDisplay: nameDisplay,
                            abbreviation: abbreviation,
                            abbreviationDisplay: abbreviationDisplay,
                            symbol: partGroup.symbol,
                            barline: partGroup.barline,
                            stretchesTimeSignature: partGroup.stretchesTimeSignature,
                            footnote: partGroup.footnote,
                            level: partGroup.level,
                            kind: partGroup.kind,
                            number: partGroup.number)
    }

    private static func _migrate(_ scorePart: MXLScorePart,
                                 _ changes: inout [MXLNormalizer.Change]) -> MXLScorePart {
        var name = scorePart.name
        var nameDisplay = scorePart.nameDisplay
        var abbreviation = scorePart.abbreviation
        var abbreviationDisplay = scorePart.abbreviationDisplay

        if _hasFormatting(scorePart.name.text) {
            if nameDisplay == nil {
                nameDisplay = _display(from: scorePart.name)
            }

            name = MXLPartName(value: scorePart.name.value,
                               text: MXLPartName.Text())

            changes.append(.replacedConstruct("part-name/@font-size", "part-name-display/display-text"))
        }

        if let existing = scorePart.abbreviation,
           _hasFormatting(existing.text) {
            if abbreviationDisplay == nil {
                abbreviationDisplay = _display(from: existing)
            }

            abbreviation = MXLPartName(value: existing.value,
                                       text: MXLPartName.Text())

            changes.append(.replacedConstruct("part-abbreviation/@font-size",
                                              "part-abbreviation-display/display-text"))
        }

        return MXLScorePart(id: scorePart.id,
                            identification: scorePart.identification,
                            link: scorePart.link,
                            name: name,
                            nameDisplay: nameDisplay,
                            abbreviation: abbreviation,
                            abbreviationDisplay: abbreviationDisplay,
                            group: scorePart.group,
                            instrument: scorePart.instrument,
                            player: scorePart.player,
                            group2: scorePart.group2)
    }
}

// MARK: -

extension MXLNormalizer.Pass1_1 {

    // MARK: Private Type Methods

    private static func _clearingPanAndElevation(_ sound: MXLSound,
                                                 _ groups: [MXLSound.Group]) -> MXLSound {
        MXLSound(id: sound.id,
                 group: groups,
                 swing: sound.swing,
                 offset: sound.offset,
                 tempo: sound.tempo,
                 dynamics: sound.dynamics,
                 isDaCapo: sound.isDaCapo,
                 segno: sound.segno,
                 dalsegno: sound.dalsegno,
                 coda: sound.coda,
                 tocoda: sound.tocoda,
                 divisions: sound.divisions,
                 impliesForwardRepeat: sound.impliesForwardRepeat,
                 fine: sound.fine,
                 timeOnly: sound.timeOnly,
                 isPizzicato: sound.isPizzicato,
                 pan: nil,
                 elevation: nil,
                 damperPedal: sound.damperPedal,
                 softPedal: sound.softPedal,
                 sostenutoPedal: sound.sostenutoPedal)
    }

    private static func _migrate(_ direction: MXLDirection,
                                 _ changes: inout [MXLNormalizer.Change]) -> MXLDirection {
        guard let sound = direction.sound
        else { return direction }

        return MXLDirection(id: direction.id,
                            kind: direction.kind,
                            offset: direction.offset,
                            footnote: direction.footnote,
                            level: direction.level,
                            voice: direction.voice,
                            staff: direction.staff,
                            sound: _migrate(sound, &changes),
                            listening: direction.listening,
                            placement: direction.placement,
                            isDirective: direction.isDirective,
                            system: direction.system)
    }

    private static func _migrate(_ sound: MXLSound,
                                 _ changes: inout [MXLNormalizer.Change]) -> MXLSound {
        guard sound.pan != nil || sound.elevation != nil,
              sound.group.contains(where: { $0.midiInstrument != nil })
        else { return sound }

        let groups = sound.group.map { group -> MXLSound.Group in
            guard let instrument = group.midiInstrument
            else { return group }

            return MXLSound.Group(instrumentChange: group.instrumentChange,
                                  midiDevice: group.midiDevice,
                                  midiInstrument: _moving(sound, onto: instrument),
                                  play: group.play)
        }

        if sound.pan != nil {
            changes.append(.replacedConstruct("sound/@pan", "midi-instrument/pan"))
        }

        if sound.elevation != nil {
            changes.append(.replacedConstruct("sound/@elevation", "midi-instrument/elevation"))
        }

        return _clearingPanAndElevation(sound, groups)
    }

    private static func _moving(_ sound: MXLSound,
                                onto instrument: MXLMidiInstrument) -> MXLMidiInstrument {
        MXLMidiInstrument(id: instrument.id,
                          midiChannel: instrument.midiChannel,
                          midiName: instrument.midiName,
                          midiBank: instrument.midiBank,
                          midiProgram: instrument.midiProgram,
                          midiUnpitched: instrument.midiUnpitched,
                          volume: instrument.volume,
                          pan: instrument.pan ?? sound.pan,
                          elevation: instrument.elevation ?? sound.elevation)
    }
}
