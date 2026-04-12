// © 2025–2026 John Gary Pusey (see LICENSE.md)

public import XestiTools
public import XestiXML

// swiftlint:disable file_length type_body_length

/// A MusicXML element name.
///
/// `MXLElement` provides string-based constants for all standard MusicXML
/// element names used when parsing MusicXML documents.
public struct MXLElement: StringRepresentable {

    // MARK: Public Type Properties

    /// The `accent` MusicXML element.
    public static let accent = Self("accent")

    /// The `accidental` MusicXML element.
    public static let accidental = Self("accidental")

    /// The `accidental-mark` MusicXML element.
    public static let accidentalMark = Self("accidental-mark")

    /// The `accidental-text` MusicXML element.
    public static let accidentalText = Self("accidental-text")

    /// The `accord` MusicXML element.
    public static let accord = Self("accord")

    /// The `accordion-high` MusicXML element.
    public static let accordionHigh = Self("accordion-high")

    /// The `accordion-low` MusicXML element.
    public static let accordionLow = Self("accordion-low")

    /// The `accordion-middle` MusicXML element.
    public static let accordionMiddle = Self("accordion-middle")

    /// The `accordion-registration` MusicXML element.
    public static let accordionRegistration = Self("accordion-registration")

    /// The `actual-notes` MusicXML element.
    public static let actualNotes = Self("actual-notes")

    /// The `alter` MusicXML element.
    public static let alter = Self("alter")

    /// The `any` MusicXML element.
    public static let any = Self("any")

    /// The `appearance` MusicXML element.
    public static let appearance = Self("appearance")

    /// The `arpeggiate` MusicXML element.
    public static let arpeggiate = Self("arpeggiate")

    /// The `arrow` MusicXML element.
    public static let arrow = Self("arrow")

    /// The `arrow-direction` MusicXML element.
    public static let arrowDirection = Self("arrow-direction")

    /// The `arrowhead` MusicXML element.
    public static let arrowhead = Self("arrowhead")

    /// The `arrow-style` MusicXML element.
    public static let arrowStyle = Self("arrow-style")

    /// The `articulations` MusicXML element.
    public static let articulations = Self("articulations")

    /// The `artificial` MusicXML element.
    public static let artificial = Self("artificial")

    /// The `assess` MusicXML element.
    public static let assess = Self("assess")

    /// The `attributes` MusicXML element.
    public static let attributes = Self("attributes")

    /// The `backup` MusicXML element.
    public static let backup = Self("backup")

    /// The `barline` MusicXML element.
    public static let barline = Self("barline")

    /// The `barre` MusicXML element.
    public static let barre = Self("barre")

    /// The `bar-style` MusicXML element.
    public static let barStyle = Self("bar-style")

    /// The `base-pitch` MusicXML element.
    public static let basePitch = Self("base-pitch")

    /// The `bass` MusicXML element.
    public static let bass = Self("bass")

    /// The `bass-alter` MusicXML element.
    public static let bassAlter = Self("bass-alter")

    /// The `bass-separator` MusicXML element.
    public static let bassSeparator = Self("bass-separator")

    /// The `bass-step` MusicXML element.
    public static let bassStep = Self("bass-step")

    /// The `beam` MusicXML element.
    public static let beam = Self("beam")

    /// The `beater` MusicXML element.
    public static let beater = Self("beater")

    /// The `beat-repeat` MusicXML element.
    public static let beatRepeat = Self("beat-repeat")

    /// The `beats` MusicXML element.
    public static let beats = Self("beats")

    /// The `beat-type` MusicXML element.
    public static let beatType = Self("beat-type")

    /// The `beat-unit` MusicXML element.
    public static let beatUnit = Self("beat-unit")

    /// The `beat-unit-dot` MusicXML element.
    public static let beatUnitDot = Self("beat-unit-dot")

    /// The `beat-unit-tied` MusicXML element.
    public static let beatUnitTied = Self("beat-unit-tied")

    /// The `bend` MusicXML element.
    public static let bend = Self("bend")

    /// The `bend-alter` MusicXML element.
    public static let bendAlter = Self("bend-alter")

    /// The `bookmark` MusicXML element.
    public static let bookmark = Self("bookmark")

    /// The `bottom-margin` MusicXML element.
    public static let bottomMargin = Self("bottom-margin")

    /// The `bracket` MusicXML element.
    public static let bracket = Self("bracket")

    /// The `brass-bend` MusicXML element.
    public static let brassBend = Self("brass-bend")

    /// The `breath-mark` MusicXML element.
    public static let breathMark = Self("breath-mark")

    /// The `caesura` MusicXML element.
    public static let caesura = Self("caesura")

    /// The `cancel` MusicXML element.
    public static let cancel = Self("cancel")

    /// The `capo` MusicXML element.
    public static let capo = Self("capo")

    /// The `chord` MusicXML element.
    public static let chord = Self("chord")

    /// The `chromatic` MusicXML element.
    public static let chromatic = Self("chromatic")

    /// The `circular-arrow` MusicXML element.
    public static let circularArrow = Self("circular-arrow")

