// © 2026 John Gary Pusey (see LICENSE.md)

/// The first-fret type indicates which fret is shown in the top space of the frame; it is fret 1 if the element
/// is not present. The optional text attribute indicates how this is represented in the fret diagram, while the
/// location attribute indicates whether the text appears to the left or right of the frame.
///
/// Maps the MusicXML `<first-fret>` element.
public struct MXLFirstFret {

    // MARK: Public Initializers

    /// Creates a new `MXLFirstFret`.
    ///
    /// - Parameter value: The value of this element.
    /// - Parameter text:  Indicates how this is represented in the fret diagram.
    /// - Parameter location:  Indicates whether the text appears to the left or right of the frame.
    public init(value: Int,
                text: String? = nil,
                location: MXLLeftRight? = nil) {
        self.location = location
        self.text = text
        self.value = value
    }

    // MARK: Public Instance Properties

    /// Indicates whether the text appears to the left or right of the frame.
    ///
    /// Maps to the MusicXML `location` attribute.
    public let location: MXLLeftRight?

    /// Indicates how this is represented in the fret diagram.
    ///
    /// Maps to the MusicXML `text` attribute.
    public let text: String?

    /// The value of this element.
    public let value: Int
}

// MARK: - Equatable

extension MXLFirstFret: Equatable {
}

// MARK: - Hashable

extension MXLFirstFret: Hashable {
}

// MARK: - Sendable

extension MXLFirstFret: Sendable {
}
