// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLValidator {

    /// An issue found when validating an ``MXLDocument`` against the MusicXML
    /// specification.
    ///
    /// An issue describes conformance the schema cannot express and the parser
    /// does not enforce. The catalogue is deliberately confined to checks that
    /// are *sound on conforming input* — a well-formed score never trips one —
    /// so that a reported issue is always a genuine defect and never a false
    /// alarm. Every check runs against the normalized part-wise score, so `part`
    /// and `measure` labels are the part `id` and measure `number` from that
    /// score.
    ///
    /// An opus is not checked at all: its schema is four elements and the parser
    /// already enforces nearly everything they constrain, so it passes straight
    /// through the validator.
    ///
    /// Two checks the schema-diff proposal listed as candidates are deliberately
    /// absent, because they cannot be decided soundly from the AST alone:
    ///
    /// - **Measure duration versus the prevailing `<time>`.** MusicXML permits
    ///   partial measures that are not flagged `implicit` (pickups, measures split
    ///   across a repeat or a mid-measure meter change), so a short measure is not
    ///   evidence of a defect.
    /// - **Number-keyed spanner pairing (`<slur>`, `<tuplet>`, `<wedge>`, and the
    ///   like).** The `number` level is reused across simultaneous voices, and the
    ///   spec expressly allows a spanner’s start and stop to appear in arbitrary
    ///   document order, so pairing them requires the per-voice onset timeline the
    ///   resolver builds — not something the validator can settle. Unclosed
    ///   spanners are also a common, non-fatal real-world imperfection.
    public enum Issue {

        /// A `<part>` whose `id` matches no `<score-part>` in the part list.
        case danglingPartID(String)

        /// A durational element (`<note>`, `<backup>`, or `<forward>`) appears in
        /// a part before any `<divisions>` has been declared, so its duration
        /// cannot be interpreted.
        case durationBeforeDivisions(part: String, measure: String)

        /// A `<part-group>` start with no matching stop, or a stop with no
        /// matching start.
        case unbalancedPartGroup(number: String)

        /// An `<instrument-sound>` value that is not one of the standard sounds
        /// defined by MusicXML 4.0.
        ///
        /// The value is not required to be a standard sound by the schema, which
        /// types it as `xs:string`, so this is a conformance issue rather than a
        /// parse error.
        case unknownInstrumentSound(String)

        /// An `<ending>` start with no matching stop or discontinue, or a stop or
        /// discontinue with no matching start.
        case unpairedEnding(number: Int, part: String, measure: String)

        /// A `<score-part>` whose `id` is referenced by no `<part>`.
        case unusedScorePart(String)
    }
}

// MARK: -

extension MXLValidator.Issue {

    // MARK: Public Instance Properties

    /// A human-readable description of this issue.
    public var message: String {
        switch self {
        case let .danglingPartID(id):
            "Part \(id) has no matching score-part in the part list"

        case let .durationBeforeDivisions(part, measure):
            "Part \(part) measure \(measure) has a duration before any divisions is declared"

        case let .unbalancedPartGroup(number):
            "Part-group \(number) is not balanced by a matching start and stop"

        case let .unknownInstrumentSound(value):
            "Instrument-sound \(value) is not a standard MusicXML sound"

        case let .unpairedEnding(number, part, measure):
            "Part \(part) measure \(measure) has an unpaired ending \(number)"

        case let .unusedScorePart(id):
            "Score-part \(id) is referenced by no part"
        }
    }
}

// MARK: - Equatable

extension MXLValidator.Issue: Equatable {
}

// MARK: - Sendable

extension MXLValidator.Issue: Sendable {
}
