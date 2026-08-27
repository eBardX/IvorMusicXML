// © 2026 John Gary Pusey (see LICENSE.md)

/// The time-only type is used to indicate that a particular playback- or listening-related element only applies
/// particular times through a repeated section. The value is a list of positive integers arranged in ascending
/// order, indicating which times through the repeated section that the element applies.
public typealias MXLTimeOnly = [Int]
