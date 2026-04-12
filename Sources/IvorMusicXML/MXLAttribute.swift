// © 2025–2026 John Gary Pusey (see LICENSE.md)

public import XestiTools
public import XestiXML

/// A MusicXML attribute name.
///
/// `MXLAttribute` provides string-based constants for all standard MusicXML
/// attribute names used when parsing MusicXML documents.
public struct MXLAttribute: StringRepresentable {

    // MARK: Public Type Properties

    /// The `abbreviated` MusicXML attribute.
    public static let abbreviated = Self("abbreviated")

    /// The `above` MusicXML attribute.
    public static let above = Self("above")

    /// The `accelerate` MusicXML attribute.
    public static let accelerate = Self("accelerate")

    /// The `additional` MusicXML attribute.
    public static let additional = Self("additional")

    /// The `after-barline` MusicXML attribute.
    public static let afterBarline = Self("after-barline")

    /// The `after-jump` MusicXML attribute.
    public static let afterJump = Self("after-jump")

    /// The `alternate` MusicXML attribute.
    public static let alternate = Self("alternate")

    /// The `approach` MusicXML attribute.
    public static let approach = Self("approach")

    /// The `arrangement` MusicXML attribute.
    public static let arrangement = Self("arrangement")

    /// The `attack` MusicXML attribute.
    public static let attack = Self("attack")

    /// The `attribute` MusicXML attribute.
    public static let attribute = Self("attribute")

    /// The `beats` MusicXML attribute.
    public static let beats = Self("beats")

    /// The `bezier-offset` MusicXML attribute.
    public static let bezierOffset = Self("bezier-offset")

    /// The `bezier-offset2` MusicXML attribute.
    public static let bezierOffset2 = Self("bezier-offset2")

    /// The `bezier-x` MusicXML attribute.
    public static let bezierX = Self("bezier-x")

    /// The `bezier-x2` MusicXML attribute.
    public static let bezierX2 = Self("bezier-x2")

    /// The `bezier-y` MusicXML attribute.
    public static let bezierY = Self("bezier-y")

    /// The `bezier-y2` MusicXML attribute.
    public static let bezierY2 = Self("bezier-y2")

    /// The `blank-page` MusicXML attribute.
    public static let blankPage = Self("blank-page")

    /// The `bottom-staff` MusicXML attribute.
    public static let bottomStaff = Self("bottom-staff")

    /// The `bracket` MusicXML attribute.
    public static let bracket = Self("bracket")

    /// The `bracket-degrees` MusicXML attribute.
    public static let bracketDegrees = Self("bracket-degrees")

    /// The `cancel` MusicXML attribute.
    public static let cancel = Self("cancel")

    /// The `cautionary` MusicXML attribute.
    public static let cautionary = Self("cautionary")

    /// The `coda` MusicXML attribute.
    public static let coda = Self("coda")

    /// The `color` MusicXML attribute.
    public static let color = Self("color")

    /// The `dacapo` MusicXML attribute.
    public static let dacapo = Self("dacapo")

    /// The `dalsegno` MusicXML attribute.
    public static let dalsegno = Self("dalsegno")

    /// The `damper-pedal` MusicXML attribute.
    public static let damperPedal = Self("damper-pedal")

    /// The `dashed-circle` MusicXML attribute.
    public static let dashedCircle = Self("dashed-circle")

    /// The `dash-length` MusicXML attribute.
    public static let dashLength = Self("dash-length")

    /// The `default-x` MusicXML attribute.
    public static let defaultX = Self("default-x")

    /// The `default-y` MusicXML attribute.
    public static let defaultY = Self("default-y")

    /// The `departure` MusicXML attribute.
    public static let departure = Self("departure")

    /// The `dir` MusicXML attribute.
    public static let dir = Self("dir")

    /// The `direction` MusicXML attribute.
    public static let direction = Self("direction")

    /// The `directive` MusicXML attribute.
    public static let directive = Self("directive")

    /// The `divisions` MusicXML attribute.
    public static let divisions = Self("divisions")

