// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLOpus {

    // MARK: Internal Instance Properties

    // The lowest `version` declared anywhere in this opus, including nested
    // `<opus>` elements.
    //
    // A pre-2.0 opus has no `version` attribute at all and parses to
    // `MXLDocument.Version.v1_0` via the fallback in `MXLOpus.init`, so this
    // is the version the normalizer reports as the original when it stamps.
    internal var minimumVersion: MXLDocument.Version {
        items.reduce(version) { lowest, item in
            guard case let .opus(opus) = item
            else { return lowest }

            return Swift.min(lowest, opus.minimumVersion)
        }
    }

    // MARK: Internal Instance Methods

    // Returns a copy of this opus stamped with the provided version, at
    // every level of nesting.
    //
    // `opus.xsd` declares a nested `<opus>` as `type="opus"`, which includes
    // the `document-attributes` group, so a nested opus carries its own
    // `version`. Stamping only the root would leave a `version="1.0"` child
    // inside a `version="4.0"` parent, so the stamp recurses.
    internal func withVersion(_ version: MXLDocument.Version) -> MXLOpus {
        MXLOpus(version: version,
                title: title,
                items: items.map { item in
                    switch item {
                    case let .opus(opus):
                        .opus(opus.withVersion(version))

                    case .opusLink,
                         .score:
                        item
                    }
                })
    }
}
