// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLStick {

    /// The stick-material type represents the material being displayed in a stick pictogram.
    ///
    /// Maps the MusicXML `<stick-material>` element.
    public enum Material {

        /// A hard material.
        case hard

        /// A medium-hardness material.
        case medium

        /// A shaded material.
        case shaded

        /// A soft material.
        case soft

        /// An unspecified material, shown with an x.
        case x
    }
}

// MARK: - Equatable

extension MXLStick.Material: Equatable {
}

// MARK: - Hashable

extension MXLStick.Material: Hashable {
}

// MARK: - Sendable

extension MXLStick.Material: Sendable {
}
