// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLDocument {

    /// A MusicXML version number.
    public struct Version {

        // MARK: Public Initializers

        /// Creates a new version number with the provided major and minor
        /// components.
        ///
        /// - Parameter major: The major version number.
        /// - Parameter minor: The minor version number.
        public init(major: UInt,
                    minor: UInt) {
            self.major = major
            self.minor = minor
        }

        // MARK: Public Instance Properties

        /// The major version number.
        public let major: UInt

        /// The minor version number.
        public let minor: UInt
    }
}

// MARK: -

extension MXLDocument.Version {

    // MARK: Public Type Properties

    /// The most recent MusicXML version supported by this package.
    public static let current = v4_0

    /// All MusicXML versions supported by this package, in ascending order.
    public static let supported = [v1_0, v1_1, v2_0, v3_0, v3_1, v4_0]

    // MARK: Internal Type Properties

    internal static let v1_0 = Self(major: 1,   // swiftlint:disable:this identifier_name
                                    minor: 0)
    internal static let v1_1 = Self(major: 1,   // swiftlint:disable:this identifier_name
                                    minor: 1)
    internal static let v2_0 = Self(major: 2,   // swiftlint:disable:this identifier_name
                                    minor: 0)
    internal static let v3_0 = Self(major: 3,   // swiftlint:disable:this identifier_name
                                    minor: 0)
    internal static let v3_1 = Self(major: 3,   // swiftlint:disable:this identifier_name
                                    minor: 1)
    internal static let v4_0 = Self(major: 4,   // swiftlint:disable:this identifier_name
                                    minor: 0)
}

// MARK: - Comparable

extension MXLDocument.Version: Comparable {

    // MARK: Public Type Methods

    public static func < (lhs: Self,
                          rhs: Self) -> Bool {
        (lhs.major, lhs.minor) < (rhs.major, rhs.minor)
    }
}

// MARK: - Equatable

extension MXLDocument.Version: Equatable {
}

// MARK: - Hashable

extension MXLDocument.Version: Hashable {
}

// MARK: - Sendable

extension MXLDocument.Version: Sendable {
}
