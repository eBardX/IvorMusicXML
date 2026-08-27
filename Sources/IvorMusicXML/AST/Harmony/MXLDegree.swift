// © 2026 John Gary Pusey (see LICENSE.md)

/// The degree type is used to add, alter, or subtract individual notes in the chord. The print-object attribute
/// can be used to keep the degree from printing separately when it has already taken into account in the text
/// attribute of the kind element. The degree-value and degree-type text attributes specify how the value and type
/// of the degree should be displayed.
///
/// A harmony of kind “other” can be spelled explicitly by using a series of degree elements together with a root.
///
/// Maps the MusicXML `<degree>` element.
public struct MXLDegree {

    // MARK: Public Initializers

    /// Creates a new `MXLDegree`.
    ///
    /// - Parameter value:  The degree of the chord being added, altered, or subtracted (1 for the root, 3 for third, etc.).
    /// - Parameter alter:  The chromatic alteration for this degree.
    /// - Parameter kind:  Whether this degree is an addition, alteration, or subtraction relative to the kind of the current chord.
    /// - Parameter printsObject: A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not specified.
    public init(value: Value,
                alter: Alter,
                kind: Kind,
                printsObject: Bool? = nil) {
        self.alter = alter
        self.kind = kind
        self.printsObject = printsObject
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The chromatic alteration for this degree.
    ///
    /// Maps to a nested MusicXML `<degree-alter>` element.
    public let alter: Alter

    /// Whether this degree is an addition, alteration, or subtraction relative to the kind of the current chord.
    ///
    /// Maps to a nested MusicXML `<degree-type>` element.
    public let kind: Kind

    /// A Boolean value indicating whether to print an object (e.g. a note or a rest). Defaults to `true` if not
    /// specified.
    ///
    /// Maps to the MusicXML `print-object` attribute.
    public let printsObject: Bool?

    /// The degree of the chord being added, altered, or subtracted (1 for the root, 3 for third, etc.).
    ///
    /// Maps to a nested MusicXML `<degree-value>` element.
    public let value: Value
}

// MARK: - Equatable

extension MXLDegree: Equatable {
}

// MARK: - Hashable

extension MXLDegree: Hashable {
}

// MARK: - Sendable

extension MXLDegree: Sendable {
}
