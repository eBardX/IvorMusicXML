// © 2026 John Gary Pusey (see LICENSE.md)

/// The accidental-value type represents notated accidentals supported by MusicXML. In the MusicXML 2.0 DTD this
/// was a string with values that could be included. The XSD strengthens the data typing to an enumerated list.
/// The quarter- and three-quarters- accidentals are Tartini-style quarter-tone accidentals. The -down and -up
/// accidentals are quarter-tone accidentals that include arrows pointing down or up. The slash- accidentals are
/// used in Turkish classical music. The numbered sharp and flat accidentals are superscripted versions of the
/// accidental signs, used in Turkish folk music. The sori and koron accidentals are microtonal sharp and flat
/// accidentals used in Iranian and Persian music. The other accidental covers accidentals other than those listed
/// here. It is usually used in combination with the smufl attribute to specify a particular SMuFL accidental. The
/// smufl attribute may be used with any accidental value to help specify the appearance of symbols that share the
/// same MusicXML semantics.
public enum MXLAccidentalValue {

    /// A quarter-tone accidental with an arrow pointing down.
    case arrowDown

    /// A quarter-tone accidental with an arrow pointing up.
    case arrowUp

    /// A double sharp accidental.
    case doubleSharp

    /// A double sharp accidental with an arrow pointing down.
    case doubleSharpDown

    /// A double sharp accidental with an arrow pointing up.
    case doubleSharpUp

    /// A double flat accidental with a slash, used in Turkish classical music.
    case doubleSlashFlat

    /// A flat accidental.
    case flat

    /// A superscripted flat accidental with a numeral 1, used in Turkish folk music.
    case flat1

    /// A superscripted flat accidental with a numeral 2, used in Turkish folk music.
    case flat2

    /// A superscripted flat accidental with a numeral 3, used in Turkish folk music.
    case flat3

    /// A superscripted flat accidental with a numeral 4, used in Turkish folk music.
    case flat4

    /// A quarter-tone flat accidental with an arrow pointing down.
    case flatDown

    /// A double flat accidental.
    case flatFlat

    /// A double flat accidental with an arrow pointing down.
    case flatFlatDown

    /// A double flat accidental with an arrow pointing up.
    case flatFlatUp

    /// A quarter-tone flat accidental with an arrow pointing up.
    case flatUp

    /// A microtonal flat accidental used in Iranian and Persian music.
    case koron

    /// A natural accidental.
    case natural

    /// A quarter-tone natural accidental with an arrow pointing down.
    case naturalDown

    /// A natural-flat accidental.
    case naturalFlat

    /// A natural-sharp accidental.
    case naturalSharp

    /// A quarter-tone natural accidental with an arrow pointing up.
    case naturalUp

    /// An accidental other than those listed here, typically used together with the smufl attribute.
    case other

    /// A Tartini-style quarter-tone flat accidental.
    case quarterFlat

    /// A Tartini-style quarter-tone sharp accidental.
    case quarterSharp

    /// A sharp accidental.
    case sharp

    /// A superscripted sharp accidental with a numeral 1, used in Turkish folk music.
    case sharp1

    /// A superscripted sharp accidental with a numeral 2, used in Turkish folk music.
    case sharp2

    /// A superscripted sharp accidental with a numeral 3, used in Turkish folk music.
    case sharp3

    /// A superscripted sharp accidental with a numeral 5, used in Turkish folk music.
    case sharp5

    /// A quarter-tone sharp accidental with an arrow pointing down.
    case sharpDown

    /// A double sharp accidental notated as two sharp signs.
    case sharpSharp

    /// A quarter-tone sharp accidental with an arrow pointing up.
    case sharpUp

    /// A flat accidental with a slash, used in Turkish classical music.
    case slashFlat

    /// A quarter-tone sharp accidental with a slash, used in Turkish classical music.
    case slashQuarterSharp

    /// A sharp accidental with a slash, used in Turkish classical music.
    case slashSharp

    /// A microtonal sharp accidental used in Iranian and Persian music.
    case sori

    /// A Tartini-style three-quarter-tone flat accidental.
    case threeQuartersFlat

    /// A Tartini-style three-quarter-tone sharp accidental.
    case threeQuartersSharp

    /// A triple flat accidental.
    case tripleFlat

    /// A triple sharp accidental.
    case tripleSharp
}

// MARK: - Equatable

extension MXLAccidentalValue: Equatable {
}

// MARK: - Hashable

extension MXLAccidentalValue: Hashable {
}

// MARK: - Sendable

extension MXLAccidentalValue: Sendable {
}
