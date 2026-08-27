// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLDistance {

    /// The distance-type defines what type of distance is being defined in a distance element. Values include beam
    /// and hyphen. This is left as a string so that other application-specific types can be defined, but it is made
    /// a separate type so that it can be redefined more strictly.
    public typealias Kind = String
}