    /// The `clef` MusicXML element.
    public static let clef = Self("clef")

    /// The `clef-octave-change` MusicXML element.
    public static let clefOctaveChange = Self("clef-octave-change")

    /// The `coda` MusicXML element.
    public static let coda = Self("coda")

    /// The `concert-score` MusicXML element.
    public static let concertScore = Self("concert-score")

    /// The `container` MusicXML element.
    public static let container = Self("container")

    /// The `creator` MusicXML element.
    public static let creator = Self("creator")

    /// The `credit` MusicXML element.
    public static let credit = Self("credit")

    /// The `credit-image` MusicXML element.
    public static let creditImage = Self("credit-image")

    /// The `credit-symbol` MusicXML element.
    public static let creditSymbol = Self("credit-symbol")

    /// The `credit-type` MusicXML element.
    public static let creditType = Self("credit-type")

    /// The `credit-words` MusicXML element.
    public static let creditWords = Self("credit-words")

    /// The `cue` MusicXML element.
    public static let cue = Self("cue")

    /// The `damp` MusicXML element.
    public static let damp = Self("damp")

    /// The `damp-all` MusicXML element.
    public static let dampAll = Self("damp-all")

    /// The `dashes` MusicXML element.
    public static let dashes = Self("dashes")

    /// The `defaults` MusicXML element.
    public static let defaults = Self("defaults")

    /// The `degree` MusicXML element.
    public static let degree = Self("degree")

    /// The `degree-alter` MusicXML element.
    public static let degreeAlter = Self("degree-alter")

    /// The `degree-type` MusicXML element.
    public static let degreeType = Self("degree-type")

    /// The `degree-value` MusicXML element.
    public static let degreeValue = Self("degree-value")

    /// The `delayed-inverted-turn` MusicXML element.
    public static let delayedInvertedTurn = Self("delayed-inverted-turn")

    /// The `delayed-turn` MusicXML element.
    public static let delayedTurn = Self("delayed-turn")

    /// The `detached-legato` MusicXML element.
    public static let detachedLegato = Self("detached-legato")

    /// The `diatonic` MusicXML element.
    public static let diatonic = Self("diatonic")

    /// The `direction` MusicXML element.
    public static let direction = Self("direction")

    /// The `direction-type` MusicXML element.
    public static let directionType = Self("direction-type")

    /// The `directive` MusicXML element.
    public static let directive = Self("directive")

    /// The `display-octave` MusicXML element.
    public static let displayOctave = Self("display-octave")

    /// The `display-step` MusicXML element.
    public static let displayStep = Self("display-step")

    /// The `display-text` MusicXML element.
    public static let displayText = Self("display-text")

    /// The `distance` MusicXML element.
    public static let distance = Self("distance")

    /// The `divisions` MusicXML element.
    public static let divisions = Self("divisions")

    /// The `doit` MusicXML element.
    public static let doit = Self("doit")

    /// The `dot` MusicXML element.
    public static let dot = Self("dot")

    /// The `double` MusicXML element.
    public static let double = Self("double")

    /// The `double-tongue` MusicXML element.
    public static let doubleTongue = Self("double-tongue")

    /// The `down-bow` MusicXML element.
    public static let downBow = Self("down-bow")

    /// The `duration` MusicXML element.
    public static let duration = Self("duration")

    /// The `dynamics` MusicXML element.
    public static let dynamics = Self("dynamics")

    /// The `effect` MusicXML element.
    public static let effect = Self("effect")

    /// The `elevation` MusicXML element.
    public static let elevation = Self("elevation")

    /// The `elision` MusicXML element.
    public static let elision = Self("elision")

    /// The `encoder` MusicXML element.
    public static let encoder = Self("encoder")

    /// The `encoding` MusicXML element.
    public static let encoding = Self("encoding")

    /// The `encoding-date` MusicXML element.
    public static let encodingDate = Self("encoding-date")

    /// The `encoding-description` MusicXML element.
    public static let encodingDescription = Self("encoding-description")

    /// The `ending` MusicXML element.
    public static let ending = Self("ending")

    /// The `end-line` MusicXML element.
    public static let endLine = Self("end-line")

    /// The `end-paragraph` MusicXML element.
    public static let endParagraph = Self("end-paragraph")

    /// The `ensemble` MusicXML element.
    public static let ensemble = Self("ensemble")

    /// The `except-voice` MusicXML element.
    public static let exceptVoice = Self("except-voice")

    /// The `extend` MusicXML element.
    public static let extend = Self("extend")

    /// The `eyeglasses` MusicXML element.
    public static let eyeglasses = Self("eyeglasses")

    /// The `f` MusicXML element.
    public static let f = Self("f")

    /// The `falloff` MusicXML element.
    public static let falloff = Self("falloff")

    /// The `feature` MusicXML element.
    public static let feature = Self("feature")

    /// The `fermata` MusicXML element.
    public static let fermata = Self("fermata")

    /// The `ff` MusicXML element.
    public static let ff = Self("ff")

    /// The `fff` MusicXML element.
    public static let fff = Self("fff")

    /// The `ffff` MusicXML element.
    public static let ffff = Self("ffff")

