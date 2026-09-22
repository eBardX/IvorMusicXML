// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLValidator {

    // The conformance checker for a normalized part-wise score. Phase 11 of the
    // pipeline guarantees the validator only ever sees a part-wise score, so this
    // walks `MXLScorePartwise` directly and collects the `MXLValidator.Issue`
    // values the schema cannot express and the parser does not enforce; only
    // checks that are sound on conforming input are performed — see
    // `MXLValidator.Issue` for the ones deliberately omitted.
    internal struct Checker {

        // MARK: Internal Initializers

        internal init(score: MXLScorePartwise) {
            self.score = score
        }

        // MARK: Private Instance Properties

        private let score: MXLScorePartwise

        private var divisionsSeen = false
        private var issues: [Issue] = []
        private var openEndings: [Int: String] = [:]
    }
}

// MARK: -

extension MXLValidator.Checker {

    // MARK: Internal Instance Methods

    internal mutating func check() -> [MXLValidator.Issue] {
        _checkReferentialIntegrity()
        _checkPartGroups()
        _checkInstrumentSounds()

        for part in score.parts {
            _checkPart(part)
        }

        return issues
    }

    // MARK: Private Instance Methods

    private mutating func _checkEnding(_ ending: MXLEnding,
                                       in part: String,
                                       measure: String) {
        let number = ending.number.first ?? 0

        switch ending.kind {
        case .start:
            openEndings[number] = measure

        case .discontinue,
             .stop:
            if openEndings[number] != nil {
                openEndings[number] = nil
            } else {
                issues.append(.unpairedEnding(number: number,
                                              part: part,
                                              measure: measure))
            }
        }
    }

    private mutating func _checkInstrumentSounds() {
        for item in score.partList.items {
            guard case let .scorePart(scorePart) = item
            else { continue }

            for instrument in scorePart.instrument {
                guard let sound = instrument.virtualInstrumentData.instrumentSound,
                      !MXLStandardSoundID.all.contains(sound)
                else { continue }

                issues.append(.unknownInstrumentSound(sound))
            }
        }
    }

    private mutating func _checkMeasure(_ measure: MXLScorePartwise.Part.Measure,
                                        in part: String) {
        for item in measure.items {
            switch item {
            case let .attributes(attributes):
                if attributes.divisions != nil {
                    divisionsSeen = true
                }

            case .backup,
                 .forward:
                _requireDivisions(in: part,
                                  measure: measure.number)

            case let .barline(barline):
                if let ending = barline.ending {
                    _checkEnding(ending,
                                 in: part,
                                 measure: measure.number)
                }

            case let .note(note):
                if _isDurational(note) {
                    _requireDivisions(in: part,
                                      measure: measure.number)
                }

            default:
                break
            }
        }
    }

    private mutating func _checkPart(_ part: MXLScorePartwise.Part) {
        divisionsSeen = false
        openEndings = [:]

        for measure in part.measures {
            _checkMeasure(measure,
                          in: part.id)
        }

        for (number, measure) in openEndings.sorted(by: { $0.value < $1.value }) {
            issues.append(.unpairedEnding(number: number,
                                          part: part.id,
                                          measure: measure))
        }
    }

    private mutating func _checkPartGroups() {
        var depths: [String: Int] = [:]

        for case let .partGroup(group) in score.partList.items {
            switch group.kind {
            case .start:
                depths[group.number, default: 0] += 1

            case .stop:
                if let depth = depths[group.number],
                   depth > 0 {
                    depths[group.number] = depth - 1
                } else {
                    issues.append(.unbalancedPartGroup(number: group.number))
                }
            }
        }

        for (number, depth) in depths.sorted(by: { $0.key < $1.key }) where depth > 0 {
            issues.append(.unbalancedPartGroup(number: number))
        }
    }

    private mutating func _checkReferentialIntegrity() {
        let scorePartIDs = score.partList.items.compactMap { item -> String? in
            guard case let .scorePart(scorePart) = item
            else { return nil }

            return scorePart.id
        }

        let partIDs = score.parts.map(\.id)
        let scorePartIDSet = Set(scorePartIDs)
        let partIDSet = Set(partIDs)

        for id in partIDs where !scorePartIDSet.contains(id) {
            issues.append(.danglingPartID(id))
        }

        for id in scorePartIDs where !partIDSet.contains(id) {
            issues.append(.unusedScorePart(id))
        }
    }

    private func _isDurational(_ note: MXLNote) -> Bool {
        switch note.content {
        case .regularNote,
             .regularNoteCue:
            true

        case .graceNote,
             .graceNoteCue:
            false
        }
    }

    private mutating func _requireDivisions(in part: String,
                                            measure: String) {
        guard !divisionsSeen
        else { return }

        issues.append(.durationBeforeDivisions(part: part,
                                               measure: measure))
    }
}
