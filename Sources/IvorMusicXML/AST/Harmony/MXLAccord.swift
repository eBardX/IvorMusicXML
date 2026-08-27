// © 2026 John Gary Pusey (see LICENSE.md)

/// The accord type represents the tuning of a single string in the scordatura element. It uses the same group of
/// elements as the staff-tuning element. Strings are numbered from high to low.
///
/// Maps the MusicXML `<accord>` element.
public struct MXLAccord {

    // MARK: Public Initializers

    /// Creates a new `MXLAccord`.
    ///
    /// - Parameter tuning: The tuning group contains the sequence of elements common to the staff-tuning and accord elements.
    /// - Parameter string:  The number of the string being tuned, numbered from high to low.
    public init(tuning: MXLTuning,
                string: MXLStringNumber? = nil) {
        self.string = string
        self.tuning = tuning
    }

    // MARK: Public Instance Properties

    /// The number of the string being tuned, numbered from high to low.
    ///
    /// Maps to a nested MusicXML `<string>` element.
    public let string: MXLStringNumber?

    /// The tuning group contains the sequence of elements common to the staff-tuning and accord elements.
    public let tuning: MXLTuning
}

// MARK: - Equatable

extension MXLAccord: Equatable {
}

// MARK: - Hashable

extension MXLAccord: Hashable {
}

// MARK: - Sendable

extension MXLAccord: Sendable {
}