    /// The `fffff` MusicXML element.
    public static let fffff = Self("fffff")

    /// The `ffffff` MusicXML element.
    public static let ffffff = Self("ffffff")

    /// The `fifths` MusicXML element.
    public static let fifths = Self("fifths")

    /// The `figure` MusicXML element.
    public static let figure = Self("figure")

    /// The `figured-bass` MusicXML element.
    public static let figuredBass = Self("figured-bass")

    /// The `figure-number` MusicXML element.
    public static let figureNumber = Self("figure-number")

    /// The `fingering` MusicXML element.
    public static let fingering = Self("fingering")

    /// The `fingernails` MusicXML element.
    public static let fingernails = Self("fingernails")

    /// The `first` MusicXML element.
    public static let first = Self("first")

    /// The `first-fret` MusicXML element.
    public static let firstFret = Self("first-fret")

    /// The `flip` MusicXML element.
    public static let flip = Self("flip")

    /// The `footnote` MusicXML element.
    public static let footnote = Self("footnote")

    /// The `for-part` MusicXML element.
    public static let forPart = Self("for-part")

    /// The `forward` MusicXML element.
    public static let forward = Self("forward")

    /// The `fp` MusicXML element.
    public static let fp = Self("fp")

    /// The `frame` MusicXML element.
    public static let frame = Self("frame")

    /// The `frame-frets` MusicXML element.
    public static let frameFrets = Self("frame-frets")

    /// The `frame-note` MusicXML element.
    public static let frameNote = Self("frame-note")

    /// The `frame-strings` MusicXML element.
    public static let frameStrings = Self("frame-strings")

    /// The `fret` MusicXML element.
    public static let fret = Self("fret")

    /// The `function` MusicXML element.
    public static let function = Self("function")

    /// The `fz` MusicXML element.
    public static let fz = Self("fz")

    /// The `glass` MusicXML element.
    public static let glass = Self("glass")

    /// The `glissando` MusicXML element.
    public static let glissando = Self("glissando")

    /// The `glyph` MusicXML element.
    public static let glyph = Self("glyph")

    /// The `golpe` MusicXML element.
    public static let golpe = Self("golpe")

    /// The `grace` MusicXML element.
    public static let grace = Self("grace")

    /// The `group` MusicXML element.
    public static let group = Self("group")

    /// The `group-abbreviation` MusicXML element.
    public static let groupAbbreviation = Self("group-abbreviation")

    /// The `group-abbreviation-display` MusicXML element.
    public static let groupAbbreviationDisplay = Self("group-abbreviation-display")

    /// The `group-barline` MusicXML element.
    public static let groupBarline = Self("group-barline")

    /// The `grouping` MusicXML element.
    public static let grouping = Self("grouping")

    /// The `group-link` MusicXML element.
    public static let groupLink = Self("group-link")

    /// The `group-name` MusicXML element.
    public static let groupName = Self("group-name")

    /// The `group-name-display` MusicXML element.
    public static let groupNameDisplay = Self("group-name-display")

    /// The `group-symbol` MusicXML element.
    public static let groupSymbol = Self("group-symbol")

    /// The `group-time` MusicXML element.
    public static let groupTime = Self("group-time")

    /// The `half-muted` MusicXML element.
    public static let halfMuted = Self("half-muted")

    /// The `hammer-on` MusicXML element.
    public static let hammerOn = Self("hammer-on")

    /// The `handbell` MusicXML element.
    public static let handbell = Self("handbell")

    /// The `harmon-closed` MusicXML element.
    public static let harmonClosed = Self("harmon-closed")

    /// The `harmonic` MusicXML element.
    public static let harmonic = Self("harmonic")

    /// The `harmon-mute` MusicXML element.
    public static let harmonMute = Self("harmon-mute")

    /// The `harmony` MusicXML element.
    public static let harmony = Self("harmony")

    /// The `harp-pedals` MusicXML element.
    public static let harpPedals = Self("harp-pedals")

    /// The `haydn` MusicXML element.
    public static let haydn = Self("haydn")

    /// The `heel` MusicXML element.
    public static let heel = Self("heel")

    /// The `hole` MusicXML element.
    public static let hole = Self("hole")

    /// The `hole-closed` MusicXML element.
    public static let holeClosed = Self("hole-closed")

    /// The `hole-shape` MusicXML element.
    public static let holeShape = Self("hole-shape")

    /// The `hole-type` MusicXML element.
    public static let holeType = Self("hole-type")

    /// The `humming` MusicXML element.
    public static let humming = Self("humming")

    /// The `identification` MusicXML element.
    public static let identification = Self("identification")

    /// The `image` MusicXML element.
    public static let image = Self("image")

    /// The `instrument` MusicXML element.
    public static let instrument = Self("instrument")

    /// The `instrument-abbreviation` MusicXML element.
    public static let instrumentAbbreviation = Self("instrument-abbreviation")

    /// The `instrument-change` MusicXML element.
    public static let instrumentChange = Self("instrument-change")

    /// The `instrument-link` MusicXML element.
    public static let instrumentLink = Self("instrument-link")

