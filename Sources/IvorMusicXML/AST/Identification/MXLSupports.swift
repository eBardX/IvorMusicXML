// © 2026 John Gary Pusey (see LICENSE.md)

/// The supports type indicates if a MusicXML encoding supports a particular MusicXML element. This is recommended
/// for elements like beam, stem, and accidental, where the absence of an element is ambiguous if you do not know
/// if the encoding supports that element. For Version 2.0, the supports element is expanded to allow programs to
/// indicate support for particular attributes or particular values. This lets applications communicate, for
/// example, that all system and/or page breaks are contained in the MusicXML file.
///
/// Maps the MusicXML `<supports>` element.
public struct MXLSupports {

    // MARK: Public Initializers

    /// Creates a new `MXLSupports`.
    ///
    /// - Parameter isSupported: A Boolean value indicating whether the encoding does (`true`) or does not (`false`) support the element.
    /// - Parameter element: The name of the MusicXML element for which support is being indicated.
    /// - Parameter attribute: The name of the specific attribute of the element for which support is being indicated.
    /// - Parameter value: The specific value of the attribute for which support is being indicated.
    public init(isSupported: Bool,
                element: String,
                attribute: String? = nil,
                value: String? = nil) {
        self.attribute = attribute
        self.element = element
        self.isSupported = isSupported
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The name of the specific attribute of the element for which support is being indicated.
    ///
    /// Maps to the MusicXML `attribute` attribute.
    public let attribute: String?

    /// The name of the MusicXML element for which support is being indicated.
    ///
    /// Maps to the MusicXML `element` attribute.
    public let element: String

    /// A Boolean value indicating whether the encoding does (`true`) or does not (`false`) support the element.
    ///
    /// Maps to the MusicXML `type` attribute.
    public let isSupported: Bool

    /// The specific value of the attribute for which support is being indicated.
    public let value: String?
}

// MARK: - Equatable

extension MXLSupports: Equatable {
}

// MARK: - Hashable

extension MXLSupports: Hashable {
}

// MARK: - Sendable

extension MXLSupports: Sendable {
}