    /// The `dynamics` MusicXML attribute.
    public static let dynamics = Self("dynamics")

    /// The `editorial` MusicXML attribute.
    public static let editorial = Self("editorial")

    /// The `element` MusicXML attribute.
    public static let element = Self("element")

    /// The `elevation` MusicXML attribute.
    public static let elevation = Self("elevation")

    /// The `enclosure` MusicXML attribute.
    public static let enclosure = Self("enclosure")

    /// The `end-dynamics` MusicXML attribute.
    public static let endDynamics = Self("end-dynamics")

    /// The `end-length` MusicXML attribute.
    public static let endLength = Self("end-length")

    /// The `fan` MusicXML attribute.
    public static let fan = Self("fan")

    /// The `filled` MusicXML attribute.
    public static let filled = Self("filled")

    /// The `fine` MusicXML attribute.
    public static let fine = Self("fine")

    /// The `first-beat` MusicXML attribute.
    public static let firstBeat = Self("first-beat")

    /// The `font-family` MusicXML attribute.
    public static let fontFamily = Self("font-family")

    /// The `font-size` MusicXML attribute.
    public static let fontSize = Self("font-size")

    /// The `font-style` MusicXML attribute.
    public static let fontStyle = Self("font-style")

    /// The `font-weight` MusicXML attribute.
    public static let fontWeight = Self("font-weight")

    /// The `forward-repeat` MusicXML attribute.
    public static let forwardRepeat = Self("forward-repeat")

    /// The `full-path` MusicXML attribute.
    public static let fullPath = Self("full-path")

    /// The `halign` MusicXML attribute.
    public static let halign = Self("halign")

    /// The `hand` MusicXML attribute.
    public static let hand = Self("hand")

    /// The `height` MusicXML attribute.
    public static let height = Self("height")

    /// The `id` MusicXML attribute.
    public static let id = Self("id")

    /// The `implicit` MusicXML attribute.
    public static let implicit = Self("implicit")

    /// The `justify` MusicXML attribute.
    public static let justify = Self("justify")

    /// The `last-beat` MusicXML attribute.
    public static let lastBeat = Self("last-beat")

    /// The `latency` MusicXML attribute.
    public static let latency = Self("latency")

    /// The `letter-spacing` MusicXML attribute.
    public static let letterSpacing = Self("letter-spacing")

    /// The `line` MusicXML attribute.
    public static let line = Self("line")

    /// The `line-end` MusicXML attribute.
    public static let lineEnd = Self("line-end")

    /// The `line-height` MusicXML attribute.
    public static let lineHeight = Self("line-height")

    /// The `line-length` MusicXML attribute.
    public static let lineLength = Self("line-length")

    /// The `line-shape` MusicXML attribute.
    public static let lineShape = Self("line-shape")

    /// The `line-through` MusicXML attribute.
    public static let lineThrough = Self("line-through")

    /// The `line-type` MusicXML attribute.
    public static let lineType = Self("line-type")

    /// The `location` MusicXML attribute.
    public static let location = Self("location")

    /// The `long` MusicXML attribute.
    public static let long = Self("long")

    /// The `make-time` MusicXML attribute.
    public static let makeTime = Self("make-time")

    /// The `measure` MusicXML attribute.
    public static let measure = Self("measure")

    /// The `media-type` MusicXML attribute.
    public static let mediaType = Self("media-type")

    /// The `member-of` MusicXML attribute.
    public static let memberOf = Self("member-of")

    /// The `multiple-rest-always` MusicXML attribute.
    public static let multipleRestAlways = Self("multiple-rest-always")

    /// The `multiple-rest-range` MusicXML attribute.
    public static let multipleRestRange = Self("multiple-rest-range")

    /// The `name` MusicXML attribute.
    public static let name = Self("name")

    /// The `new-page` MusicXML attribute.
    public static let newPage = Self("new-page")

    /// The `new-system` MusicXML attribute.
    public static let newSystem = Self("new-system")

    /// The `niente` MusicXML attribute.
    public static let niente = Self("niente")

