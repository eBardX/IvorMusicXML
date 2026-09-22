// © 2025–2026 John Gary Pusey (see LICENSE.md)

internal import XestiTools
internal import XestiXML

internal struct MXLAttributeName {

    // MARK: Internal Initializers

    internal init?(stringValue: String) {
        guard Self.isValid(stringValue)
        else { return nil }

        self.stringValue = stringValue
    }

    // MARK: Internal Instance Properties

    internal var stringValue: String
}

// MARK: -

extension MXLAttributeName {

    // MARK: Internal Type Properties

    internal static let abbreviated        = Self("abbreviated")
    internal static let above              = Self("above")
    internal static let accelerate         = Self("accelerate")
    internal static let additional         = Self("additional")
    internal static let afterBarline       = Self("after-barline")
    internal static let afterJump          = Self("after-jump")
    internal static let alternate          = Self("alternate")
    internal static let approach           = Self("approach")
    internal static let arrangement        = Self("arrangement")
    internal static let attack             = Self("attack")
    internal static let attribute          = Self("attribute")
    internal static let beats              = Self("beats")
    internal static let bezierOffset       = Self("bezier-offset")
    internal static let bezierOffset2      = Self("bezier-offset2")
    internal static let bezierX            = Self("bezier-x")
    internal static let bezierX2           = Self("bezier-x2")
    internal static let bezierY            = Self("bezier-y")
    internal static let bezierY2           = Self("bezier-y2")
    internal static let blankPage          = Self("blank-page")
    internal static let bottomStaff        = Self("bottom-staff")
    internal static let bracket            = Self("bracket")
    internal static let bracketDegrees     = Self("bracket-degrees")
    internal static let cancel             = Self("cancel")
    internal static let cautionary         = Self("cautionary")
    internal static let coda               = Self("coda")
    internal static let color              = Self("color")
    internal static let dacapo             = Self("dacapo")
    internal static let dalsegno           = Self("dalsegno")
    internal static let damperPedal        = Self("damper-pedal")
    internal static let dashedCircle       = Self("dashed-circle")
    internal static let dashLength         = Self("dash-length")
    internal static let defaultX           = Self("default-x")
    internal static let defaultY           = Self("default-y")
    internal static let departure          = Self("departure")
    internal static let dir                = Self("dir")
    internal static let direction          = Self("direction")
    internal static let directive          = Self("directive")
    internal static let divisions          = Self("divisions")
    internal static let dynamics           = Self("dynamics")
    internal static let editorial          = Self("editorial")
    internal static let element            = Self("element")
    internal static let elevation          = Self("elevation")
    internal static let enclosure          = Self("enclosure")
    internal static let endDynamics        = Self("end-dynamics")
    internal static let endLength          = Self("end-length")
    internal static let fan                = Self("fan")
    internal static let filled             = Self("filled")
    internal static let fine               = Self("fine")
    internal static let firstBeat          = Self("first-beat")
    internal static let fontFamily         = Self("font-family")
    internal static let fontSize           = Self("font-size")
    internal static let fontStyle          = Self("font-style")
    internal static let fontWeight         = Self("font-weight")
    internal static let forwardRepeat      = Self("forward-repeat")
    internal static let fullPath           = Self("full-path")
    internal static let halign             = Self("halign")
    internal static let hand               = Self("hand")
    internal static let height             = Self("height")
    internal static let id                 = Self("id")
    internal static let implicit           = Self("implicit")
    internal static let justify            = Self("justify")
    internal static let lastBeat           = Self("last-beat")
    internal static let latency            = Self("latency")
    internal static let letterSpacing      = Self("letter-spacing")
    internal static let line               = Self("line")
    internal static let lineEnd            = Self("line-end")
    internal static let lineHeight         = Self("line-height")
    internal static let lineLength         = Self("line-length")
    internal static let lineShape          = Self("line-shape")
    internal static let lineThrough        = Self("line-through")
    internal static let lineType           = Self("line-type")
    internal static let location           = Self("location")
    internal static let long               = Self("long")
    internal static let makeTime           = Self("make-time")
    internal static let measure            = Self("measure")
    internal static let mediaType          = Self("media-type")
    internal static let memberOf           = Self("member-of")
    internal static let multipleRestAlways = Self("multiple-rest-always")
    internal static let multipleRestRange  = Self("multiple-rest-range")
    internal static let name               = Self("name")
    internal static let newPage            = Self("new-page")
    internal static let newSystem          = Self("new-system")
    internal static let niente             = Self("niente")
    internal static let nonControlling     = Self("non-controlling")
    internal static let number             = Self("number")
    internal static let offset             = Self("offset")
    internal static let orientation        = Self("orientation")
    internal static let overline           = Self("overline")
    internal static let page               = Self("page")
    internal static let pageNumber         = Self("page-number")
    internal static let pan                = Self("pan")
    internal static let parentheses        = Self("parentheses")
    internal static let parenthesesDegrees = Self("parentheses-degrees")
    internal static let pizzicato          = Self("pizzicato")
    internal static let placement          = Self("placement")
    internal static let player             = Self("player")
    internal static let plusMinus          = Self("plus-minus")
    internal static let port               = Self("port")
    internal static let position           = Self("position")
    internal static let printDot           = Self("print-dot")
    internal static let printFrame         = Self("print-frame")
    internal static let printLeger         = Self("print-leger")
    internal static let printLyric         = Self("print-lyric")
    internal static let printObject        = Self("print-object")
    internal static let printSpacing       = Self("print-spacing")
    internal static let reference          = Self("reference")
    internal static let relativeX          = Self("relative-x")
    internal static let relativeY          = Self("relative-y")
    internal static let release            = Self("release")
    internal static let repeater           = Self("repeater")
    internal static let rotation           = Self("rotation")
    internal static let scaling            = Self("scaling")
    internal static let secondBeat         = Self("second-beat")
    internal static let segno              = Self("segno")
    internal static let separator          = Self("separator")
    internal static let shape              = Self("shape")
    internal static let showFrets          = Self("show-frets")
    internal static let showNumber         = Self("show-number")
    internal static let showType           = Self("show-type")
    internal static let sign               = Self("sign")
    internal static let size               = Self("size")
    internal static let slash              = Self("slash")
    internal static let slashes            = Self("slashes")
    internal static let smufl              = Self("smufl")
    internal static let softPedal          = Self("soft-pedal")
    internal static let sostenutoPedal     = Self("sostenuto-pedal")
    internal static let sound              = Self("sound")
    internal static let source             = Self("source")
    internal static let spaceLength        = Self("space-length")
    internal static let spread             = Self("spread")
    internal static let stackDegrees       = Self("stack-degrees")
    internal static let staff              = Self("staff")
    internal static let staffSpacing       = Self("staff-spacing")
    internal static let startNote          = Self("start-note")
    internal static let stealTimeFollowing = Self("steal-time-following")
    internal static let stealTimePrevious  = Self("steal-time-previous")
    internal static let string             = Self("string")
    internal static let substitution       = Self("substitution")
    internal static let symbol             = Self("symbol")
    internal static let system             = Self("system")
    internal static let tempo              = Self("tempo")
    internal static let text               = Self("text")
    internal static let textX              = Self("text-x")
    internal static let textY              = Self("text-y")
    internal static let timeOnly           = Self("time-only")
    internal static let times              = Self("times")
    internal static let tip                = Self("tip")
    internal static let tocoda             = Self("tocoda")
    internal static let topStaff           = Self("top-staff")
    internal static let trillStep          = Self("trill-step")
    internal static let twoNoteTurn        = Self("two-note-turn")
    internal static let type               = Self("type")
    internal static let unbroken           = Self("unbroken")
    internal static let underline          = Self("underline")
    internal static let unplayed           = Self("unplayed")
    internal static let useDots            = Self("use-dots")
    internal static let useStems           = Self("use-stems")
    internal static let useSymbols         = Self("use-symbols")
    internal static let valign             = Self("valign")
    internal static let value              = Self("value")
    internal static let version            = Self("version")
    internal static let width              = Self("width")
    internal static let winged             = Self("winged")
    internal static let xlinkActuate       = Self("xlink:actuate")
    internal static let xlinkHref          = Self("xlink:href")
    internal static let xlinkRole          = Self("xlink:role")
    internal static let xlinkShow          = Self("xlink:show")
    internal static let xlinkTitle         = Self("xlink:title")
    internal static let xlinkType          = Self("xlink:type")
    internal static let xmlBase            = Self("xml:base")
    internal static let xmlLang            = Self("xml:lang")
    internal static let xmlSpace           = Self("xml:space")
}

