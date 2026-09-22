// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLContainerTests {
}

// MARK: -

extension MXLContainerTests {
    @Test
    func equality() {
        #expect(MXLContainer(rootfiles: [MXLContainer.Rootfile(fullPath: "a.xml")]) ==    // swiftlint:disable:this identical_operands
                 MXLContainer(rootfiles: [MXLContainer.Rootfile(fullPath: "a.xml")]))
    }

    @Test
    func hashable() {
        let values: Set<MXLContainer> = [MXLContainer(rootfiles: [MXLContainer.Rootfile(fullPath: "a.xml")]),
                                         MXLContainer(rootfiles: [MXLContainer.Rootfile(fullPath: "a.xml")]),
                                         MXLContainer(rootfiles: [MXLContainer.Rootfile(fullPath: "b.xml")])]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLContainer(rootfiles: [MXLContainer.Rootfile(fullPath: "a.xml")]) !=
                 MXLContainer(rootfiles: [MXLContainer.Rootfile(fullPath: "b.xml")]))
    }

    @Test
    func init_defaultValues() {
        let value = MXLContainer()

        #expect(value.rootfiles.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let rootfiles = [MXLContainer.Rootfile(fullPath: "a.xml")]
        let value = MXLContainer(rootfiles: rootfiles)

        #expect(value.rootfiles == rootfiles)
    }
}