    /// The `instrument-name` MusicXML element.
    public static let instrumentName = Self("instrument-name")

    /// The `instruments` MusicXML element.
    public static let instruments = Self("instruments")

    /// The `instrument-sound` MusicXML element.
    public static let instrumentSound = Self("instrument-sound")

    /// The `interchangeable` MusicXML element.
    public static let interchangeable = Self("interchangeable")

    /// The `inversion` MusicXML element.
    public static let inversion = Self("inversion")

    /// The `inverted-mordent` MusicXML element.
    public static let invertedMordent = Self("inverted-mordent")

    /// The `inverted-turn` MusicXML element.
    public static let invertedTurn = Self("inverted-turn")

    /// The `inverted-vertical-turn` MusicXML element.
    public static let invertedVerticalTurn = Self("inverted-vertical-turn")

    /// The `ipa` MusicXML element.
    public static let ipa = Self("ipa")

    /// The `key` MusicXML element.
    public static let key = Self("key")

    /// The `key-accidental` MusicXML element.
    public static let keyAccidental = Self("key-accidental")

    /// The `key-alter` MusicXML element.
    public static let keyAlter = Self("key-alter")

    /// The `key-octave` MusicXML element.
    public static let keyOctave = Self("key-octave")

    /// The `key-step` MusicXML element.
    public static let keyStep = Self("key-step")

    /// The `kind` MusicXML element.
    public static let kind = Self("kind")

    /// The `laughing` MusicXML element.
    public static let laughing = Self("laughing")

    /// The `left-divider` MusicXML element.
    public static let leftDivider = Self("left-divider")

    /// The `left-margin` MusicXML element.
    public static let leftMargin = Self("left-margin")

    /// The `level` MusicXML element.
    public static let level = Self("level")

    /// The `line` MusicXML element.
    public static let line = Self("line")

    /// The `line-detail` MusicXML element.
    public static let lineDetail = Self("line-detail")

    /// The `line-width` MusicXML element.
    public static let lineWidth = Self("line-width")

    /// The `link` MusicXML element.
    public static let link = Self("link")

    /// The `listen` MusicXML element.
    public static let listen = Self("listen")

    /// The `listening` MusicXML element.
    public static let listening = Self("listening")

    /// The `lyric` MusicXML element.
    public static let lyric = Self("lyric")

    /// The `lyric-font` MusicXML element.
    public static let lyricFont = Self("lyric-font")

    /// The `lyric-language` MusicXML element.
    public static let lyricLanguage = Self("lyric-language")

    /// The `measure` MusicXML element.
    public static let measure = Self("measure")

    /// The `measure-distance` MusicXML element.
    public static let measureDistance = Self("measure-distance")

    /// The `measure-layout` MusicXML element.
    public static let measureLayout = Self("measure-layout")

    /// The `measure-numbering` MusicXML element.
    public static let measureNumbering = Self("measure-numbering")

    /// The `measure-repeat` MusicXML element.
    public static let measureRepeat = Self("measure-repeat")

    /// The `measure-style` MusicXML element.
    public static let measureStyle = Self("measure-style")

    /// The `membrane` MusicXML element.
    public static let membrane = Self("membrane")

    /// The `metal` MusicXML element.
    public static let metal = Self("metal")

    /// The `metronome` MusicXML element.
    public static let metronome = Self("metronome")

    /// The `metronome-arrows` MusicXML element.
    public static let metronomeArrows = Self("metronome-arrows")

    /// The `metronome-beam` MusicXML element.
    public static let metronomeBeam = Self("metronome-beam")

    /// The `metronome-dot` MusicXML element.
    public static let metronomeDot = Self("metronome-dot")

    /// The `metronome-note` MusicXML element.
    public static let metronomeNote = Self("metronome-note")

    /// The `metronome-relation` MusicXML element.
    public static let metronomeRelation = Self("metronome-relation")

    /// The `metronome-tied` MusicXML element.
    public static let metronomeTied = Self("metronome-tied")

    /// The `metronome-tuplet` MusicXML element.
    public static let metronomeTuplet = Self("metronome-tuplet")

    /// The `metronome-type` MusicXML element.
    public static let metronomeType = Self("metronome-type")

    /// The `mf` MusicXML element.
    public static let mf = Self("mf")

    /// The `midi-bank` MusicXML element.
    public static let midiBank = Self("midi-bank")

    /// The `midi-channel` MusicXML element.
    public static let midiChannel = Self("midi-channel")

    /// The `midi-device` MusicXML element.
    public static let midiDevice = Self("midi-device")

    /// The `midi-instrument` MusicXML element.
    public static let midiInstrument = Self("midi-instrument")

    /// The `midi-name` MusicXML element.
    public static let midiName = Self("midi-name")

    /// The `midi-program` MusicXML element.
    public static let midiProgram = Self("midi-program")

    /// The `midi-unpitched` MusicXML element.
    public static let midiUnpitched = Self("midi-unpitched")

    /// The `millimeters` MusicXML element.
    public static let millimeters = Self("millimeters")

    /// The `miscellaneous` MusicXML element.
    public static let miscellaneous = Self("miscellaneous")

