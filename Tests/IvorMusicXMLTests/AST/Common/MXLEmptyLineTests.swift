// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLEmptyLineTests {
}

// MARK: -

extension MXLEmptyLineTests {
    @Test
    func equality() {
        #expect(MXLEmptyLine(printStyle: MXLPrintStyle()) ==    // swiftlint:disable:this identical_operands
                 MXLEmptyLine(printStyle: MXLPrintStyle()))
    }

    @Test
    func hashable() {
        let values: Set<MXLEmptyLine> = [MXLEmptyLine(printStyle: MXLPrintStyle()),
                                         MXLEmptyLine(printStyle: MXLPrintStyle()),
                                         MXLEmptyLine(shape: .curved, printStyle: MXLPrintStyle())]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLEmptyLine(printStyle: MXLPrintStyle()) !=
                 MXLEmptyLine(shape: .curved, printStyle: MXLPrintStyle()))
    }

    @Test
    func init_defaultValues() {
        let value = MXLEmptyLine(printStyle: MXLPrintStyle())

        #expect(value.dashedFormatting == MXLDashedFormatting())
        #expect(value.kind == nil)
        #expect(value.length == nil)
        #expect(value.placement == nil)
        #expect(value.shape == nil)
    }

    @Test
    func init_explicitValues() {
        let dashedFormatting = MXLDashedFormatting(dashLength: 1, spaceLength: 2)
        let value = MXLEmptyLine(shape: .curved,
                                 kind: .dashed,
                                 length: .medium,
                                 dashedFormatting: dashedFormatting,
                                 printStyle: MXLPrintStyle(),
                                 placement: .above)

        #expect(value.dashedFormatting == dashedFormatting)
        #expect(value.kind == .dashed)
        #expect(value.length == .medium)
        #expect(value.placement == .above)
        #expect(value.shape == .curved)
    }
}
