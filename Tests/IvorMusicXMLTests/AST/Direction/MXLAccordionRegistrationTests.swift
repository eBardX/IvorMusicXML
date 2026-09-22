// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLAccordionRegistrationTests {
}

// MARK: -

extension MXLAccordionRegistrationTests {
    @Test
    func equality() {
        #expect(MXLAccordionRegistration(hasHighDot: true, hasLowDot: false) ==    // swiftlint:disable:this identical_operands
                 MXLAccordionRegistration(hasHighDot: true, hasLowDot: false))
    }

    @Test
    func hashable() {
        let values: Set<MXLAccordionRegistration> = [MXLAccordionRegistration(hasHighDot: true, hasLowDot: false),
                                                     MXLAccordionRegistration(hasHighDot: true, hasLowDot: false),
                                                     MXLAccordionRegistration(hasHighDot: false, hasLowDot: true)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLAccordionRegistration(hasHighDot: true, hasLowDot: false) !=
                 MXLAccordionRegistration(hasHighDot: false, hasLowDot: true))
    }

    @Test
    func init_defaultValues() {
        let value = MXLAccordionRegistration(hasHighDot: true, hasLowDot: false)

        #expect(value.accordionMiddle == nil)
        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.halign == nil)
        #expect(value.hasHighDot == true)
        #expect(value.hasLowDot == false)
        #expect(value.id == nil)
        #expect(value.position == MXLPosition())
        #expect(value.valign == nil)
    }

    @Test
    func init_explicitValues() {
        let value = MXLAccordionRegistration(id: "a1",
                                             hasHighDot: true,
                                             accordionMiddle: MXLAccordionMiddle(uintValue: 2),
                                             hasLowDot: true,
                                             position: MXLPosition(defaultX: 10),
                                             font: MXLFont(style: .italic),
                                             color: MXLColor(stringValue: "#800080"),
                                             halign: .center,
                                             valign: .middle)

        #expect(value.accordionMiddle == MXLAccordionMiddle(uintValue: 2))
        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.halign == .center)
        #expect(value.hasHighDot == true)
        #expect(value.hasLowDot == true)
        #expect(value.id == "a1")
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.valign == .middle)
    }
}