    /// The `miscellaneous-field` MusicXML element.
    public static let miscellaneousField = Self("miscellaneous-field")

    /// The `mode` MusicXML element.
    public static let mode = Self("mode")

    /// The `mordent` MusicXML element.
    public static let mordent = Self("mordent")

    /// The `movement-number` MusicXML element.
    public static let movementNumber = Self("movement-number")

    /// The `movement-title` MusicXML element.
    public static let movementTitle = Self("movement-title")

    /// The `mp` MusicXML element.
    public static let mp = Self("mp")

    /// The `multiple-rest` MusicXML element.
    public static let multipleRest = Self("multiple-rest")

    /// The `music-font` MusicXML element.
    public static let musicFont = Self("music-font")

    /// The `mute` MusicXML element.
    public static let mute = Self("mute")

    /// The `n` MusicXML element.
    public static let n = Self("n")

    /// The `natural` MusicXML element.
    public static let natural = Self("natural")

    /// The `non-arpeggiate` MusicXML element.
    public static let nonArpeggiate = Self("non-arpeggiate")

    /// The `normal-dot` MusicXML element.
    public static let normalDot = Self("normal-dot")

    /// The `normal-notes` MusicXML element.
    public static let normalNotes = Self("normal-notes")

    /// The `normal-type` MusicXML element.
    public static let normalType = Self("normal-type")

    /// The `notations` MusicXML element.
    public static let notations = Self("notations")

    /// The `note` MusicXML element.
    public static let note = Self("note")

    /// The `notehead` MusicXML element.
    public static let notehead = Self("notehead")

    /// The `notehead-text` MusicXML element.
    public static let noteheadText = Self("notehead-text")

    /// The `note-size` MusicXML element.
    public static let noteSize = Self("note-size")

    /// The `numeral` MusicXML element.
    public static let numeral = Self("numeral")

    /// The `numeral-alter` MusicXML element.
    public static let numeralAlter = Self("numeral-alter")

    /// The `numeral-fifths` MusicXML element.
    public static let numeralFifths = Self("numeral-fifths")

    /// The `numeral-key` MusicXML element.
    public static let numeralKey = Self("numeral-key")

    /// The `numeral-mode` MusicXML element.
    public static let numeralMode = Self("numeral-mode")

    /// The `numeral-root` MusicXML element.
    public static let numeralRoot = Self("numeral-root")

    /// The `octave` MusicXML element.
    public static let octave = Self("octave")

    /// The `octave-change` MusicXML element.
    public static let octaveChange = Self("octave-change")

    /// The `octave-shift` MusicXML element.
    public static let octaveShift = Self("octave-shift")

    /// The `offset` MusicXML element.
    public static let offset = Self("offset")

    /// The `open` MusicXML element.
    public static let open = Self("open")

    /// The `open-string` MusicXML element.
    public static let openString = Self("open-string")

    /// The `opus` MusicXML element.
    public static let opus = Self("opus")

    /// The `opus-link` MusicXML element.
    public static let opusLink = Self("opus-link")

    /// The `ornaments` MusicXML element.
    public static let ornaments = Self("ornaments")

    /// The `other-appearance` MusicXML element.
    public static let otherAppearance = Self("other-appearance")

    /// The `other-articulation` MusicXML element.
    public static let otherArticulation = Self("other-articulation")

    /// The `other-direction` MusicXML element.
    public static let otherDirection = Self("other-direction")

    /// The `other-dynamics` MusicXML element.
    public static let otherDynamics = Self("other-dynamics")

    /// The `other-listen` MusicXML element.
    public static let otherListen = Self("other-listen")

    /// The `other-listening` MusicXML element.
    public static let otherListening = Self("other-listening")

    /// The `other-notation` MusicXML element.
    public static let otherNotation = Self("other-notation")

    /// The `other-ornament` MusicXML element.
    public static let otherOrnament = Self("other-ornament")

    /// The `other-percussion` MusicXML element.
    public static let otherPercussion = Self("other-percussion")

    /// The `other-play` MusicXML element.
    public static let otherPlay = Self("other-play")

    /// The `other-technical` MusicXML element.
    public static let otherTechnical = Self("other-technical")

    /// The `p` MusicXML element.
    public static let p = Self("p")

    /// The `page-height` MusicXML element.
    public static let pageHeight = Self("page-height")

    /// The `page-layout` MusicXML element.
    public static let pageLayout = Self("page-layout")

    /// The `page-margins` MusicXML element.
    public static let pageMargins = Self("page-margins")

    /// The `page-width` MusicXML element.
    public static let pageWidth = Self("page-width")

    /// The `pan` MusicXML element.
    public static let pan = Self("pan")

    /// The `part` MusicXML element.
    public static let part = Self("part")

    /// The `part-abbreviation` MusicXML element.
    public static let partAbbreviation = Self("part-abbreviation")

    /// The `part-abbreviation-display` MusicXML element.
    public static let partAbbreviationDisplay = Self("part-abbreviation-display")

    /// The `part-clef` MusicXML element.
    public static let partClef = Self("part-clef")

