// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLDegree.Kind {

    /// The degree-type-value type indicates whether the current degree element is an addition, alteration, or
    /// subtraction to the kind of the current chord in the harmony element.
    public enum Value {

        /// An addition to the kind of the current chord.
        case add

        /// An alteration to the kind of the current chord.
        case alter

        /// A subtraction from the kind of the current chord.
        case subtract
    }
}

// MARK: - Equatable

extension MXLDegree.Kind.Value: Equatable {
}

// MARK: - Hashable

extension MXLDegree.Kind.Value: Hashable {
}

// MARK: - Sendable

extension MXLDegree.Kind.Value: Sendable {
}
