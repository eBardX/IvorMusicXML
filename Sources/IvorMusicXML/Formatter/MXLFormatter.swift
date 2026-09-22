// © 2026 John Gary Pusey (see LICENSE.md)

public import Foundation

internal import XestiXML

private import XestiArchive
private import XestiTools

/// A type that formats a MusicXML document as XML data.
public struct MXLFormatter {

    // MARK: Public Initializers

    /// Creates a new MusicXML formatter.
    public init() {
    }
}

// MARK: -

extension MXLFormatter {

    // MARK: Public Instance Methods

    /// Formats the provided document as MusicXML data.
    ///
    /// A part-wise score and an opus can both be written — both are document
    /// elements a MusicXML root file may have. A time-wise score cannot; it must
    /// first be converted to part-wise by ``MXLNormalizer/normalize(_:)``, so a
    /// document taken through the canonical pipeline never reaches here still
    /// time-wise.
    ///
    /// Compressed (`.mxl`) output wraps the root file in a Zip archive alongside
    /// a synthesized `META-INF/container.xml` naming its entry, inverting the
    /// read path in ``MXLParser/parse(_:compressed:)``.
    ///
    /// - Parameter document:    The document to format.
    /// - Parameter compressed:  A Boolean value indicating whether to produce
    ///                           compressed (`.mxl`) output.
    ///
    /// - Returns:  The MusicXML representation of the document.
    ///
    /// - Throws:   ``Error/notValidated`` if ``MXLDocument/isValidated`` is
    ///             `false`; call ``MXLValidator/validate(_:)`` first.
    ///             ``Error/unsupportedTimewise`` if the document content is a
    ///             time-wise score. ``Error/writeFailure(_:)`` if the document
    ///             cannot be serialized, or if compressed output is requested
    ///             but the archive cannot be created.
    public func format(_ document: MXLDocument,
                       compressed: Bool) throws(Error) -> Data {
        guard document.isValidated
        else { throw Error.notValidated }

        var writer = Writer()

        try writer.writeDocument(document.content)

        let data = try Self._serialize(writer.document,
                                       using: Self.linkingFormatter)

        guard compressed
        else { return data }

        return try Self._compress(data,
                                  entryName: Self._entryName(for: document.content))
    }

    // MARK: Internal Type Aliases

    internal typealias BaseFormatter = XestiXML.XMLFormatter<MXLElementName, MXLAttributeName>
    internal typealias Document      = XestiXML.XMLDocument<MXLElementName, MXLAttributeName>
    internal typealias Namespace     = BaseFormatter.Namespace
    internal typealias Node          = XestiXML.XMLNode<MXLElementName, MXLAttributeName>

    // MARK: Internal Type Properties

    // The engine that serializes a document root that can carry XLink
    // attributes — a score or an opus.
    //
    // The XLink namespace is declared unconditionally, because binding it
    // only when an XLink attribute is actually present would make the root
    // element vary from file to file. An opus needs it for `<opus-link>` and
    // `<score>` just as a score needs it for `<link>` and `<bookmark>`.
    internal static let linkingFormatter = BaseFormatter(options: .init(indentation: indentation,
                                                                        namespaces: [Namespace(prefix: MXLAttributeName.xlinkPrefix,
                                                                                               uri: MXLAttributeName.xlinkNamespaceURI)]))

    // The engine that serializes output that declares no namespaces. The only
    // such output is the synthesized `META-INF/container.xml` of a compressed
    // (`.mxl`) document, which names its root files and nothing else.
    internal static let plainFormatter = BaseFormatter(options: .init(indentation: indentation))

    // MARK: Private Type Properties

    private static let containerFileName     = "container.xml"
    private static let indentation           = 4
    private static let metaInfoDirectoryName = "META-INF"
    private static let opusEntryName         = "opus.musicxml"
    private static let scoreEntryName        = "score.xml"

    // MARK: Private Type Methods

    private static func _compress(_ data: Data,
                                  entryName: String) throws(Error) -> Data {
        let rootFile = FileWrapper(regularFileWithContents: data)

        rootFile.preferredFilename = entryName

        let containerFile = try FileWrapper(regularFileWithContents: _makeContainerData(entryName: entryName))

        containerFile.preferredFilename = containerFileName

        let metaInfoDirectory = FileWrapper(directoryWithFileWrappers: [containerFileName: containerFile])

        metaInfoDirectory.preferredFilename = metaInfoDirectoryName

        let root = FileWrapper(directoryWithFileWrappers: [entryName: rootFile,
                                                           metaInfoDirectoryName: metaInfoDirectory])

        do {
            return try root.zip().contentsOfRegularFile()
        } catch {
            throw Error.writeFailure(error as NSError)
        }
    }

    private static func _entryName(for content: MXLDocument.Content) -> String {
        switch content {
        case .opus:
            opusEntryName

        case .scorePartwise,
             .scoreTimewise:
            scoreEntryName
        }
    }

    private static func _makeContainerData(entryName: String) throws(Error) -> Data {
        let rootfile = Node(element: .rootfile,
                            attributes: [.fullPath: entryName,
                                         .mediaType: MXLContainer.Rootfile.uncompressedMediaType],
                            children: [])
        let rootfiles = Node(element: .rootfiles,
                             attributes: [:],
                             children: [rootfile])
        let container = Node(element: .container,
                             attributes: [:],
                             children: [rootfiles])

        return try _serialize(Document(declaration: XMLDeclaration(version: "1.0",
                                                                   encoding: "UTF-8",
                                                                   isStandalone: false),
                                       root: container),
                              using: plainFormatter)
    }

    private static func _serialize(_ document: Document,
                                   using formatter: BaseFormatter) throws(Error) -> Data {
        do {
            return try formatter.format(document)
        } catch {
            throw Error.writeFailure(error)
        }
    }
}

// MARK: - Sendable

extension MXLFormatter: Sendable {
}
