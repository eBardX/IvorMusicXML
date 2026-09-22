// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLGlass {

    /// The glass-value type represents pictograms for glass percussion instruments.
    public enum Value {

        /// A pictogram of a glass harmonica.
        case glassHarmonica

        /// A pictogram of a glass harp.
        case glassHarp

        /// A pictogram of wind chimes.
        case windChimes
    }
}

// MARK: - Equatable

extension MXLGlass.Value: Equatable {
}

// MARK: - Hashable

extension MXLGlass.Value: Hashable {
}

// MARK: - Sendable

extension MXLGlass.Value: Sendable {
}
