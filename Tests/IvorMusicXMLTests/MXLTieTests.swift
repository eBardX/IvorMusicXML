// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLTieTests {
}

// MARK: -

extension MXLTieTests {
    @Test
    func test_addNeitherToAny() {
        #expect(MXLTie.neither + .neither == .neither)
        #expect(MXLTie.start + .neither == .start)
        #expect(MXLTie.stop + .neither == .stop)
        #expect(MXLTie.stopStart + .neither == .stopStart)
    }

    @Test
    func test_addNeitherToAnyYieldsOther() {
        #expect(MXLTie.neither + .start == .start)
        #expect(MXLTie.neither + .stop == .stop)
        #expect(MXLTie.neither + .stopStart == .stopStart)
    }

    @Test
    func test_addSameToSame() {
        #expect(MXLTie.start + .start == .start)
        #expect(MXLTie.stop + .stop == .stop)
    }

    @Test
    func test_addStartAndStop() {
        #expect(MXLTie.start + .stop == .stopStart)
        #expect(MXLTie.stop + .start == .stopStart)
    }

    @Test
    func test_addStopStartToAny() {
        #expect(MXLTie.stopStart + .start == .stopStart)
        #expect(MXLTie.stopStart + .stop == .stopStart)
        #expect(MXLTie.stopStart + .neither == .stopStart)
        #expect(MXLTie.stopStart + .stopStart == .stopStart)
    }

    @Test
    func test_addToStopStart() {
        #expect(MXLTie.start + .stopStart == .stopStart)
        #expect(MXLTie.stop + .stopStart == .stopStart)
        #expect(MXLTie.neither + .stopStart == .stopStart)
    }

    @Test
    func test_cases() {
        #expect(MXLTie.neither == .neither)
        #expect(MXLTie.start == .start)
        #expect(MXLTie.stop == .stop)
        #expect(MXLTie.stopStart == .stopStart)
    }

    @Test
    func test_plusEqualsOperator() {
        var tie = MXLTie.neither

        tie += .start

        #expect(tie == .start)

        tie += .stop

        #expect(tie == .stopStart)
    }
}