    /// The `part-group` MusicXML element.
    public static let partGroup = Self("part-group")

    /// The `part-link` MusicXML element.
    public static let partLink = Self("part-link")

    /// The `part-list` MusicXML element.
    public static let partList = Self("part-list")

    /// The `part-name` MusicXML element.
    public static let partName = Self("part-name")

    /// The `part-name-display` MusicXML element.
    public static let partNameDisplay = Self("part-name-display")

    /// The `part-symbol` MusicXML element.
    public static let partSymbol = Self("part-symbol")

    /// The `part-transpose` MusicXML element.
    public static let partTranspose = Self("part-transpose")

    /// The `pedal` MusicXML element.
    public static let pedal = Self("pedal")

    /// The `pedal-alter` MusicXML element.
    public static let pedalAlter = Self("pedal-alter")

    /// The `pedal-step` MusicXML element.
    public static let pedalStep = Self("pedal-step")

    /// The `pedal-tuning` MusicXML element.
    public static let pedalTuning = Self("pedal-tuning")

    /// The `percussion` MusicXML element.
    public static let percussion = Self("percussion")

    /// The `per-minute` MusicXML element.
    public static let perMinute = Self("per-minute")

    /// The `pf` MusicXML element.
    public static let pf = Self("pf")

    /// The `pitch` MusicXML element.
    public static let pitch = Self("pitch")

    /// The `pitched` MusicXML element.
    public static let pitched = Self("pitched")

    /// The `play` MusicXML element.
    public static let play = Self("play")

    /// The `player` MusicXML element.
    public static let player = Self("player")

    /// The `player-name` MusicXML element.
    public static let playerName = Self("player-name")

    /// The `plop` MusicXML element.
    public static let plop = Self("plop")

    /// The `pluck` MusicXML element.
    public static let pluck = Self("pluck")

    /// The `pp` MusicXML element.
    public static let pp = Self("pp")

    /// The `ppp` MusicXML element.
    public static let ppp = Self("ppp")

    /// The `pppp` MusicXML element.
    public static let pppp = Self("pppp")

    /// The `ppppp` MusicXML element.
    public static let ppppp = Self("ppppp")

    /// The `pppppp` MusicXML element.
    public static let pppppp = Self("pppppp")

    /// The `pre-bend` MusicXML element.
    public static let preBend = Self("pre-bend")

    /// The `prefix` MusicXML element.
    public static let prefix = Self("prefix")

    /// The `principal-voice` MusicXML element.
    public static let principalVoice = Self("principal-voice")

    /// The `print` MusicXML element.
    public static let print = Self("print")

    /// The `pull-off` MusicXML element.
    public static let pullOff = Self("pull-off")

    /// The `rehearsal` MusicXML element.
    public static let rehearsal = Self("rehearsal")

    /// The `relation` MusicXML element.
    public static let relation = Self("relation")

    /// The `release` MusicXML element.
    public static let release = Self("release")

    /// The `repeat` MusicXML element.
    public static let `repeat` = Self("repeat")

    /// The `rest` MusicXML element.
    public static let rest = Self("rest")

    /// The `rf` MusicXML element.
    public static let rf = Self("rf")

    /// The `rfz` MusicXML element.
    public static let rfz = Self("rfz")

    /// The `right-divider` MusicXML element.
    public static let rightDivider = Self("right-divider")

    /// The `right-margin` MusicXML element.
    public static let rightMargin = Self("right-margin")

    /// The `rights` MusicXML element.
    public static let rights = Self("rights")

    /// The `root` MusicXML element.
    public static let root = Self("root")

    /// The `root-alter` MusicXML element.
    public static let rootAlter = Self("root-alter")

    /// The `rootfile` MusicXML element.
    public static let rootfile = Self("rootfile")

    /// The `rootfiles` MusicXML element.
    public static let rootfiles = Self("rootfiles")

    /// The `root-step` MusicXML element.
    public static let rootStep = Self("root-step")

    /// The `scaling` MusicXML element.
    public static let scaling = Self("scaling")

    /// The `schleifer` MusicXML element.
    public static let schleifer = Self("schleifer")

    /// The `scoop` MusicXML element.
    public static let scoop = Self("scoop")

    /// The `scordatura` MusicXML element.
    public static let scordatura = Self("scordatura")

    /// The `score` MusicXML element.
    public static let score = Self("score")

    /// The `score-instrument` MusicXML element.
    public static let scoreInstrument = Self("score-instrument")

    /// The `score-part` MusicXML element.
    public static let scorePart = Self("score-part")

    /// The `score-partwise` MusicXML element.
    public static let scorePartwise = Self("score-partwise")

    /// The `score-timewise` MusicXML element.
    public static let scoreTimewise = Self("score-timewise")

    /// The `second` MusicXML element.
    public static let second = Self("second")

    /// The `segno` MusicXML element.
    public static let segno = Self("segno")

    /// The `semi-pitched` MusicXML element.
    public static let semiPitched = Self("semi-pitched")

    /// The `senza-misura` MusicXML element.
    public static let senzaMisura = Self("senza-misura")

    /// The `sf` MusicXML element.
    public static let sf = Self("sf")

