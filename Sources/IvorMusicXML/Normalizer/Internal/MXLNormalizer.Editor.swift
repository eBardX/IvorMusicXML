// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLNormalizer {

    // Drives the ordered chain of per-version migration passes.
    //
    // The chain runs `v1_0 → v1_1 → v2_0 → v3_0 → v3_1 → v4_0`, entering at
    // the score’s declared version and running every pass from there
    // forward, with a final stamp raising the version to
    // `MXLDocument.Version.current`. Adding a future schema version means
    // appending one pass, not reshaping the chain.
    //
    // The `v2_0 → v3_0` and `v3_0 → v3_1` steps have no migrating rows in
    // `Design/MigrationTable.md`, so they have no pass; the two
    // informational deprecations they introduced (`<beam>@repeater`,
    // `@bezier-offset`) are reported by `MXLParser.Diagnostic` and pass
    // through unchanged.
    //
    // A time-wise score is converted to part-wise by `MXLScoreTransform`
    // before the version chain runs, so the chain — and every stage
    // downstream of the normalizer — only ever sees a part-wise score.
    //
    // An opus enters the same `edit()` but takes no pass: the opus schema
    // has never changed structurally, so the closing version stamp is the
    // whole of its normalization. See `_editOpus(_:)`.
    internal struct Editor {

        // MARK: Internal Initializers

        internal init(document: MXLDocument) {
            self.document = document
        }

        // MARK: Private Instance Properties

        private let document: MXLDocument
    }
}

// MARK: -

extension MXLNormalizer.Editor {

    // MARK: Internal Instance Methods

    internal func edit() -> (MXLDocument, [MXLNormalizer.Change]) {
        switch document.content {
        case let .opus(opus):
            let (edited, changes) = _editOpus(opus)

            return (_normalized(.opus(edited), changes), changes)

        case let .scorePartwise(score):
            let (edited, changes) = _editScore(score)

            return (_normalized(.scorePartwise(edited), changes), changes)

        case let .scoreTimewise(score):
            let (partwise, conversion) = MXLScoreTransform().toPartwise(score)
            let (edited, passChanges) = _editScore(partwise)
            let changes = conversion + passChanges

            return (_normalized(.scorePartwise(edited), changes), changes)
        }
    }

    // MARK: Private Instance Methods

    // The opus schema has never changed structurally — the element set has
    // been `opus`, `opus-link`, `score`, `title` since 1.0, with no
    // deprecations, removals, renames, or enumeration narrowings — so there
    // is no migration pass, which is why opus has no row in
    // `Design/MigrationTable.md`. The only work is the version stamp, so
    // that an opus behaves like a score rather than keeping the `?? .v1_0`
    // fallback a pre-2.0 file parses to.
    //
    // The stamp recurses (see `MXLOpus.withVersion(_:)`) but emits a single
    // `MXLNormalizer.Change` for the document, because a `Change` carries no
    // path context and one per nested opus would be noise.
    private func _editOpus(_ opus: MXLOpus) -> (MXLOpus, [MXLNormalizer.Change]) {
        let original = opus.minimumVersion

        guard original != .current
        else { return (opus, []) }

        return (opus.withVersion(.current), [.upgradedVersion(original, .current)])
    }

    private func _editScore(_ score: MXLScorePartwise) -> (MXLScorePartwise, [MXLNormalizer.Change]) {
        var score = score
        var changes: [MXLNormalizer.Change] = []

        let original = score.version

        if original <= .v1_0 {
            let (edited, passChanges) = MXLNormalizer.Pass1_0().apply(to: score)

            score = edited
            changes += passChanges
        }

        if original <= .v1_1 {
            let (edited, passChanges) = MXLNormalizer.Pass1_1().apply(to: score)

            score = edited
            changes += passChanges
        }

        if original <= .v3_1 {
            let (edited, passChanges) = MXLNormalizer.Pass3_1().apply(to: score)

            score = edited
            changes += passChanges
        }

        guard score.version != .current
        else { return (score, changes) }

        changes.append(.upgradedVersion(original, .current))

        return (score.withVersion(.current), changes)
    }

    private func _normalized(_ content: MXLDocument.Content,
                             _ changes: [MXLNormalizer.Change]) -> MXLDocument {
        MXLDocument(content: content,
                    isNormalized: true,
                    isValidated: changes.isEmpty ? document.isValidated : false)
    }
}
