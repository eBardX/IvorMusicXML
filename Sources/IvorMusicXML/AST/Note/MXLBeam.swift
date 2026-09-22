// © 2026 John Gary Pusey (see LICENSE.md)

private import XestiTools

/// Beam values include begin, continue, end, forward hook, and backward hook. Up to eight concurrent beams are
/// available to cover up to 1024th notes. Each beam in a note is represented with a separate beam element,
/// starting with the eighth note beam using a number attribute of 1.
///
/// Note that the beam number does not distinguish sets of beams that overlap, as it does for slur and other
/// elements. Beaming groups are distinguished by being in different voices and/or the presence or absence of
/// grace and cue elements.
///
/// Beams that have a begin value can also have a fan attribute to indicate accelerandos and ritardandos using
/// fanned beams. The fan attribute may also be used with a continue value if the fanning direction changes on
/// that note. The value is “none” if not specified.
///
/// The repeater attribute has been deprecated in MusicXML 3.0. Formerly used for tremolos, it needs to be
/// specified with a “yes” value for each beam using it.
///
/// Maps the MusicXML `<beam>` element.
public struct MXLBeam {

    // MARK: Public Initializers

    /// Creates a new `MXLBeam`.
    ///
    /// - Parameter id:        The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter value:     The value of this element.
    /// - Parameter number:    Defaults to `1`.
    /// - Parameter repeater:  A Boolean value indicating whether this beam has a repeater, formerly used for tremolos. Deprecated in MusicXML 3.0.
    /// - Parameter fan:       Indicates accelerandos and ritardandos using fanned beams, or `none` if not specified.
    /// - Parameter color:     The color attribute group indicates the color of an element.
    public init(id: String? = nil,
                value: MXLBeamValue,
                number: MXLBeamLevel? = nil,
                repeater: Bool? = nil,
                fan: MXLFan? = nil,
                color: MXLColor? = nil) {
        self.color = color
        self.fan = fan
        self.id = id
        self.number = number ?? 1
        self.repeater = repeater
        self.value = value
    }

    // MARK: Public Instance Properties

    /// The color attribute group indicates the color of an element.
    public let color: MXLColor?

    /// Indicates accelerandos and ritardandos using fanned beams, or `none` if not specified.
    ///
    /// Maps to the MusicXML `fan` attribute.
    public let fan: MXLFan?

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?

    /// Defaults to `1`.
    ///
    /// Maps to the MusicXML `number` attribute.
    public let number: MXLBeamLevel

    /// A Boolean value indicating whether this beam has a repeater, formerly used for tremolos. Deprecated in
    /// MusicXML 3.0.
    ///
    /// Maps to the MusicXML `repeater` attribute.
    public let repeater: Bool?

    /// The value of this element.
    public let value: MXLBeamValue
}

// MARK: - Equatable

extension MXLBeam: Equatable {
}

// MARK: - Hashable

extension MXLBeam: Hashable {
}

// MARK: - Sendable

extension MXLBeam: Sendable {
}