    /// The `sffz` MusicXML element.
    public static let sffz = Self("sffz")

    /// The `sfp` MusicXML element.
    public static let sfp = Self("sfp")

    /// The `sfpp` MusicXML element.
    public static let sfpp = Self("sfpp")

    /// The `sfz` MusicXML element.
    public static let sfz = Self("sfz")

    /// The `sfzp` MusicXML element.
    public static let sfzp = Self("sfzp")

    /// The `shake` MusicXML element.
    public static let shake = Self("shake")

    /// The `sign` MusicXML element.
    public static let sign = Self("sign")

    /// The `slash` MusicXML element.
    public static let slash = Self("slash")

    /// The `slash-dot` MusicXML element.
    public static let slashDot = Self("slash-dot")

    /// The `slash-type` MusicXML element.
    public static let slashType = Self("slash-type")

    /// The `slide` MusicXML element.
    public static let slide = Self("slide")

    /// The `slur` MusicXML element.
    public static let slur = Self("slur")

    /// The `smear` MusicXML element.
    public static let smear = Self("smear")

    /// The `snap-pizzicato` MusicXML element.
    public static let snapPizzicato = Self("snap-pizzicato")

    /// The `soft-accent` MusicXML element.
    public static let softAccent = Self("soft-accent")

    /// The `software` MusicXML element.
    public static let software = Self("software")

    /// The `solo` MusicXML element.
    public static let solo = Self("solo")

    /// The `sound` MusicXML element.
    public static let sound = Self("sound")

    /// The `sounds` MusicXML element.
    public static let sounds = Self("sounds")

    /// The `sounding-pitch` MusicXML element.
    public static let soundingPitch = Self("sounding-pitch")

    /// The `source` MusicXML element.
    public static let source = Self("source")

    /// The `spiccato` MusicXML element.
    public static let spiccato = Self("spiccato")

    /// The `staccatissimo` MusicXML element.
    public static let staccatissimo = Self("staccatissimo")

    /// The `staccato` MusicXML element.
    public static let staccato = Self("staccato")

    /// The `staff` MusicXML element.
    public static let staff = Self("staff")

    /// The `staff-details` MusicXML element.
    public static let staffDetails = Self("staff-details")

    /// The `staff-distance` MusicXML element.
    public static let staffDistance = Self("staff-distance")

    /// The `staff-divide` MusicXML element.
    public static let staffDivide = Self("staff-divide")

    /// The `staff-layout` MusicXML element.
    public static let staffLayout = Self("staff-layout")

    /// The `staff-lines` MusicXML element.
    public static let staffLines = Self("staff-lines")

    /// The `staff-size` MusicXML element.
    public static let staffSize = Self("staff-size")

    /// The `staff-tuning` MusicXML element.
    public static let staffTuning = Self("staff-tuning")

    /// The `staff-type` MusicXML element.
    public static let staffType = Self("staff-type")

    /// The `staves` MusicXML element.
    public static let staves = Self("staves")

    /// The `stem` MusicXML element.
    public static let stem = Self("stem")

    /// The `step` MusicXML element.
    public static let step = Self("step")

    /// The `stick` MusicXML element.
    public static let stick = Self("stick")

    /// The `stick-location` MusicXML element.
    public static let stickLocation = Self("stick-location")

    /// The `stick-material` MusicXML element.
    public static let stickMaterial = Self("stick-material")

    /// The `stick-type` MusicXML element.
    public static let stickType = Self("stick-type")

    /// The `stopped` MusicXML element.
    public static let stopped = Self("stopped")

    /// The `straight` MusicXML element.
    public static let straight = Self("straight")

    /// The `stress` MusicXML element.
    public static let stress = Self("stress")

    /// The `string` MusicXML element.
    public static let string = Self("string")

    /// The `string-mute` MusicXML element.
    public static let stringMute = Self("string-mute")

    /// The `strong-accent` MusicXML element.
    public static let strongAccent = Self("strong-accent")

    /// The `suffix` MusicXML element.
    public static let suffix = Self("suffix")

    /// The `supports` MusicXML element.
    public static let supports = Self("supports")

    /// The `swing` MusicXML element.
    public static let swing = Self("swing")

    /// The `swing-style` MusicXML element.
    public static let swingStyle = Self("swing-style")

    /// The `swing-type` MusicXML element.
    public static let swingType = Self("swing-type")

    /// The `syllabic` MusicXML element.
    public static let syllabic = Self("syllabic")

    /// The `symbol` MusicXML element.
    public static let symbol = Self("symbol")

    /// The `sync` MusicXML element.
    public static let sync = Self("sync")

    /// The `system-distance` MusicXML element.
    public static let systemDistance = Self("system-distance")

    /// The `system-dividers` MusicXML element.
    public static let systemDividers = Self("system-dividers")

    /// The `system-layout` MusicXML element.
    public static let systemLayout = Self("system-layout")

    /// The `system-margins` MusicXML element.
    public static let systemMargins = Self("system-margins")

    /// The `tap` MusicXML element.
    public static let tap = Self("tap")