    /// The `non-controlling` MusicXML attribute.
    public static let nonControlling = Self("non-controlling")

    /// The `number` MusicXML attribute.
    public static let number = Self("number")

    /// The `offset` MusicXML attribute.
    public static let offset = Self("offset")

    /// The `orientation` MusicXML attribute.
    public static let orientation = Self("orientation")

    /// The `overline` MusicXML attribute.
    public static let overline = Self("overline")

    /// The `page` MusicXML attribute.
    public static let page = Self("page")

    /// The `page-number` MusicXML attribute.
    public static let pageNumber = Self("page-number")

    /// The `pan` MusicXML attribute.
    public static let pan = Self("pan")

    /// The `parentheses` MusicXML attribute.
    public static let parentheses = Self("parentheses")

    /// The `parentheses-degrees` MusicXML attribute.
    public static let parenthesesDegrees = Self("parentheses-degrees")

    /// The `pizzicato` MusicXML attribute.
    public static let pizzicato = Self("pizzicato")

    /// The `placement` MusicXML attribute.
    public static let placement = Self("placement")

    /// The `player` MusicXML attribute.
    public static let player = Self("player")

    /// The `plus-minus` MusicXML attribute.
    public static let plusMinus = Self("plus-minus")

    /// The `port` MusicXML attribute.
    public static let port = Self("port")

    /// The `primary` MusicXML attribute.
    public static let primary = Self("primary")

    /// The `print-dot` MusicXML attribute.
    public static let printDot = Self("print-dot")

    /// The `print-frame` MusicXML attribute.
    public static let printFrame = Self("print-frame")

    /// The `print-leger` MusicXML attribute.
    public static let printLeger = Self("print-leger")

    /// The `print-lyric` MusicXML attribute.
    public static let printLyric = Self("print-lyric")

    /// The `print-object` MusicXML attribute.
    public static let printObject = Self("print-object")

    /// The `print-spacing` MusicXML attribute.
    public static let printSpacing = Self("print-spacing")

    /// The `reference` MusicXML attribute.
    public static let reference = Self("reference")

    /// The `relative-x` MusicXML attribute.
    public static let relativeX = Self("relative-x")

    /// The `relative-y` MusicXML attribute.
    public static let relativeY = Self("relative-y")

    /// The `release` MusicXML attribute.
    public static let release = Self("release")

    /// The `repeater` MusicXML attribute.
    public static let repeater = Self("repeater")

    /// The `rotation` MusicXML attribute.
    public static let rotation = Self("rotation")

    /// The `scaling` MusicXML attribute.
    public static let scaling = Self("scaling")

    /// The `second-beat` MusicXML attribute.
    public static let secondBeat = Self("second-beat")

    /// The `segno` MusicXML attribute.
    public static let segno = Self("segno")

    /// The `shape` MusicXML attribute.
    public static let shape = Self("shape")

    /// The `show-frets` MusicXML attribute.
    public static let showFrets = Self("show-frets")

    /// The `show-number` MusicXML attribute.
    public static let showNumber = Self("show-number")

    /// The `show-type` MusicXML attribute.
    public static let showType = Self("show-type")

    /// The `sign` MusicXML attribute.
    public static let sign = Self("sign")

    /// The `size` MusicXML attribute.
    public static let size = Self("size")

    /// The `slash` MusicXML attribute.
    public static let slash = Self("slash")

    /// The `slashes` MusicXML attribute.
    public static let slashes = Self("slashes")

    /// The `smufl` MusicXML attribute.
    public static let smufl = Self("smufl")

    /// The `soft-pedal` MusicXML attribute.
    public static let softPedal = Self("soft-pedal")

    /// The `sostenuto-pedal` MusicXML attribute.
    public static let sostenutoPedal = Self("sostenuto-pedal")

    /// The `sound` MusicXML attribute.
    public static let sound = Self("sound")

    /// The `source` MusicXML attribute.
    public static let source = Self("source")

    /// The `space-length` MusicXML attribute.
    public static let spaceLength = Self("space-length")

