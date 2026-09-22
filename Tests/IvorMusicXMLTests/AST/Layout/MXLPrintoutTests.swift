// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPrintoutTests {
}

// MARK: -

extension MXLPrintoutTests {
    @Test
    func equality() {
        #expect(MXLPrintout() == MXLPrintout())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLPrintout> = [MXLPrintout(), MXLPrintout(), MXLPrintout(printsObject: false)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPrintout() != MXLPrintout(printsObject: false))
    }

    @Test
    func init_defaultValues() {
        let value = MXLPrintout()

        #expect(value.printsDot == true)
        #expect(value.printsLyric == true)
        #expect(value.printsObject == nil)
        #expect(value.printsSpacing == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLPrintout(printsObject: false, printsDot: false, printsSpacing: false, printsLyric: false)

        #expect(value.printsDot == false)
        #expect(value.printsLyric == false)
        #expect(value.printsObject == false)
        #expect(value.printsSpacing == false)
    }
}
