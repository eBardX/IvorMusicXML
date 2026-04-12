// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing
import XestiTools

struct MXLParseErrorTests {
}

// MARK: -

extension MXLParseErrorTests {
    @Test
    func test_categoryIsIvorMusicXML() {
        let error = MXLParseError.noRootFileFound

        #expect(error.category?.description == "IvorMusicXML")
    }

    @Test
    func test_causeIsNilForInvalidRootFileMediaType() {
        let error = MXLParseError.invalidRootFileMediaType("text/plain")

        #expect(error.cause == nil)
    }

    @Test
    func test_causeIsNilForNoRootFileFound() {
        let error = MXLParseError.noRootFileFound

        #expect(error.cause == nil)
    }

    @Test
    func test_causeIsNilForParseFailureWithNil() {
        let error = MXLParseError.parseFailure(nil)

        #expect(error.cause == nil)
    }

    @Test
    func test_causeIsPresentForParseFailureWithError() {
        let inner = MXLParseError.noRootFileFound
        let error = MXLParseError.parseFailure(inner)

        #expect(error.cause != nil)
    }

    @Test
    func test_messageForInvalidRootFileMediaType() {
        let error = MXLParseError.invalidRootFileMediaType("text/plain")

        #expect(error.message == "Invalid root file media type: text/plain")
    }

    @Test
    func test_messageForNoRootFileFound() {
        let error = MXLParseError.noRootFileFound

        #expect(error.message == "No root files found in container")
    }

    @Test
    func test_messageForParseFailure() {
        let error = MXLParseError.parseFailure(nil)

        #expect(error.message == "Unable to parse MusicXML file")
    }
}
