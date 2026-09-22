// © 2026 John Gary Pusey (see LICENSE.md)

/// One of the alternatives for a music item.
public enum MXLMusicItem {
    /// The `attributes` alternative.
    case attributes(MXLAttributes)

    /// The `backup` alternative.
    case backup(MXLBackup)

    /// The `barline` alternative.
    case barline(MXLBarline)

    /// The `bookmark` alternative.
    case bookmark(MXLBookmark)

    /// The `direction` alternative.
    case direction(MXLDirection)

    /// The `figured-bass` alternative.
    case figuredBass(MXLFiguredBass)

    /// The `forward` alternative.
    case forward(MXLForward)

    /// The `grouping` alternative.
    case grouping(MXLGrouping)

    /// The `harmony` alternative.
    case harmony(MXLHarmony)

    /// The `link` alternative.
    case link(MXLLink)

    /// The `listening` alternative.
    case listening(MXLListening)

    /// The `note` alternative.
    case note(MXLNote)

    /// The `print` alternative.
    case print(MXLPrint)

    /// The `sound` alternative.
    case sound(MXLSound)
}

// MARK: - Equatable

extension MXLMusicItem: Equatable {
}

// MARK: - Hashable

extension MXLMusicItem: Hashable {
}

// MARK: - Sendable

extension MXLMusicItem: Sendable {
}
