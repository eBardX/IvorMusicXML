// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLScorePartwise {

    // MARK: Internal Instance Methods

    internal func mappingMusicItems(_ transform: (MXLMusicItem) -> MXLMusicItem) -> MXLScorePartwise {
        _replacingParts(parts.map { part in
            Part(id: part.id,
                 measures: part.measures.map { measure in
                     Part.Measure(id: measure.id,
                                  number: measure.number,
                                  isImplicit: measure.isImplicit,
                                  isNonControlling: measure.isNonControlling,
                                  text: measure.text,
                                  width: measure.width,
                                  items: measure.items.map(transform))
                 })
        })
    }

    internal func mappingPartListItems(_ transform: (MXLPartList.Item) -> MXLPartList.Item) -> MXLScorePartwise {
        _replacingPartList(MXLPartList(items: partList.items.map(transform)))
    }

    internal func withVersion(_ version: MXLDocument.Version) -> MXLScorePartwise {
        MXLScorePartwise(version: version,
                         work: work,
                         movementNumber: movementNumber,
                         movementTitle: movementTitle,
                         identification: identification,
                         defaults: defaults,
                         credit: credit,
                         partList: partList,
                         parts: parts)
    }

    // MARK: Private Instance Methods

    private func _replacingPartList(_ partList: MXLPartList) -> MXLScorePartwise {
        MXLScorePartwise(version: version,
                         work: work,
                         movementNumber: movementNumber,
                         movementTitle: movementTitle,
                         identification: identification,
                         defaults: defaults,
                         credit: credit,
                         partList: partList,
                         parts: parts)
    }

    private func _replacingParts(_ parts: [Part]) -> MXLScorePartwise {
        MXLScorePartwise(version: version,
                         work: work,
                         movementNumber: movementNumber,
                         movementTitle: movementTitle,
                         identification: identification,
                         defaults: defaults,
                         credit: credit,
                         partList: partList,
                         parts: parts)
    }
}
