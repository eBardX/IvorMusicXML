// © 2026 John Gary Pusey (see LICENSE.md)

/// The slash group combines elements used for more complete specification of the slash and beat-repeat measure-
/// style elements. They have the same values as the type and dot elements, and define what the beat is for the
/// display of repetition marks. If not present, the beat is based on the current time signature.
public struct MXLSlashContent {

    // MARK: Public Initializers

    /// Creates a new `MXLSlashContent`.
    ///
    /// - Parameter group:        The note type and augmentation dots defining the beat used for the display of repetition marks. If not present, the beat is based on the current time signature.
    /// - Parameter exceptVoice:  The except-voice element is used to specify a combination of slash notation and regular notation. Any note elements that are in voices specified by the except-voice elements are displayed in normal notation, in addition to the slash notation that is always displayed.
    public init(group: Group? = nil,
                exceptVoice: [String] = []) {
        self.exceptVoice = exceptVoice
        self.group = group
    }

    // MARK: Public Instance Properties

    /// The except-voice element is used to specify a combination of slash notation and regular notation. Any note
    /// elements that are in voices specified by the except-voice elements are displayed in normal notation, in
    /// addition to the slash notation that is always displayed.
    ///
    /// Maps to nested MusicXML `<except-voice>` elements.
    public let exceptVoice: [String]

    /// The note type and augmentation dots defining the beat used for the display of repetition marks. If not
    /// present, the beat is based on the current time signature.
    ///
    /// Maps to a nested MusicXML `<slash-type>` element.
    public let group: Group?
}

// MARK: - Equatable

extension MXLSlashContent: Equatable {
}

// MARK: - Hashable

extension MXLSlashContent: Hashable {
}

// MARK: - Sendable

extension MXLSlashContent: Sendable {
}
