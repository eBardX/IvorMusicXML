// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLLineWidth {

    /// The line-width-type defines what type of line is being defined in a line-width element. Values include beam,
    /// bracket, dashes, enclosure, ending, extend, heavy barline, leger, light barline, octave shift, pedal, slur
    /// middle, slur tip, staff, stem, tie middle, tie tip, tuplet bracket, and wedge. This is left as a string so
    /// that other application-specific types can be defined, but it is made a separate type so that it can be
    /// redefined more strictly.
    public typealias Kind = String
}
