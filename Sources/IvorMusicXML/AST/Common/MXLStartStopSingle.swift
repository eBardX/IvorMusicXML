// © 2026 John Gary Pusey (see LICENSE.md)

/// The start-stop-single type is used for an attribute of musical elements that can be used for either multi-note
/// or single-note musical elements, as for groupings.
///
/// When multiple elements with the same tag are used within the same note, their order within the MusicXML
/// document should match the musical score order.
public enum MXLStartStopSingle {

    /// A single-note musical element.
    case single

    /// The start of a multi-note musical element.
    case start

    /// The end of a multi-note musical element.
    case stop
}

// MARK: - Equatable

extension MXLStartStopSingle: Equatable {
}

// MARK: - Hashable

extension MXLStartStopSingle: Hashable {
}

// MARK: - Sendable

extension MXLStartStopSingle: Sendable {
}
