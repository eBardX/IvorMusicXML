// © 2025–2026 John Gary Pusey (see LICENSE.md)

public import Foundation

internal import XestiXML

private import XestiArchive
private import XestiTools

/// A parser for MusicXML documents.
public struct MXLParser {

    // MARK: Public Initializers

    /// Creates a new MusicXML parser.
    public init() {
    }
}

// MARK: -

extension MXLParser {

    // MARK: Public Instance Methods

    /// Parses a MusicXML document from the provided data.
    ///
    /// - Parameter data:           The data to parse.
    /// - Parameter compressed:     A Boolean value indicating whether the data
    ///                             is in compressed (`.mxl`) format.
    ///
    /// - Returns:  The ``MXLDocument`` parsed from the provided data, together
    ///             with any ``MXLParser/Diagnostic`` the parse produced. The
    ///             diagnostics are empty for a document with nothing worth
    ///             reporting; they never indicate a recovered error.
    ///
    /// - Throws:   ``MXLParser/Error`` if the data cannot be parsed.
    public func parse(_ data: Data,
                      compressed: Bool) throws(Error) -> (MXLDocument, [Diagnostic]) {
        if compressed {
            let arcFile = try Self._unzip(data)

            let container = try Self._parseContainer(Self._readContainerData(from: arcFile))

            return try Self._parse(Self._readRootData(from: arcFile,
                                                      in: container))
        }

        return try Self._parse(data)
    }

    // MARK: Internal Type Aliases

    internal typealias BaseParser = XestiXML.XMLParser<MXLElementName, MXLAttributeName>
    internal typealias Node       = XestiXML.XMLNode<MXLElementName, MXLAttributeName>

    // MARK: Internal Type Properties

    internal static let validMediaTypes = [MXLContainer.Rootfile.uncompressedMediaType,
                                           MXLContainer.Rootfile.oldUncompressedMediaType]

    // MARK: Private Type Properties

    private static let containerFileName     = "container.xml"
    private static let metaInfoDirectoryName = "META-INF"

    // MARK: Private Type Methods

    private static func _parse(_ data: Data) throws(Error) -> (MXLDocument, [Diagnostic]) {
        do {
            return try parse(data)
        } catch let error as BaseParser.Error {
            throw Error.parseFailure(error)
        } catch let error as Node.Error {
            throw Error.parseFailure(error)
        } catch {
            throw Error.parseFailure(error as NSError)
        }
    }

    private static func _parseContainer(_ data: Data) throws(Error) -> MXLContainer {
        do {
            return try parseContainer(data)
        } catch let error as BaseParser.Error {
            throw Error.parseFailure(error)
        } catch let error as Node.Error {
            throw Error.parseFailure(error)
        } catch {
            throw Error.parseFailure(error as NSError)
        }
    }

    private static func _readContainerData(from file: FileWrapper) throws(Error) -> Data {
        do {
            return try file.findFile([metaInfoDirectoryName,
                                      containerFileName]).contentsOfRegularFile()
        } catch {
            throw Error.parseFailure(error as NSError)
        }
    }

    private static func _readRootData(from file: FileWrapper,
                                      in container: MXLContainer) throws(Error) -> Data {
        guard let rootFile = container.rootfiles.first
        else { throw MXLParser.Error.noRootFileFound }

        let mediaType = rootFile.mediaType ?? MXLContainer.Rootfile.defaultMediaType

        guard Self.validMediaTypes.contains(mediaType)
        else { throw MXLParser.Error.invalidRootFileMediaType(mediaType) }

        do {
            return try file.findFile([rootFile.fullPath]).contentsOfRegularFile()
        } catch {
            throw Error.parseFailure(error as NSError)
        }
    }

    private static func _unzip(_ data: Data) throws(Error) -> FileWrapper {
        do {
            return try data.unzip()
        } catch {
            throw Error.parseFailure(error as NSError)
        }
    }
}

// MARK: - Sendable

extension MXLParser: Sendable {
}
