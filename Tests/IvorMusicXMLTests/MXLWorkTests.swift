// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLWorkTests {
}

// MARK: -

extension MXLWorkTests {
    @Test
    func test_initSetsWorkNumber() {
        let work = MXLWork(workNumber: "Op. 27",
                           workTitle: nil)

        #expect(work.workNumber == "Op. 27")
    }

    @Test
    func test_initSetsWorkTitle() {
        let work = MXLWork(workNumber: nil,
                           workTitle: "Moonlight Sonata")

        #expect(work.workTitle == "Moonlight Sonata")
    }

    @Test
    func test_initWithBothProperties() {
        let work = MXLWork(workNumber: "Op. 27, No. 2",
                           workTitle: "Moonlight Sonata")

        #expect(work.workNumber == "Op. 27, No. 2")
        #expect(work.workTitle == "Moonlight Sonata")
    }

    @Test
    func test_initWithNilProperties() {
        let work = MXLWork(workNumber: nil,
                           workTitle: nil)

        #expect(work.workNumber == nil)
        #expect(work.workTitle == nil)
    }
}
