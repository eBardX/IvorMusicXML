// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLParserErrorTests {
}

// MARK: -

extension MXLParserErrorTests {
    @Test
    func categoryIsIvorMusicXML() {
        let error = MXLParser.Error.noRootFileFound

        #expect(error.category?.description == "IvorMusicXML")
    }

    @Test
    func causeIsNilForInvalidRootFileMediaType() {
        let error = MXLParser.Error.invalidRootFileMediaType("text/plain")

        #expect(error.cause == nil)
    }

    @Test
    func causeIsNilForNoRootFileFound() {
        let error = MXLParser.Error.noRootFileFound

        #expect(error.cause == nil)
    }

    @Test
    func causeIsNilForParseFailureWithNil() {
        let error = MXLParser.Error.parseFailure(nil)

        #expect(error.cause == nil)
    }

    @Test
    func causeIsPresentForParseFailureWithError() {
        let inner = MXLParser.Error.noRootFileFound
        let error = MXLParser.Error.parseFailure(inner)

        #expect(error.cause != nil)
    }

    @Test
    func messageForInvalidRootFileMediaType() {
        let error = MXLParser.Error.invalidRootFileMediaType("text/plain")

        #expect(error.message == "Invalid root file media type: text/plain")
    }

    @Test
    func messageForNoRootFileFound() {
        let error = MXLParser.Error.noRootFileFound

        #expect(error.message == "No root files found in container")
    }

    @Test
    func messageForParseFailure() {
        let error = MXLParser.Error.parseFailure(nil)

        #expect(error.message == "Unable to parse MusicXML file")
    }
}
