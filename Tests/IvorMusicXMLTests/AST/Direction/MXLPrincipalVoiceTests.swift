// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLPrincipalVoiceTests {
}

// MARK: -

extension MXLPrincipalVoiceTests {
    @Test
    func equality() {
        #expect(MXLPrincipalVoice(value: "1", kind: .start, symbol: .plain) ==    // swiftlint:disable:this identical_operands
                 MXLPrincipalVoice(value: "1", kind: .start, symbol: .plain))
    }

    @Test
    func hashable() {
        let values: Set<MXLPrincipalVoice> = [MXLPrincipalVoice(value: "1", kind: .start, symbol: .plain),
                                              MXLPrincipalVoice(value: "1", kind: .start, symbol: .plain),
                                              MXLPrincipalVoice(value: "1", kind: .stop, symbol: .plain)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLPrincipalVoice(value: "1", kind: .start, symbol: .plain) !=
                 MXLPrincipalVoice(value: "1", kind: .stop, symbol: .plain))
    }

    @Test
    func init_defaultValues() {
        let value = MXLPrincipalVoice(value: "1", kind: .start, symbol: .plain)

        #expect(value.color == nil)
        #expect(value.font == MXLFont())
        #expect(value.halign == nil)
        #expect(value.id == nil)
        #expect(value.position == MXLPosition())
        #expect(value.symbol == .plain)
        #expect(value.valign == nil)
        #expect(value.kind == .start)
        #expect(value.value == "1")
    }

    @Test
    func init_explicitValues() {
        let value = MXLPrincipalVoice(id: "pv1",
                                      value: "1",
                                      kind: .stop,
                                      symbol: .hauptstimme,
                                      position: MXLPosition(defaultX: 10),
                                      font: MXLFont(style: .italic),
                                      color: MXLColor(stringValue: "#800080"),
                                      halign: .center,
                                      valign: .middle)

        #expect(value.color == MXLColor(stringValue: "#800080"))
        #expect(value.font == MXLFont(style: .italic))
        #expect(value.halign == .center)
        #expect(value.id == "pv1")
        #expect(value.position == MXLPosition(defaultX: 10))
        #expect(value.symbol == .hauptstimme)
        #expect(value.valign == .middle)
        #expect(value.kind == .stop)
        #expect(value.value == "1")
    }
}
