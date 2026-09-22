// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeDocument(_ content: MXLDocument.Content) throws(MXLFormatter.Error) {
        switch content {
        case let .opus(opus):
            writeProlog(.opus,
                        version: opus.version)
            writeOpus(opus)

        case let .scorePartwise(score):
            writeProlog(.partwise,
                        version: score.version)
            writeScorePartwise(score)

        case .scoreTimewise:
            throw MXLFormatter.Error.unsupportedTimewise
        }
    }
}
