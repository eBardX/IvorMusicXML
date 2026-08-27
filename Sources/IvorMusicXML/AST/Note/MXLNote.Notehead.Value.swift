// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLNote.Notehead {

    /// The notehead-value type indicates shapes other than the open and closed ovals associated with note durations.
    ///
    /// The values do, re, mi, fa, fa up, so, la, and ti correspond to Aikin’s 7-shape system. The fa up shape is
    /// typically used with upstems; the fa shape is typically used with downstems or no stems.
    ///
    /// The arrow shapes differ from triangle and inverted triangle by being centered on the stem. Slashed and back
    /// slashed notes include both the normal notehead and a slash. The triangle shape has the tip of the triangle
    /// pointing up; the inverted triangle shape has the tip of the triangle pointing down. The left triangle shape is
    /// a right triangle with the hypotenuse facing up and to the left.
    ///
    /// The other notehead covers noteheads other than those listed here. It is usually used in combination with the
    /// smufl attribute to specify a particular SMuFL notehead. The smufl attribute may be used with any notehead
    /// value to help specify the appearance of symbols that share the same MusicXML semantics. Noteheads in the SMuFL
    /// Note name noteheads and Note name noteheads supplement ranges (U+E150–U+E1AF and U+EEE0–U+EEFF) should not use
    /// the smufl attribute or the “other” value, but instead use the notehead-text element.
    public enum Value {

        /// An arrow-shaped notehead pointing down, centered on the stem.
        case arrowDown

        /// An arrow-shaped notehead pointing up, centered on the stem.
        case arrowUp

        /// A normal notehead with a back slash through it.
        case backSlashed

        /// A notehead with a dot in a circle.
        case circleDot

        /// A notehead shaped like a circle with an X.
        case circleX

        /// A circled notehead.
        case circled

        /// A cluster notehead.
        case cluster

        /// A cross-shaped notehead.
        case cross

        /// A diamond-shaped notehead.
        case diamond

        /// The “do” shape in Aikin’s 7-shape system.
        case `do`

        /// The “fa” shape in Aikin’s 7-shape system, typically used with downstems or no stems.
        case fa

        /// The “fa” shape in Aikin’s 7-shape system, typically used with upstems.
        case faUp

        /// No notehead is displayed.
        case hidden

        /// A triangle-shaped notehead with the tip pointing down, centered on the stem.
        case invertedTriangle

        /// The “la” shape in Aikin’s 7-shape system.
        case la

        /// A right-triangle-shaped notehead with the hypotenuse facing up and to the left.
        case leftTriangle

        /// The “mi” shape in Aikin’s 7-shape system.
        case mi

        /// The normal open or closed oval notehead.
        case normal

        /// A notehead other than those listed here, typically used together with the smufl attribute.
        case other

        /// The “re” shape in Aikin’s 7-shape system.
        case re

        /// A rectangular notehead.
        case rectangle

        /// A slash-shaped notehead.
        case slash

        /// A normal notehead with a slash through it.
        case slashed

        /// The “so” shape in Aikin’s 7-shape system.
        case so

        /// A square notehead.
        case square

        /// The “ti” shape in Aikin’s 7-shape system.
        case ti

        /// A triangle-shaped notehead with the tip pointing up.
        case triangle

        /// An X-shaped notehead.
        case x
    }
}

// MARK: - Equatable

extension MXLNote.Notehead.Value: Equatable {
}

// MARK: - Hashable

extension MXLNote.Notehead.Value: Hashable {
}

// MARK: - Sendable

extension MXLNote.Notehead.Value: Sendable {
}
