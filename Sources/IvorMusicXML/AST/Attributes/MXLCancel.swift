// © 2026 John Gary Pusey (see LICENSE.md)

/// A cancel element indicates that the old key signature should be canceled before the new one appears. This
/// will always happen when changing to C major or A minor and need not be specified then. The cancel value
/// matches the fifths value of the canceled key signature (e.g., a cancel of -2 will provide an explicit
/// cancellation for changing from B flat major to F major). The optional location attribute indicates where the
/// cancellation appears relative to the new key signature.
///
/// Maps the MusicXML `<cancel>` element.
public struct MXLCancel {

    // MARK: Public Initializers

    /// Creates a new `MXLCancel`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter location:  Where the cancellation appears relative to the new key signature.
    public init(value: Int,
                location: Location? = nil) {
        self.location = location
        self.value = value
    }

    // MARK: Public Instance Properties

    /// Where the cancellation appears relative to the new key signature.
    ///
    /// Maps to the MusicXML `location` attribute.
    public let location: Location?

    /// The value of this element.
    public let value: Int
}

// MARK: - Equatable

extension MXLCancel: Equatable {
}

// MARK: - Hashable

extension MXLCancel: Hashable {
}

// MARK: - Sendable

extension MXLCancel: Sendable {
}
