// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLArticulations {

    /// One of the alternatives for Articulations.
    public enum Item {
        /// The accent element indicates a regular horizontal accent mark.
        case accent(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The breath-mark element indicates a place to take a breath.
        case breathMark(MXLBreathMark)

        /// The caesura element indicates a slight pause.
        case caesura(MXLCaesura)

        /// The detached-legato element indicates the combination of a tenuto line and staccato dot symbol.
        case detachedLegato(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The doit element is an indeterminate slide attached to a single note. The doit appears after the main note and
        /// goes above the main pitch.
        case doit(MXLEmptyLine)

        /// The falloff element is an indeterminate slide attached to a single note. The falloff appears after the main
        /// note and goes below the main pitch.
        case falloff(MXLEmptyLine)

        /// The other-articulation element is used to define any articulations not yet in the MusicXML format. The smufl
        /// attribute can be used to specify a particular articulation, allowing application interoperability without
        /// requiring every SMuFL articulation to have a MusicXML element equivalent. Using the other-articulation element
        /// without the smufl attribute allows for extended representation, though without application interoperability.
        case otherArticulation(MXLOtherPlacementText)

        /// The plop element is an indeterminate slide attached to a single note. The plop appears before the main note
        /// and comes from above the main pitch.
        case plop(MXLEmptyLine)

        /// The scoop element is an indeterminate slide attached to a single note. The scoop appears before the main note
        /// and comes from below the main pitch.
        case scoop(MXLEmptyLine)

        /// The soft-accent element indicates a soft accent that is not as heavy as a normal accent. It is often notated
        /// as <>. It can be combined with other articulations to implement the first eight symbols in the SMuFL
        /// Articulation supplement range.
        case softAccent(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The spiccato element is used for a stroke articulation, as opposed to a dot or a wedge.
        case spiccato(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The staccatissimo element is used for a wedge articulation, as opposed to a dot or a stroke.
        case staccatissimo(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The staccato element is used for a dot articulation, as opposed to a stroke or a wedge.
        case staccato(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The stress element indicates a stressed note.
        case stress(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The strong-accent element indicates a vertical accent mark.
        case strongAccent(MXLStrongAccent)

        /// The tenuto element indicates a tenuto line symbol.
        case tenuto(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)

        /// The unstress element indicates an unstressed note. It is often notated using a u-shaped symbol.
        case unstress(position: MXLPosition, font: MXLFont, color: MXLColor?, placement: MXLAboveBelow?)
    }
}

// MARK: - Equatable

extension MXLArticulations.Item: Equatable {
}

// MARK: - Hashable

extension MXLArticulations.Item: Hashable {
}

// MARK: - Sendable

extension MXLArticulations.Item: Sendable {
}
