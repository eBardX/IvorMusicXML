// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools
import XestiXML

struct MXLAttributeNameTests {
}

// MARK: -

extension MXLAttributeNameTests {
    @Test
    func description() {
        #expect(MXLAttributeName.beats.description == "beats")
        #expect(MXLAttributeName.color.description == "color")
    }

    @Test
    func equality() {
        #expect(MXLAttributeName.beats == .beats)
        #expect(MXLAttributeName.color == .color)
    }

    @Test
    func inequality() {
        #expect(MXLAttributeName.beats != .color)
        #expect(MXLAttributeName.type != .number)
    }

    @Test
    func namespaceNameAndURI() {
        #expect(MXLAttributeName.color.name == "color")
        #expect(MXLAttributeName.color.uri == nil)
        #expect(MXLAttributeName.xlinkHref.name == "href")
        #expect(MXLAttributeName.xlinkHref.uri == "http://www.w3.org/1999/xlink")
        #expect(MXLAttributeName.xmlLang.name == "lang")
        #expect(MXLAttributeName.xmlLang.uri == "http://www.w3.org/XML/1998/namespace")
    }

    @Test
    func namespaceQualifiedInitialization() {
        #expect(MXLAttributeName(name: "color",
                                 uri: nil) == .color)
        #expect(MXLAttributeName(name: "href",
                                 uri: "http://www.w3.org/1999/xlink") == .xlinkHref)
        #expect(MXLAttributeName(name: "space",
                                 uri: "http://www.w3.org/XML/1998/namespace") == .xmlSpace)
        #expect(MXLAttributeName(name: "whatever",
                                 uri: "http://example.org/ns") == nil)
    }

    @Test
    func staticPropertyStringValues() {
        #expect(MXLAttributeName.abbreviated.description == "abbreviated")
        #expect(MXLAttributeName.afterBarline.description == "after-barline")
        #expect(MXLAttributeName.bezierOffset.description == "bezier-offset")
        #expect(MXLAttributeName.damperPedal.description == "damper-pedal")
    }

    @Test
    func stringRepresentable() {
        let attr = MXLAttributeName("test-attr")

        #expect(attr.description == "test-attr")
    }
}