// MARK: - StringRepresentable

extension MXLAttributeName: StringRepresentable {
}

// MARK: - XML.Attribute

extension MXLAttributeName: XMLAttribute {

    // MARK: Internal Type Properties

    internal static let xlinkNamespaceURI = "http://www.w3.org/1999/xlink"
    internal static let xlinkPrefix       = "xlink"
    internal static let xmlNamespaceURI   = "http://www.w3.org/XML/1998/namespace"
    internal static let xmlPrefix         = "xml"

    // MARK: Internal Initializers

    internal init(_ name: String,
                  _ uri: String?) {
        guard let stringValue = Self._makeStringValue(name, uri)
        else { fatalError("uri must be nil or a known namespace!") }

        self.init(stringValue)
    }

    internal init?(name: String,
                   uri: String?) {
        guard let stringValue = Self._makeStringValue(name, uri)
        else { return nil }

        self.init(stringValue: stringValue)
    }

    // MARK: Internal Instance Properties

    internal var name: String {
        components.local
    }

    internal var uri: String? {
        switch components.prefix {
        case Self.xlinkPrefix:
            Self.xlinkNamespaceURI

        case Self.xmlPrefix:
            Self.xmlNamespaceURI

        default:
            nil
        }
    }

    // MARK: Private Type Methods

    // Returns the prefixed string value denoting the provided local name in
    // the provided namespace, or `nil` if that namespace has no prefix known
    // to MusicXML.
    private static func _makeStringValue(_ name: String,
                                         _ uri: String?) -> String? {
        guard let uri
        else { return name }

        switch uri {
        case xlinkNamespaceURI:
            return "\(xlinkPrefix):\(name)"

        case xmlNamespaceURI:
            return "\(xmlPrefix):\(name)"

        default:
            return nil
        }
    }

    // MARK: Private Instance Properties

    private var components: (prefix: String?, local: String) {
        guard let index = stringValue.firstIndex(of: ":")
        else { return (nil, stringValue) }

        return (String(stringValue[..<index]),
                String(stringValue[stringValue.index(after: index)...]))
    }
}
