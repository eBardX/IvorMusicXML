// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLWorkTests {
}

// MARK: -

extension MXLWorkTests {
    @Test
    func equality() {
        #expect(MXLWork() == MXLWork())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLWork> = [MXLWork(), MXLWork(), MXLWork(title: "Symphony No. 5")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLWork() != MXLWork(title: "Symphony No. 5"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLWork()

        #expect(value.number == nil)
        #expect(value.opus == nil)
        #expect(value.title == nil)
    }

    @Test
    func init_explicitValues() {
        let opus = MXLXLink(href: "opus.xml")
        let value = MXLWork(number: "Op. 67", title: "Symphony No. 5", opus: opus)

        #expect(value.number == "Op. 67")
        #expect(value.opus == opus)
        #expect(value.title == "Symphony No. 5")
    }
}
