// © 2026 John Gary Pusey (see LICENSE.md)

@testable import IvorMusicXML
import Testing

struct MXLScoreTimewiseTests {
}

// MARK: -

extension MXLScoreTimewiseTests {
    @Test
    func equality() {
        #expect(MXLScoreTimewise(partList: MXLPartList()) == MXLScoreTimewise(partList: MXLPartList()))    // swiftlint:disable:this identical_operands line_length
    }

    @Test
    func hashable() {
        let values: Set<MXLScoreTimewise> = [MXLScoreTimewise(partList: MXLPartList()),
                                             MXLScoreTimewise(partList: MXLPartList()),
                                             MXLScoreTimewise(movementNumber: "1", partList: MXLPartList())]

        #expect(values.count == 2)
    }

    @Test
    func inequality() {
        #expect(MXLScoreTimewise(partList: MXLPartList()) != MXLScoreTimewise(movementNumber: "1", partList: MXLPartList()))
    }

    @Test
    func init_defaultValues() {
        let value = MXLScoreTimewise(partList: MXLPartList())

        #expect(value.credit.isEmpty)
        #expect(value.defaults == nil)
        #expect(value.identification == nil)
        #expect(value.measures.isEmpty)
        #expect(value.movementNumber == nil)
        #expect(value.movementTitle == nil)
        #expect(value.partList == MXLPartList())
        #expect(value.version == MXLDocument.Version(major: 1, minor: 0))
        #expect(value.work == nil)
    }

    @Test
    func init_explicitValues() {
        let work = MXLWork(title: "Symphony No. 5")
        let identification = MXLIdentification(source: "engraver")
        let defaults = MXLDefaults(isConcertScore: true)
        let credit = [MXLCredit(content: .creditImage(MXLImage(attributes: MXLImage.Attributes(source: "a.png", kind: "image/png"))))]
        let partList = MXLPartList(items: [.partGroup(MXLPartGroup(stretchesTimeSignature: false, kind: .start))])
        let measures = [MXLScoreTimewise.Measure(number: "1")]
        let value = MXLScoreTimewise(version: MXLDocument.Version(major: 4, minor: 0),
                                     work: work,
                                     movementNumber: "1",
                                     movementTitle: "Allegro",
                                     identification: identification,
                                     defaults: defaults,
                                     credit: credit,
                                     partList: partList,
                                     measures: measures)

        #expect(value.credit == credit)
        #expect(value.defaults == defaults)
        #expect(value.identification == identification)
        #expect(value.measures == measures)
        #expect(value.movementNumber == "1")
        #expect(value.movementTitle == "Allegro")
        #expect(value.partList == partList)
        #expect(value.version == MXLDocument.Version(major: 4, minor: 0))
        #expect(value.work == work)
    }
}
