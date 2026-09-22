// © 2026 John Gary Pusey (see LICENSE.md)

/// The harmon-closed type represents whether the harmon mute is closed, open, or half-open. The optional location
/// attribute indicates which portion of the symbol is filled in when the element value is half.
///
/// Maps the MusicXML `<harmon-closed>` element.
public struct MXLHarmonClosed {

    // MARK: Public Initializers

    /// Creates a new `MXLHarmonClosed`.
    ///
    /// - Parameter value:     The value of this element.
    /// - Parameter location:  Indicates which portion of the symbol is filled in when the value is half.
    public init(value: Value,
                location: Location? = nil) {
        self.location = location
        self.value = value
    }

    // MARK: Public Instance Properties

    /// Indicates which portion of the symbol is filled in when the value is half.
    ///
    /// Maps to the MusicXML `location` attribute.
    public let location: Location?

    /// The value of this element.
    public let value: Value
}

// MARK: - Equatable

extension MXLHarmonClosed: Equatable {
}

// MARK: - Hashable

extension MXLHarmonClosed: Hashable {
}

// MARK: - Sendable

extension MXLHarmonClosed: Sendable {
}
