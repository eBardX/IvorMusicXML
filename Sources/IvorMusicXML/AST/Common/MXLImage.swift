// © 2026 John Gary Pusey (see LICENSE.md)

/// The image type is used to include graphical images in a score.
///
/// Maps the MusicXML `<credit-image>` and `<image>` elements.
public struct MXLImage {

    // MARK: Public Initializers

    /// Creates a new `MXLImage`.
    ///
    /// - Parameter id: The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the entire document. This attribute group is not used for a required id attribute, or for an id attribute that specifies an id reference.
    /// - Parameter attributes: The image-attributes group is used to include graphical images in a score. The required source attribute is the URL for the image file. The required type attribute is the MIME type for the image file format. Typical choices include application/postscript, image/gif, image/jpeg, image/png, and image/tiff. The optional height and width attributes are used to size and scale an image. The image should be scaled independently in X and Y if both height and width are specified. If only one attribute is specified, the image should be scaled proportionally to fit in the specified dimension.
    public init(id: String? = nil,
                attributes: Attributes) {
        self.attributes = attributes
        self.id = id
    }

    // MARK: Public Instance Properties

    /// The image-attributes group is used to include graphical images in a score. The required source attribute is
    /// the URL for the image file. The required type attribute is the MIME type for the image file format. Typical
    /// choices include application/postscript, image/gif, image/jpeg, image/png, and image/tiff. The optional height
    /// and width attributes are used to size and scale an image. The image should be scaled independently in X and Y
    /// if both height and width are specified. If only one attribute is specified, the image should be scaled
    /// proportionally to fit in the specified dimension.
    public let attributes: Attributes

    /// The optional-unique-id attribute group allows an element to optionally specify an ID that is unique to the
    /// entire document. This attribute group is not used for a required id attribute, or for an id attribute that
    /// specifies an id reference.
    ///
    /// Maps to the MusicXML `id` attribute.
    public let id: String?
}

// MARK: - Equatable

extension MXLImage: Equatable {
}

// MARK: - Hashable

extension MXLImage: Hashable {
}

// MARK: - Sendable

extension MXLImage: Sendable {
}
