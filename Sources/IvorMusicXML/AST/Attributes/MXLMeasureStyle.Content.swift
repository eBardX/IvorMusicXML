// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLMeasureStyle {

    /// One of the alternatives for MeasureStyle.
    public enum Content {
        /// The beat-repeat element specifies a notation style for repetitions of a single beat.
        case beatRepeat(MXLBeatRepeat)

        /// The measure-repeat element specifies a notation style for repetitions of one or more measures.
        case measureRepeat(MXLMeasureRepeat)

        /// The multiple-rest element indicates a rest spanning multiple measures.
        case multipleRest(MXLMultipleRest)

        /// The slash element indicates that slash notation is to be used.
        case slash(MXLSlash)
    }
}

// MARK: - Equatable

extension MXLMeasureStyle.Content: Equatable {
}

// MARK: - Hashable

extension MXLMeasureStyle.Content: Hashable {
}

// MARK: - Sendable

extension MXLMeasureStyle.Content: Sendable {
}
