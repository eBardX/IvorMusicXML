// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPitchLetterTests {
}

// MARK: -

extension MXLPitchLetterTests {
    @Test
    func test_allCases() {
        let a = MXLPitch.Letter.a
        let b = MXLPitch.Letter.b
        let c = MXLPitch.Letter.c
        let d = MXLPitch.Letter.d
        let e = MXLPitch.Letter.e
        let f = MXLPitch.Letter.f
        let g = MXLPitch.Letter.g

        #expect(a != b)
        #expect(b != c)
        #expect(c != d)
        #expect(d != e)
        #expect(e != f)
        #expect(f != g)
        #expect(g != a)
    }

    @Test
    func test_equality() {
        #expect(MXLPitch.Letter.c == .c)
        #expect(MXLPitch.Letter.a == .a)
    }

    @Test
    func test_inequality() {
        #expect(MXLPitch.Letter.a != .b)
        #expect(MXLPitch.Letter.f != .g)
    }
}