    /// The `technical` MusicXML element.
    public static let technical = Self("technical")

    /// The `tenths` MusicXML element.
    public static let tenths = Self("tenths")

    /// The `tenuto` MusicXML element.
    public static let tenuto = Self("tenuto")

    /// The `text` MusicXML element.
    public static let text = Self("text")

    /// The `thumb-position` MusicXML element.
    public static let thumbPosition = Self("thumb-position")

    /// The `tie` MusicXML element.
    public static let tie = Self("tie")

    /// The `tied` MusicXML element.
    public static let tied = Self("tied")

    /// The `time` MusicXML element.
    public static let time = Self("time")

    /// The `time-modification` MusicXML element.
    public static let timeModification = Self("time-modification")

    /// The `time-relation` MusicXML element.
    public static let timeRelation = Self("time-relation")

    /// The `timpani` MusicXML element.
    public static let timpani = Self("timpani")

    /// The `title` MusicXML element.
    public static let title = Self("title")

    /// The `toe` MusicXML element.
    public static let toe = Self("toe")

    /// The `top-margin` MusicXML element.
    public static let topMargin = Self("top-margin")

    /// The `top-system-distance` MusicXML element.
    public static let topSystemDistance = Self("top-system-distance")

    /// The `touching-pitch` MusicXML element.
    public static let touchingPitch = Self("touching-pitch")

    /// The `transpose` MusicXML element.
    public static let transpose = Self("transpose")

    /// The `tremolo` MusicXML element.
    public static let tremolo = Self("tremolo")

    /// The `trill-mark` MusicXML element.
    public static let trillMark = Self("trill-mark")

    /// The `triple-tongue` MusicXML element.
    public static let tripleTongue = Self("triple-tongue")

    /// The `tuning-alter` MusicXML element.
    public static let tuningAlter = Self("tuning-alter")

    /// The `tuning-octave` MusicXML element.
    public static let tuningOctave = Self("tuning-octave")

    /// The `tuning-step` MusicXML element.
    public static let tuningStep = Self("tuning-step")

    /// The `tuplet` MusicXML element.
    public static let tuplet = Self("tuplet")

    /// The `tuplet-actual` MusicXML element.
    public static let tupletActual = Self("tuplet-actual")

    /// The `tuplet-dot` MusicXML element.
    public static let tupletDot = Self("tuplet-dot")

    /// The `tuplet-normal` MusicXML element.
    public static let tupletNormal = Self("tuplet-normal")

    /// The `tuplet-number` MusicXML element.
    public static let tupletNumber = Self("tuplet-number")

    /// The `tuplet-type` MusicXML element.
    public static let tupletType = Self("tuplet-type")

    /// The `turn` MusicXML element.
    public static let turn = Self("turn")

    /// The `type` MusicXML element.
    public static let type = Self("type")

    /// The `unpitched` MusicXML element.
    public static let unpitched = Self("unpitched")

    /// The `unstress` MusicXML element.
    public static let unstress = Self("unstress")

    /// The `up-bow` MusicXML element.
    public static let upBow = Self("up-bow")

    /// The `vertical-turn` MusicXML element.
    public static let verticalTurn = Self("vertical-turn")

    /// The `virtual-instrument` MusicXML element.
    public static let virtualInstrument = Self("virtual-instrument")

    /// The `virtual-library` MusicXML element.
    public static let virtualLibrary = Self("virtual-library")

    /// The `virtual-name` MusicXML element.
    public static let virtualName = Self("virtual-name")

    /// The `voice` MusicXML element.
    public static let voice = Self("voice")

    /// The `volume` MusicXML element.
    public static let volume = Self("volume")

    /// The `wait` MusicXML element.
    public static let wait = Self("wait")

    /// The `wavy-line` MusicXML element.
    public static let wavyLine = Self("wavy-line")

    /// The `wedge` MusicXML element.
    public static let wedge = Self("wedge")

    /// The `with-bar` MusicXML element.
    public static let withBar = Self("with-bar")

    /// The `wood` MusicXML element.
    public static let wood = Self("wood")

    /// The `word-font` MusicXML element.
    public static let wordFont = Self("word-font")

    /// The `words` MusicXML element.
    public static let words = Self("words")

    /// The `work` MusicXML element.
    public static let work = Self("work")

    /// The `work-number` MusicXML element.
    public static let workNumber = Self("work-number")

    /// The `work-title` MusicXML element.
    public static let workTitle = Self("work-title")

    // MARK: Public Initializers

    /// Creates a new element name with the provided string value.
    ///
    /// If the provided string value is empty, this initializer returns `nil`.
    ///
    /// - Parameter stringValue:    The string value to use for the new
    ///                             element name.
    public init?(stringValue: String) {
        guard Self.isValid(stringValue)
        else { return nil }

        self.stringValue = stringValue
    }

    // MARK: Public Instance Properties

    /// The string value that represents this element name.
    ///
    /// A new instance initialized with `stringValue` will be equivalent to
    /// this instance.
    public var stringValue: String
}

// MARK: - XML.Element

extension MXLElement: XMLElement {
}

// swiftlint:enable file_length type_body_length
