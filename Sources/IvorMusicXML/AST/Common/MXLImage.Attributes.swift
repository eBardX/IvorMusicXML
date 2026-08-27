// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLImage {

    /// The image-attributes group is used to include graphical images in a score. The required source attribute is
    /// the URL for the image file. The required type attribute is the MIME type for the image file format. Typical
    /// choices include application/postscript, image/gif, image/jpeg, image/png, and image/tiff. The optional height
    /// and width attributes are used to size and scale an image. The image should be scaled independently in X and Y
    /// if both height and width are specified. If only one attribute is specified, the image should be scaled
    /// proportionally to fit in the specified dimension.
    public struct Attributes {

        // MARK: Public Initializers

        /// Creates a new `MXLImage.Attributes`.
        ///
        /// - Parameter source: The URL for the image file.
        /// - Parameter kind:   The MIME type for the image file format (e.g. `application/postscript`, `image/gif`, `image/jpeg`, `image/png`, or `image/tiff`).
        /// - Parameter height: The height used to size and scale the image. If both `height` and `width` are specified, the image is scaled independently in each dimension; if only one is specified, the image is scaled proportionally to fit that dimension.
        /// - Parameter width:  The width used to size and scale the image. If both `width` and `height` are specified, the image is scaled independently in each dimension; if only one is specified, the image is scaled proportionally to fit that dimension.
        /// - Parameter position: For most elements, any program will compute a default x and y position. The position attributes let this be changed two ways.
        /// - Parameter halign: In cases where text extends over more than one line, horizontal alignment and justify values can be different. The most typical case is for credits, such as:
        /// - Parameter valign: The valign-image attribute is used to indicate vertical alignment for images and graphics, so it removes the baseline value. Defaults are implementation-dependent.
        public init(source: String,
                    kind: String,
                    height: MXLTenths? = nil,
                    width: MXLTenths? = nil,
                    position: MXLPosition = MXLPosition(),
                    halign: MXLLeftCenterRight? = nil,
                    valign: MXLValignImage? = nil) {
            self.halign = halign
            self.height = height
            self.kind = kind
            self.position = position
            self.source = source
            self.valign = valign
            self.width = width
        }

        // MARK: Public Instance Properties

        /// In cases where text extends over more than one line, horizontal alignment and justify values can be different.
        /// The most typical case is for credits, such as:
        ///
        /// Words and music by Pat Songwriter
        ///
        /// Typically this type of credit is aligned to the right, so that the position information refers to the right-
        /// most part of the text. But in this example, the text is center-justified, not right-justified.
        ///
        /// The halign attribute is used in these situations. If it is not present, its value is the same as for the
        /// justify attribute. For elements where a justify attribute is not allowed, the default is implementation-
        /// dependent.
        ///
        /// Maps to the MusicXML `halign` attribute.
        public let halign: MXLLeftCenterRight?

        /// The height used to size and scale the image. If both `height` and `width` are specified, the image is
        /// scaled independently in each dimension; if only one is specified, the image is scaled proportionally to
        /// fit that dimension.
        ///
        /// Maps to the MusicXML `height` attribute.
        public let height: MXLTenths?

        /// The MIME type for the image file format (e.g. `application/postscript`, `image/gif`, `image/jpeg`,
        /// `image/png`, or `image/tiff`).
        ///
        /// Maps to the MusicXML `type` attribute.
        public let kind: String

        /// For most elements, any program will compute a default x and y position. The position attributes let this be
        /// changed two ways.
        ///
        /// The default-x and default-y attributes change the computation of the default position. For most elements, the
        /// origin is changed relative to the left-hand side of the note or the musical position within the bar (x) and
        /// the top line of the staff (y).
        ///
        /// For the following elements, the default-x value changes the origin relative to the start of the current
        /// measure:
        ///
        /// - note - figured-bass - harmony - link - directive - measure-numbering - all descendants of the part-list
        /// element - all children of the direction-type element
        ///
        /// This origin is from the start of the entire measure, at either the left barline or the start of the system.
        ///
        /// When the default-x attribute is used within a child element of the part-name-display, part-abbreviation-
        /// display, group-name-display, or group-abbreviation-display elements, it changes the origin relative to the
        /// start of the first measure on the system. These values are used when the current measure or a succeeding
        /// measure starts a new system. The same change of origin is used for the group-symbol element.
        ///
        /// For the note, figured-bass, and harmony elements, the default-x value is considered to have adjusted the
        /// musical position within the bar for its descendant elements.
        ///
        /// Since the credit-words and credit-image elements are not related to a measure, in these cases the default-x
        /// and default-y attributes adjust the origin relative to the bottom left-hand corner of the specified page.
        ///
        /// The relative-x and relative-y attributes change the position relative to the default position, either as
        /// computed by the individual program, or as overridden by the default-x and default-y attributes.
        ///
        /// Positive x is right, negative x is left; positive y is up, negative y is down. All units are in tenths of
        /// interline space. For stems, positive relative-y lengthens a stem while negative relative-y shortens it.
        ///
        /// The default-x and default-y position attributes provide higher-resolution positioning data than related
        /// features such as the placement attribute and the offset element. Applications reading a MusicXML file that can
        /// understand both features should generally rely on the default-x and default-y attributes for their greater
        /// accuracy. For the relative-x and relative-y attributes, the offset element, placement attribute, and directive
        /// attribute provide context for the relative position information, so the two features should be interpreted
        /// together.
        ///
        /// As elsewhere in the MusicXML format, tenths are the global tenths defined by the scaling element, not the
        /// local tenths of a staff resized by the staff-size element.
        public let position: MXLPosition

        /// The URL for the image file.
        ///
        /// Maps to the MusicXML `source` attribute.
        public let source: String

        /// The valign-image attribute is used to indicate vertical alignment for images and graphics, so it removes the
        /// baseline value. Defaults are implementation-dependent.
        ///
        /// Maps to the MusicXML `valign` attribute.
        public let valign: MXLValignImage?

        /// The width used to size and scale the image. If both `width` and `height` are specified, the image is
        /// scaled independently in each dimension; if only one is specified, the image is scaled proportionally to
        /// fit that dimension.
        ///
        /// Maps to the MusicXML `width` attribute.
        public let width: MXLTenths?
    }
}

// MARK: - Equatable

extension MXLImage.Attributes: Equatable {
}

// MARK: - Hashable

extension MXLImage.Attributes: Hashable {
}

// MARK: - Sendable

extension MXLImage.Attributes: Sendable {
}
