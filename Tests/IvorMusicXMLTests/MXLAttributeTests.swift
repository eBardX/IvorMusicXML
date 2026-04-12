// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLAttributeTests {
}

// MARK: -

extension MXLAttributeTests {
    @Test
    func test_description() {
        #expect(MXLAttribute.beats.description == "beats")
        #expect(MXLAttribute.color.description == "color")
    }

    @Test
    func test_equality() {
        #expect(MXLAttribute.beats == .beats)
        #expect(MXLAttribute.color == .color)
    }

    @Test
    func test_inequality() {
        #expect(MXLAttribute.beats != .color)
        #expect(MXLAttribute.type != .number)
    }

    @Test
    func test_staticPropertyStringValues() {
        #expect(MXLAttribute.abbreviated.description == "abbreviated")
        #expect(MXLAttribute.afterBarline.description == "after-barline")
        #expect(MXLAttribute.bezierOffset.description == "bezier-offset")
        #expect(MXLAttribute.damperPedal.description == "damper-pedal")
    }

    @Test
    func test_stringRepresentable() {
        let attr = MXLAttribute("test-attr")

        #expect(attr.description == "test-attr")
    }
}
