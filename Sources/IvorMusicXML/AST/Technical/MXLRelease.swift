// © 2026 John Gary Pusey (see LICENSE.md)

/// The release type indicates that a bend is a release rather than a normal bend or pre-bend. The offset
/// attribute specifies where the release starts in terms of divisions relative to the current note. The first-
/// beat and last-beat attributes of the parent bend element are relative to the original note position, not this
/// offset value.
///
/// Maps the MusicXML `<release>` element.
public struct MXLRelease {

    // MARK: Public Initializers

    /// Creates a new `MXLRelease`.
    ///
    /// - Parameter offset:  The release type indicates that a bend is a release rather than a normal bend or pre-bend. The offset attribute specifies where the release starts in terms of divisions relative to the current note. The first-beat and last-beat attributes of the parent bend element are relative to the original note position, not this offset value.
    public init(offset: MXLDivisions? = nil) {
        self.offset = offset
    }

    // MARK: Public Instance Properties

    /// The release type indicates that a bend is a release rather than a normal bend or pre-bend. The offset
    /// attribute specifies where the release starts in terms of divisions relative to the current note. The first-
    /// beat and last-beat attributes of the parent bend element are relative to the original note position, not this
    /// offset value.
    ///
    /// Maps to the MusicXML `offset` attribute.
    public let offset: MXLDivisions?
}

// MARK: - Equatable

extension MXLRelease: Equatable {
}

// MARK: - Hashable

extension MXLRelease: Hashable {
}

// MARK: - Sendable

extension MXLRelease: Sendable {
}
