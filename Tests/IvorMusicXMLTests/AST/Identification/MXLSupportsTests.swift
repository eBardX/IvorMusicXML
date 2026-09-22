// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLSupportsTests {
}

// MARK: -

extension MXLSupportsTests {
    @Test
    func equality() {
        #expect(MXLSupports(isSupported: true, element: "beam") == MXLSupports(isSupported: true, element: "beam"))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLSupports> = [MXLSupports(isSupported: true, element: "beam"),
                                        MXLSupports(isSupported: true, element: "beam"),
                                        MXLSupports(isSupported: false, element: "stem")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLSupports(isSupported: true, element: "beam") != MXLSupports(isSupported: false, element: "stem"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLSupports(isSupported: true, element: "beam")

        #expect(value.attribute == nil)
        #expect(value.element == "beam")
        #expect(value.isSupported == true)
        #expect(value.value == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLSupports(isSupported: false, element: "stem", attribute: "type", value: "double")

        #expect(value.attribute == "type")
        #expect(value.element == "stem")
        #expect(value.isSupported == false)
        #expect(value.value == "double")
    }
}