    /// The `spread` MusicXML attribute.
    public static let spread = Self("spread")

    /// The `stack-degrees` MusicXML attribute.
    public static let stackDegrees = Self("stack-degrees")

    /// The `staff` MusicXML attribute.
    public static let staff = Self("staff")

    /// The `staff-spacing` MusicXML attribute.
    public static let staffSpacing = Self("staff-spacing")

    /// The `start-note` MusicXML attribute.
    public static let startNote = Self("start-note")

    /// The `steal-time-following` MusicXML attribute.
    public static let stealTimeFollowing = Self("steal-time-following")

    /// The `steal-time-previous` MusicXML attribute.
    public static let stealTimePrevious = Self("steal-time-previous")

    /// The `string` MusicXML attribute.
    public static let string = Self("string")

    /// The `substitution` MusicXML attribute.
    public static let substitution = Self("substitution")

    /// The `symbol` MusicXML attribute.
    public static let symbol = Self("symbol")

    /// The `system` MusicXML attribute.
    public static let system = Self("system")

    /// The `tempo` MusicXML attribute.
    public static let tempo = Self("tempo")

    /// The `text` MusicXML attribute.
    public static let text = Self("text")

    /// The `text-x` MusicXML attribute.
    public static let textX = Self("text-x")

    /// The `text-y` MusicXML attribute.
    public static let textY = Self("text-y")

    /// The `time-only` MusicXML attribute.
    public static let timeOnly = Self("time-only")

    /// The `times` MusicXML attribute.
    public static let times = Self("times")

    /// The `tip` MusicXML attribute.
    public static let tip = Self("tip")

    /// The `tocoda` MusicXML attribute.
    public static let tocoda = Self("tocoda")

    /// The `top-staff` MusicXML attribute.
    public static let topStaff = Self("top-staff")

    /// The `trill-step` MusicXML attribute.
    public static let trillStep = Self("trill-step")

    /// The `two-note-turn` MusicXML attribute.
    public static let twoNoteTurn = Self("two-note-turn")

    /// The `type` MusicXML attribute.
    public static let type = Self("type")

    /// The `unbroken` MusicXML attribute.
    public static let unbroken = Self("unbroken")

    /// The `underline` MusicXML attribute.
    public static let underline = Self("underline")

    /// The `unplayed` MusicXML attribute.
    public static let unplayed = Self("unplayed")

    /// The `use-dots` MusicXML attribute.
    public static let useDots = Self("use-dots")

    /// The `use-stems` MusicXML attribute.
    public static let useStems = Self("use-stems")

    /// The `use-symbols` MusicXML attribute.
    public static let useSymbols = Self("use-symbols")

    /// The `valign` MusicXML attribute.
    public static let valign = Self("valign")

    /// The `value` MusicXML attribute.
    public static let value = Self("value")

    /// The `version` MusicXML attribute.
    public static let version = Self("version")

    /// The `width` MusicXML attribute.
    public static let width = Self("width")

    /// The `winged` MusicXML attribute.
    public static let winged = Self("winged")

    /// The `xlink:href` MusicXML attribute.
    public static let xlinkHref = Self("xlink:href")

    /// The `xml:lang` MusicXML attribute.
    public static let xmlLang = Self("xml:lang")

    /// The `xml:space` MusicXML attribute.
    public static let xmlSpace = Self("xml:space")

    // MARK: Public Initializers

    /// Creates a new attribute name with the provided string value.
    ///
    /// If the provided string value is empty, this initializer returns `nil`.
    ///
    /// - Parameter stringValue:    The string value to use for the new
    ///                             attribute name.
    public init?(stringValue: String) {
        guard Self.isValid(stringValue)
        else { return nil }

        self.stringValue = stringValue
    }

    // MARK: Public Instance Properties

    /// The string value that represents this attribute name.
    ///
    /// A new instance initialized with `stringValue` will be equivalent to
    /// this instance.
    public var stringValue: String
}

// MARK: - XML.Attribute

extension MXLAttribute: XMLAttribute {
}
