// © 2026 John Gary Pusey (see LICENSE.md)

/// The y-position attribute group is used for elements like stems where specifying y position is common, but
/// specifying x position is rare.
public struct MXLYPosition {

    // MARK: Public Initializers

    /// Creates a new `MXLYPosition`.
    ///
    /// - Parameter defaultX:   The default horizontal position, in tenths, overriding the application’s computed default position.
    /// - Parameter defaultY:   The default vertical position, in tenths, overriding the application’s computed default position.
    /// - Parameter relativeX:  The horizontal position, in tenths, relative to the default position. Positive values are to the right, negative values to the left.
    /// - Parameter relativeY:  The vertical position, in tenths, relative to the default position. Positive values are up, negative values down.
    public init(defaultX: MXLTenths? = nil,
                defaultY: MXLTenths? = nil,
                relativeX: MXLTenths? = nil,
                relativeY: MXLTenths? = nil) {
        self.defaultX = defaultX
        self.defaultY = defaultY
        self.relativeX = relativeX
        self.relativeY = relativeY
    }

    // MARK: Public Instance Properties

    /// The default horizontal position, in tenths, overriding the application’s computed default position.
    ///
    /// Maps to the MusicXML `default-x` attribute.
    public let defaultX: MXLTenths?

    /// The default vertical position, in tenths, overriding the application’s computed default position.
    ///
    /// Maps to the MusicXML `default-y` attribute.
    public let defaultY: MXLTenths?

    /// The horizontal position, in tenths, relative to the default position. Positive values are to the right,
    /// negative values to the left.
    ///
    /// Maps to the MusicXML `relative-x` attribute.
    public let relativeX: MXLTenths?

    /// The vertical position, in tenths, relative to the default position. Positive values are up, negative values
    /// down.
    ///
    /// Maps to the MusicXML `relative-y` attribute.
    public let relativeY: MXLTenths?
}

// MARK: - Equatable

extension MXLYPosition: Equatable {
}

// MARK: - Hashable

extension MXLYPosition: Hashable {
}

// MARK: - Sendable

extension MXLYPosition: Sendable {
}
