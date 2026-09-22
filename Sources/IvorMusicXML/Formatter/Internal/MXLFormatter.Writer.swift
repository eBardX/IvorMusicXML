// © 2026 John Gary Pusey (see LICENSE.md)

internal import XestiXML

private import XestiTools

extension MXLFormatter {

    // A builder that assembles the XML node tree that `MXLFormatter` hands to
    // `XestiXML.XMLFormatter`.
    //
    // The element stack is kept here rather than in the node tree because the
    // `MXLFormatter+X.swift` functions write in document order — opening an
    // element, writing its children, then closing it — whereas an
    // `XestiXML.XMLNode` is immutable and must be built from the leaves up.
    internal struct Writer {

        // MARK: Internal Initializers

        internal init() {
            self.declaration = nil
            self.documentType = nil
            self.root = nil
            self.stack = []
        }

        // MARK: Private Instance Properties

        private var declaration: XMLDeclaration?
        private var documentType: XMLDocumentType?
        private var root: MXLFormatter.Node?
        private var stack: [(name: MXLElementName,
                             attributes: [MXLAttributeName: String],
                             children: [MXLFormatter.Node])]
    }
}

// MARK: -

extension MXLFormatter.Writer {

    // MARK: Internal Instance Properties

    internal var document: MXLFormatter.Document {
        .init(declaration: declaration,
              documentType: documentType,
              root: root.require())
    }

    // MARK: Internal Instance Methods

    internal mutating func closeElement() {
        let frame = stack.removeLast()

        _append(.init(element: frame.name,
                      attributes: frame.attributes,
                      children: frame.children))
    }

    internal mutating func openElement(_ name: MXLElementName,
                                       attributes: [(MXLAttributeName, String)] = []) {
        stack.append((name, Self._makeAttributes(attributes), []))
    }

    internal mutating func writeEmptyElement(_ name: MXLElementName,
                                             attributes: [(MXLAttributeName, String)] = []) {
        _append(.init(element: name,
                      attributes: Self._makeAttributes(attributes),
                      children: []))
    }

    internal mutating func writeProlog(_ prolog: Prolog,
                                       version: MXLDocument.Version) {
        declaration = .init()
        documentType = .init(name: prolog.name,
                             publicID: "-//Recordare//DTD MusicXML \(version.major).\(version.minor) \(prolog.hierarchy)//EN",
                             systemID: "http://www.musicxml.org/dtds/\(prolog.systemIDStem).dtd")
    }

    internal mutating func writeTextElement(_ name: MXLElementName,
                                            _ text: String,
                                            attributes: [(MXLAttributeName, String)] = []) {
        _append(.init(element: name,
                      attributes: Self._makeAttributes(attributes),
                      children: [.init(text: text)]))
    }

    // MARK: Private Type Methods

    private static func _makeAttributes(_ attributes: [(MXLAttributeName, String)]) -> [MXLAttributeName: String] {
        .init(attributes) { _, last in last }
    }

    // MARK: Private Instance Methods

    private mutating func _append(_ node: MXLFormatter.Node) {
        guard !stack.isEmpty
        else { root = node; return }

        stack[stack.count - 1].children.append(node)
    }
}
