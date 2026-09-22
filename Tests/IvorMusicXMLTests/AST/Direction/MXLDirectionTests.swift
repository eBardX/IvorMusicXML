// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLDirectionTests {
}

// MARK: -

extension MXLDirectionTests {
    @Test
    func equality() {
        #expect(MXLDirection() == MXLDirection())    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let values: Set<MXLDirection> = [MXLDirection(), MXLDirection(), MXLDirection(id: "d2")]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLDirection() != MXLDirection(id: "d2"))
    }

    @Test
    func init_defaultValues() {
        let value = MXLDirection()

        #expect(value.footnote == nil)
        #expect(value.id == nil)
        #expect(value.isDirective == nil)
        #expect(value.kind.isEmpty)
        #expect(value.level == nil)
        #expect(value.listening == nil)
        #expect(value.offset == nil)
        #expect(value.placement == nil)
        #expect(value.sound == nil)
        #expect(value.staff == nil)
        #expect(value.system == nil)
        #expect(value.voice == nil)
    }

    @Test
    func init_explicitValues() {
        let kind = [MXLDirection.Kind(content: .coda([MXLCoda()]))]
        let footnote = MXLFormattedText(value: "note")
        let level = MXLLevel(value: "1", display: MXLLevel.Display())
        let voice = MXLVoice(voice: "1")
        let staff = MXLStaff(uintValue: 1)
        let sound = MXLSound()
        let listening = MXLListening()
        let value = MXLDirection(id: "d1",
                                 kind: kind,
                                 offset: MXLOffset(value: 4),
                                 footnote: footnote,
                                 level: level,
                                 voice: voice,
                                 staff: staff,
                                 sound: sound,
                                 listening: listening,
                                 placement: .above,
                                 isDirective: true,
                                 system: .onlyTop)

        #expect(value.footnote == footnote)
        #expect(value.id == "d1")
        #expect(value.isDirective == true)
        #expect(value.kind == kind)
        #expect(value.level == level)
        #expect(value.listening == listening)
        #expect(value.offset == MXLOffset(value: 4))
        #expect(value.placement == .above)
        #expect(value.sound == sound)
        #expect(value.staff == staff)
        #expect(value.system == .onlyTop)
        #expect(value.voice == voice)
    }
}
