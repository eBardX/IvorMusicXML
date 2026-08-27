// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLFormatterLayoutTests {
}

// MARK: -

extension MXLFormatterLayoutTests {
    @Test
    func format_roundTripsRichPrint() throws {
        let pageMarginsSpans = MXLLeftRightMargins(leftMargin: 80,
                                                   rightMargin: 80)
        let allMargins = MXLAllMargins(leftRightMargins: pageMarginsSpans,
                                       topMargin: 80,
                                       bottomMargin: 80)
        let pageMargins = MXLPageMargins(allMargins: allMargins,
                                         kind: .even)
        let pageGroup = MXLPageLayout.Group(pageHeight: 1_760,
                                            pageWidth: 1_360)
        let pageLayout = MXLPageLayout(group: pageGroup,
                                       pageMargins: [pageMargins])
        let systemSpans = MXLLeftRightMargins(leftMargin: 20,
                                              rightMargin: 20)
        let systemMargins = MXLSystemMargins(leftRightMargins: systemSpans)
        let printStyleAlign = MXLPrintStyleAlign(printStyle: MXLPrintStyle())
        let leftDivider = MXLEmptyPrintObjectStyleAlign(printsObject: true,
                                                        printStyleAlign: printStyleAlign)
        let rightDivider = MXLEmptyPrintObjectStyleAlign(printsObject: false,
                                                         printStyleAlign: printStyleAlign)
        let systemDividers = MXLSystemDividers(leftDivider: leftDivider,
                                               rightDivider: rightDivider)
        let systemLayout = MXLSystemLayout(systemMargins: systemMargins,
                                           systemDistance: 100,
                                           topSystemDistance: 70,
                                           systemDividers: systemDividers)
        let staffLayout = MXLStaffLayout(staffDistance: 65,
                                         number: MXLStaffNumber(uintValue: 2))
        let measureNumbering = MXLMeasureNumbering(value: .system,
                                                   system: .onlyTop,
                                                   staff: MXLStaffNumber(uintValue: 1),
                                                   alwaysShowsOnMultipleRest: true,
                                                   showsRangeOnMultipleRest: false,
                                                   halign: .center,
                                                   valign: .top)
        let partNameDisplay = MXLNameDisplay(items: [.displayText(MXLFormattedText(value: "Violin"))],
                                             printsObject: true)
        let print = MXLPrint(id: "PR1",
                             layout: MXLLayout(pageLayout: pageLayout,
                                               systemLayout: systemLayout,
                                               staffLayout: [staffLayout]),
                             measureLayout: MXLMeasureLayout(measureDistance: 120),
                             measureNumbering: measureNumbering,
                             partNameDisplay: partNameDisplay,
                             attributes: MXLPrint.Attributes(staffSpacing: 40,
                                                             startsNewSystem: true,
                                                             startsNewPage: false,
                                                             blankPage: 1,
                                                             pageNumber: "3"))

        try expectRoundTrip(items: [.print(print)])
    }
}
