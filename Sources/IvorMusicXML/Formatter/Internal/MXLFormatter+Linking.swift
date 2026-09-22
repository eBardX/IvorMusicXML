// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLFormatter.Writer {

    // MARK: Internal Instance Methods

    internal mutating func writeBookmark(_ bookmark: MXLBookmark) {
        var attributes: [(MXLAttributeName, String)] = [(.id, bookmark.id)]

        if let name = bookmark.name {
            attributes.append((.name, name))
        }

        attributes += elementPositionAttributes(bookmark.elementPosition)

        writeEmptyElement(.bookmark,
                          attributes: attributes)
    }

    internal mutating func writeLink(_ link: MXLLink) {
        var attributes = xlinkAttributes(link.xlink)

        if let name = link.name {
            attributes.append((.name, name))
        }

        attributes += elementPositionAttributes(link.elementPosition)
        attributes += positionAttributes(link.position)

        writeEmptyElement(.link,
                          attributes: attributes)
    }

    internal func xlinkAttributes(_ xlink: MXLXLink) -> [(MXLAttributeName, String)] {
        var attributes: [(MXLAttributeName, String)] = [(.xlinkHref, xlink.href)]

        attributes.append((.xlinkActuate, _formatXLinkActuate(xlink.actuate)))

        if let role = xlink.role {
            attributes.append((.xlinkRole, role))
        }

        attributes.append((.xlinkShow, _formatXLinkShow(xlink.show)))

        if let title = xlink.title {
            attributes.append((.xlinkTitle, title))
        }

        return attributes
    }

    // MARK: Private Instance Methods

    private func _formatXLinkActuate(_ value: MXLXLink.Actuate) -> String {
        switch value {
        case .onLoad:
            "onLoad"

        case .onRequest:
            "onRequest"

        case .other:
            "other"

        case .unspecified:
            "none"
        }
    }

    private func _formatXLinkShow(_ value: MXLXLink.Show) -> String {
        switch value {
        case .embed:
            "embed"

        case .new:
            "new"

        case .other:
            "other"

        case .replace:
            "replace"

        case .undefined:
            "none"
        }
    }
}
