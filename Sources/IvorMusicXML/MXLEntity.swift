// © 2025–2026 John Gary Pusey (see LICENSE.md)

/// A top-level entity parsed from a MusicXML document.
public enum MXLEntity {
    /// A MusicXML container.
    case container(MXLContainer)

    /// A MusicXML opus.
    case opus(MXLOpus)

    /// A part-wise MusicXML score.
    case scorePartwise(MXLScorePW)

    /// A time-wise MusicXML score.
    case scoreTimewise(MXLScoreTW)

    /// A collection of standard sounds.
    case sounds([MXLStandardSound])
}

// MARK: - Sendable

extension MXLEntity: Sendable {
}
