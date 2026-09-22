// © 2026 John Gary Pusey (see LICENSE.md)

extension MXLNormalizer {

    // The MusicXML 1.0 to 1.1 migration pass. Implements migration row M1 of
    // `Design/MigrationTable.md`: the deprecated `<print>` `staff-spacing`
    // attribute is replaced by a `<staff-layout>` `<staff-distance>`
    // element.
    internal struct Pass1_0 {   // swiftlint:disable:this type_name

        // MARK: Internal Initializers

        internal init() {
        }
    }
}

// MARK: -

extension MXLNormalizer.Pass1_0 {

    // MARK: Internal Instance Methods

    internal func apply(to score: MXLScorePartwise) -> (MXLScorePartwise, [MXLNormalizer.Change]) {
        var changes: [MXLNormalizer.Change] = []

        let edited = score.mappingMusicItems { item in
            guard case let .print(print) = item,
                  let migrated = Self._migrate(print, &changes)
            else { return item }

            return .print(migrated)
        }

        return (edited, changes)
    }

    // MARK: Private Type Methods

    private static func _migrate(_ print: MXLPrint,
                                 _ changes: inout [MXLNormalizer.Change]) -> MXLPrint? {
        guard let staffSpacing = print.attributes.staffSpacing
        else { return nil }

        let layout = print.layout.staffLayout.isEmpty
            ? MXLLayout(pageLayout: print.layout.pageLayout,
                        systemLayout: print.layout.systemLayout,
                        staffLayout: [MXLStaffLayout(staffDistance: staffSpacing)])
            : print.layout

        let attributes = MXLPrint.Attributes(staffSpacing: nil,
                                             startsNewSystem: print.attributes.startsNewSystem,
                                             startsNewPage: print.attributes.startsNewPage,
                                             blankPage: print.attributes.blankPage,
                                             pageNumber: print.attributes.pageNumber)

        changes.append(.replacedConstruct("print/@staff-spacing", "staff-layout/staff-distance"))

        return MXLPrint(id: print.id,
                        layout: layout,
                        measureLayout: print.measureLayout,
                        measureNumbering: print.measureNumbering,
                        partNameDisplay: print.partNameDisplay,
                        partAbbreviationDisplay: print.partAbbreviationDisplay,
                        attributes: attributes)
    }
}
