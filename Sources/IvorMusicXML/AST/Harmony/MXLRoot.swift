// © 2026 John Gary Pusey (see LICENSE.md)

/// The root type indicates a pitch like C, D, E vs. a scale degree like 1, 2, 3. It is used with chord symbols in
/// popular music. The root element has a root-step and optional root-alter element similar to the step and alter
/// elements, but renamed to distinguish the different musical meanings.
///
/// Maps the MusicXML `<root>` element.
public struct MXLRoot {

    // MARK: Public Initializers

    /// Creates a new `MXLRoot`.
    ///
    /// - Parameter step: The pitch step of the root of the current chord.
    /// - Parameter alter: The root-alter element represents the chromatic alteration of the root of the current chord within the harmony element. In some chord styles, the text for the root-step element may include root-alter information. In that case, the print-object attribute of the root-alter element can be set to no. The location attribute indicates whether the alteration should appear to the left or the right of the root-step; it is right by default.
    public init(step: Step,
                alter: MXLHarmonyAlter? = nil) {
        self.alter = alter
        self.step = step
    }

    // MARK: Public Instance Properties

    /// The root-alter element represents the chromatic alteration of the root of the current chord within the harmony
    /// element. In some chord styles, the text for the root-step element may include root-alter information. In that
    /// case, the print-object attribute of the root-alter element can be set to no. The location attribute indicates
    /// whether the alteration should appear to the left or the right of the root-step; it is right by default.
    ///
    /// Maps to a nested MusicXML `<root-alter>` element.
    public let alter: MXLHarmonyAlter?

    /// The pitch step of the root of the current chord.
    ///
    /// Maps to a nested MusicXML `<root-step>` element.
    public let step: Step
}

// MARK: - Equatable

extension MXLRoot: Equatable {
}

// MARK: - Hashable

extension MXLRoot: Hashable {
}

// MARK: - Sendable

extension MXLRoot: Sendable {
}
