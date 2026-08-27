// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLLevel {

    /// The level-display attribute group specifies three common ways to indicate editorial indications: putting
    /// parentheses or square brackets around a symbol, or making the symbol a different size. If not specified, they
    /// are left to application defaults. It is used by the level and accidental elements.
    public struct Display {

        // MARK: Public Initializers

        /// Creates a new `MXLLevel.Display`.
        ///
        /// - Parameter hasParentheses:  A Boolean value indicating whether the symbol is enclosed in parentheses. Left to application defaults if not specified.
        /// - Parameter hasBracket:      A Boolean value indicating whether the symbol is enclosed in square brackets. Left to application defaults if not specified.
        /// - Parameter size:         The size of the symbol. Left to application defaults if not specified.
        public init(hasParentheses: Bool? = nil,
                    hasBracket: Bool? = nil,
                    size: MXLSymbolSize? = nil) {
            self.hasBracket = hasBracket
            self.hasParentheses = hasParentheses
            self.size = size
        }

        // MARK: Public Instance Properties

        /// A Boolean value indicating whether the symbol is enclosed in square brackets. Left to application defaults
        /// if not specified.
        ///
        /// Maps to the MusicXML `bracket` attribute.
        public let hasBracket: Bool?

        /// A Boolean value indicating whether the symbol is enclosed in parentheses. Left to application defaults if
        /// not specified.
        ///
        /// Maps to the MusicXML `parentheses` attribute.
        public let hasParentheses: Bool?

        /// The size of the symbol. Left to application defaults if not specified.
        ///
        /// Maps to the MusicXML `size` attribute.
        public let size: MXLSymbolSize?
    }
}

// MARK: - Equatable

extension MXLLevel.Display: Equatable {
}

// MARK: - Hashable

extension MXLLevel.Display: Hashable {
}

// MARK: - Sendable

extension MXLLevel.Display: Sendable {
}
