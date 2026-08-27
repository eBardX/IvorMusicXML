// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLScorePartTests {
}

// MARK: -

extension MXLScorePartTests {
    @Test
    func equality() {
        let name = MXLPartName(value: "Violin", text: MXLPartName.Text())

        #expect(MXLScorePart(id: "P1", name: name) == MXLScorePart(id: "P1", name: name))    // swiftlint:disable:this identical_operands
    }

    @Test
    func hashable() {
        let name = MXLPartName(value: "Violin", text: MXLPartName.Text())
        let values: Set<MXLScorePart> = [MXLScorePart(id: "P1", name: name), MXLScorePart(id: "P1", name: name), MXLScorePart(id: "P2", name: name)]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        let name = MXLPartName(value: "Violin", text: MXLPartName.Text())

        #expect(MXLScorePart(id: "P1", name: name) != MXLScorePart(id: "P2", name: name))
    }

    @Test
    func init_defaultValues() {
        let name = MXLPartName(value: "Violin", text: MXLPartName.Text())
        let value = MXLScorePart(id: "P1", name: name)

        #expect(value.abbreviation == nil)
        #expect(value.abbreviationDisplay == nil)
        #expect(value.group.isEmpty)
        #expect(value.group2.isEmpty)
        #expect(value.id == "P1")
        #expect(value.identification == nil)
        #expect(value.instrument.isEmpty)
        #expect(value.link.isEmpty)
        #expect(value.name == name)
        #expect(value.nameDisplay == nil)
        #expect(value.player.isEmpty)
    }

    @Test
    func init_explicitValues() {
        let name = MXLPartName(value: "Violin", text: MXLPartName.Text())
        let identification = MXLIdentification(source: "engraver")
        let link = [MXLPartLink(xlink: MXLXLink(href: "part1.musicxml"))]
        let nameDisplay = MXLNameDisplay()
        let abbreviation = MXLPartName(value: "Vln.", text: MXLPartName.Text())
        let abbreviationDisplay = MXLNameDisplay(printsObject: false)
        let group = ["score"]
        let instrument = [MXLScoreInstrument(id: "i1", name: "Violin")]
        let player = [MXLPlayer(id: "p1", name: "Jane")]
        let group2 = [MXLScorePart.Group2(midiDevice: MXLMidiDevice(value: "Port 1"))]
        let value = MXLScorePart(id: "P1",
                                 identification: identification,
                                 link: link,
                                 name: name,
                                 nameDisplay: nameDisplay,
                                 abbreviation: abbreviation,
                                 abbreviationDisplay: abbreviationDisplay,
                                 group: group,
                                 instrument: instrument,
                                 player: player,
                                 group2: group2)

        #expect(value.abbreviation == abbreviation)
        #expect(value.abbreviationDisplay == abbreviationDisplay)
        #expect(value.group == group)
        #expect(value.group2 == group2)
        #expect(value.id == "P1")
        #expect(value.identification == identification)
        #expect(value.instrument == instrument)
        #expect(value.link == link)
        #expect(value.name == name)
        #expect(value.nameDisplay == nameDisplay)
        #expect(value.player == player)
    }
}
