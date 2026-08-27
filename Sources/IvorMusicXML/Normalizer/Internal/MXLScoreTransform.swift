// © 2026 John Gary Pusey (see LICENSE.md)

// The bidirectional transform between the part-wise and time-wise score
// encodings.
//
// The two encodings are isomorphic in their musical content: a score is a
// grid of parts by measures, and the two hierarchies differ only in which
// axis is the outer one. Part-wise nests measures inside parts; time-wise
// nests parts inside measures.
//
// The one place the two are not literally isomorphic is measure metadata.
// Time-wise carries a measure’s `id`, `number`, `implicit`,
// `non-controlling`, `text`, and `width` once per measure; part-wise
// carries them once per part per measure. `toTimewise(_:)` therefore takes
// the first part’s values and emits a `MXLNormalizer.Change` for every
// measure whose parts disagree; `toPartwise(_:)` replicates the single
// per-measure values into every part’s measure, so no information is lost
// in that direction.
//
// The transform is kept standalone rather than buried in
// `MXLNormalizer.Editor` so that a future time-wise formatter option is a
// wiring change only.
internal struct MXLScoreTransform {
}

// MARK: -

extension MXLScoreTransform {

    // MARK: Internal Instance Methods

    // Converts a time-wise score to its part-wise encoding, returning the
    // equivalent part-wise score paired with the single
    // `MXLNormalizer.Change.convertedToPartwise` change.
    //
    // The single per-measure metadata is replicated into every part’s
    // measure, so the conversion is lossless in this direction.
    internal func toPartwise(_ score: MXLScoreTimewise)
        -> (MXLScorePartwise, [MXLNormalizer.Change]) {
        let parts = _orderedPartIDs(in: score).map { id in
            MXLScorePartwise.Part(id: id,
                                  measures: score.measures.map { measure in
                                      MXLScorePartwise.Part.Measure(id: measure.id,
                                                                    number: measure.number,
                                                                    isImplicit: measure.isImplicit,
                                                                    isNonControlling: measure.isNonControlling,
                                                                    text: measure.text,
                                                                    width: measure.width,
                                                                    items: measure.parts.first { $0.id == id }?.items ?? [])
                                  })
        }

        let partwise = MXLScorePartwise(version: score.version,
                                        work: score.work,
                                        movementNumber: score.movementNumber,
                                        movementTitle: score.movementTitle,
                                        identification: score.identification,
                                        defaults: score.defaults,
                                        credit: score.credit,
                                        partList: score.partList,
                                        parts: parts)

        return (partwise, [.convertedToPartwise])
    }

    // Converts a part-wise score to its time-wise encoding, returning the
    // equivalent time-wise score paired with the changes recording any
    // per-part metadata reconciled away.
    //
    // Each measure’s metadata is taken from the first part, since time-wise
    // carries it only once per measure. When a later part’s measure
    // metadata disagrees with the first part’s, a
    // `MXLNormalizer.Change.replacedConstruct(_:_:)` change records the
    // reconciliation.
    internal func toTimewise(_ score: MXLScorePartwise)
        -> (MXLScoreTimewise, [MXLNormalizer.Change]) {
        guard let firstPart = score.parts.first
        else { return (_timewise(from: score, measures: []), []) }

        var changes: [MXLNormalizer.Change] = []

        let measures = firstPart.measures.indices.map { index -> MXLScoreTimewise.Measure in
            let reference = firstPart.measures[index]

            if _partsDisagree(in: score, at: index, against: reference) {
                changes.append(.replacedConstruct("measure[\(reference.number)] per-part metadata",
                                                  "first part's metadata"))
            }

            return MXLScoreTimewise.Measure(id: reference.id,
                                            number: reference.number,
                                            isImplicit: reference.isImplicit,
                                            isNonControlling: reference.isNonControlling,
                                            text: reference.text,
                                            width: reference.width,
                                            parts: score.parts.map { part in
                                                MXLScoreTimewise.Measure.Part(id: part.id,
                                                                              items: index < part.measures.count ? part.measures[index].items : [])
                                            })
        }

        return (_timewise(from: score, measures: measures), changes)
    }

    // MARK: Private Instance Methods

    private func _orderedPartIDs(in score: MXLScoreTimewise) -> [String] {
        var seen: Set<String> = []
        var ordered: [String] = []

        for measure in score.measures {
            for part in measure.parts where seen.insert(part.id).inserted {
                ordered.append(part.id)
            }
        }

        return ordered
    }

    private func _partsDisagree(in score: MXLScorePartwise,
                                at index: Int,
                                against reference: MXLScorePartwise.Part.Measure) -> Bool {
        score.parts.dropFirst().contains { part in
            guard index < part.measures.count
            else { return false }

            let other = part.measures[index]

            return other.id != reference.id
                || other.isImplicit != reference.isImplicit
                || other.isNonControlling != reference.isNonControlling
                || other.number != reference.number
                || other.text != reference.text
                || other.width != reference.width
        }
    }

    private func _timewise(from score: MXLScorePartwise,
                           measures: [MXLScoreTimewise.Measure]) -> MXLScoreTimewise {
        MXLScoreTimewise(version: score.version,
                         work: score.work,
                         movementNumber: score.movementNumber,
                         movementTitle: score.movementTitle,
                         identification: score.identification,
                         defaults: score.defaults,
                         credit: score.credit,
                         partList: score.partList,
                         measures: measures)
    }
}
