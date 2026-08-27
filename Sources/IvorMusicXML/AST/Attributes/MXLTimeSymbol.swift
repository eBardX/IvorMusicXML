// © 2026 John Gary Pusey (see LICENSE.md)

/// The time-symbol type indicates how to display a time signature. The normal value is the usual fractional
/// display, and is the implied symbol type if none is specified. Other options are the common and cut time
/// symbols, as well as a single number with an implied denominator. The note symbol indicates that the beat-type
/// should be represented with the corresponding downstem note rather than a number. The dotted-note symbol
/// indicates that the beat-type should be represented with a dotted downstem note that corresponds to three times
/// the beat-type value, and a numerator that is one third the beats value.
public enum MXLTimeSymbol {

    /// The common time symbol.
    case common

    /// The cut time symbol.
    case cut

    /// A dotted downstem note representing three times the beat-type value, with a numerator one third the beats
    /// value.
    case dottedNote

    /// The usual fractional display. This is the implied symbol type if none is specified.
    case normal

    /// A downstem note representing the beat-type value, rather than a number.
    case note

    /// A single number with an implied denominator.
    case singleNumber
}

// MARK: - Equatable

extension MXLTimeSymbol: Equatable {
}

// MARK: - Hashable

extension MXLTimeSymbol: Hashable {
}

// MARK: - Sendable

extension MXLTimeSymbol: Sendable {
}
