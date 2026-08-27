# MusicXML Migration Table

Derived by diffing the six vendored schemas in `Specifications/schema-{1.0,1.1,2.0,3.0,3.1,4.0}/`.
Nothing here is written from memory; every row cites the schema files and the element or attribute
names it was derived from.

**Nothing in this document is code**, but it is the specification the normalizer and parser are
written against, and it is cited by name from their DocC. It is the authority for:

- **The per-version pass chain** — the *migrating* rows in §3 are the whole of it.
  `MXLNormalizer.Pass1_0` implements row M1, `Pass1_1` implements M3–M5, and `Pass3_1`
  implements M8–M9, each naming its rows in its DocC.
- **The diagnostic spellings** — the `deprecatedElement` / `deprecatedAttribute` cases of
  `MXLParser.Diagnostic` come from §4 below.
- **The migration fixtures** — §7 lists the per-version synthetic fixtures in
  `Tests/IvorMusicXMLTests/Fixtures/Synthetic/`, exercised by `MXLNormalizerMigrationTests`.
- **What the package cannot represent** — §5 is cited by `FixtureLoader.Fixture.Expectation`
  for the conforming-but-unrepresentable fixtures. P3 there records the one parser-side
  restriction that has since been fixed, and why the fix was a breaking AST change.
- **Why opus has no rows at all** — the opus schema has never changed structurally (§6.2), so
  `MXLNormalizer` runs no pass over an opus, only the closing version stamp.

Changing a row here means changing the pass, the diagnostic, or the fixture that cites it.

---

## 1. Method

The six versions are not all XSDs, so the five adjacent-pair diffs were three different jobs.

| Version | Schema form | Files diffed |
|---|---|---|
| 1.0 | **DTD** | 12 `.dtd` (all except `MIDIEvents10.dtd`, `midixml.dtd`) |
| 1.1 | **DTD** | same set **plus `layout.dtd`** |
| 2.0 | XSD | `musicxml.xsd`, `opus.xsd` |
| 3.0, 3.1 | XSD | `musicxml.xsd`, `opus.xsd` |
| 4.0 | XSD | `musicxml.xsd`, `opus.xsd`; `container.xsd` and `sounds.xsd` are 4.0-only additions |

`midixml.dtd` and `MIDIEvents10.dtd` are the MIDI XML vocabulary, not MusicXML, and were excluded
from every version. `ISOlat1.pen`/`ISOlat2.pen`/`isolat*.ent` are character-entity sets with no
element or attribute declarations.

Rather than a textual diff — meaningless across the 1.1→2.0 DTD/XSD boundary, and noisy elsewhere
because both formalisms reorder freely — each version was reduced to the same normalized shape:

```
element name → { attributes: { name → { enum, required, default, type } },
                 children:   [ name ],
                 occurs:     { child name → minOccurs:maxOccurs } }
```

- **From the DTDs**, `<!ENTITY %…>` parameter entities were expanded recursively before reading
  `<!ELEMENT>` and `<!ATTLIST>`, so `%print-style;` and friends resolve to their constituent
  attributes. Enumerations come from parenthesized `<!ATTLIST>` types; `#REQUIRED` gives
  requiredness.
- **From the XSDs**, each `xs:element name=` was resolved through its named or inline
  `xs:complexType`, following `xs:attributeGroup ref=`, `xs:group ref=`, and
  `complexContent`/`simpleContent` `extension`/`restriction` bases recursively. Enumerations come
  from the named `xs:simpleType` the attribute's `type=` points at; requiredness from `use=`.
- Attribute `ref=`s keep their prefix (`xml:lang`, `xlink:href`) so they line up with their DTD
  spellings.

Named `xs:simpleType` enumerations were additionally diffed directly, version to version, because
MusicXML carries most of its controlled vocabularies in *element content* (`<sign>`, `<note-type>`,
`<kind>`), where an attribute-level diff cannot see them.

### 1.1 Known limits of the method

Three classes of difference are invisible to this diff and were checked by hand instead:

- **Element-content enumerations in 1.0/1.1.** The DTDs declare these as `(#PCDATA)` and list the
  legal values only in prose comments. No mechanical diff is possible across 1.1→2.0 for them; the
  §3 rows that touch element content were read out of the comments directly.
- **Effective cardinality.** `minOccurs`/`maxOccurs` were compared element-locally, so a child that
  moved into or out of an enclosing `xs:choice`/`xs:sequence` wrapper reports a spurious change.
  Every hit in §6 was inspected; **all five are wrapper artifacts, and no child's effective
  cardinality changed in any version.**
- **`xmlns:xlink`.** The 1.0/1.1 DTDs declare this on `<link>`, `<opus>`, `<opus-link>`, and
  `<score>` as an ordinary `#FIXED` attribute; the XSDs handle it as a namespace declaration
  instead (`schema-4.0/musicxml.xsd:2364` comments it out explicitly). Its apparent removal at
  1.1→2.0 is a formalism artifact, not a change.

---

## 2. Headline findings

These three shape the normalizer more than any individual row.

1. **No element has ever been removed or renamed, in any of the five steps.** The element-name set
   grows monotonically: 273 → 309 → 346 → 391 → 414 → 445. There is therefore **no
   `renamedElement` migration**, and `MXLNormalizer.Change.renamedElement(_:_:)` has no caller in
   the schema record. The case is kept (it is cheap and forward-looking), but no work should be
   planned against it.
2. **No enumeration value has ever been removed at the `xs:simpleType` level**, across all four XSD
   pairs. Exactly one attribute narrowed its value set, by being re-typed: `<frame>@valign` moved
   from `valign` to `valign-image` at 3.0, dropping `baseline` (§5, row P2).
3. **Deprecation, not removal, is how MusicXML evolves**, and deprecations are recorded only in
   `xs:documentation` prose — never in the declarations. The migration table is therefore driven by
   the nine prose deprecations in §3, harvested by grepping `eprecat` across all six schema sets,
   not by the structural diff. The structural diff's value is negative evidence: it proves those
   nine are the whole story.

**The migration table is small — nine rows, six of them migrating.** The per-version pass chain is
correspondingly small; the early worry that it "might hold two hundred rows" was unfounded. The
part-wise↔time-wise transform (`MXLScoreTransform`) is the larger half of the normalizer, and
nothing in this table bears on its scope.

---

## 3. The migration table

Nine rows, classified as: **migrating** — the normalizer
rewrites it; **informational** — the parser emits a `Diagnostic` and the value passes through;
**no-op** — a pure addition needing no rewrite (no row here is a no-op; the additions in §6 are).

The **AST** column is the cross-check: whether the package can represent the
deprecated spelling at all. **All nine are representable — there are no dead rows.** The parser was
written against 4.0, but 4.0 still declares every deprecated spelling, so the parser reads them all.

| # | Deprecated spelling | Since | Superseded by | Class | AST |
|---|---|---|---|---|---|
| M1 | `<print>@staff-spacing` | 1.1 | `<staff-layout><staff-distance>` | migrating | `MXLPrint.Attributes.staffSpacing` |
| M2 | `<attributes><directive>` | 2.0 | `<direction>@directive` | informational | `MXLAttributes.directive: [Directive]` |
| M3 | `<part-name>` / `<part-abbreviation>` formatting attributes | 2.0 | `<part-name-display>` / `<part-abbreviation-display>` | migrating | `MXLPartName.Text` |
| M4 | `<group-name>` / `<group-abbreviation>` formatting attributes | 2.0 | `<group-name-display>` / `<group-abbreviation-display>` | migrating | `MXLGroupName.Text` |
| M5 | `<sound>@pan`, `<sound>@elevation` | 2.0 | `<midi-instrument><pan>` / `<elevation>` | migrating (conditional) | `MXLSound.pan`, `.elevation` |
| M6 | `<beam>@repeater` | 3.0 | `<tremolo>` | informational | `MXLBeam.repeater` |
| M7 | `@bezier-offset`, `@bezier-offset2` | 3.1 | `@bezier-x`, `@bezier-x2` | informational | `MXLSlur`/`MXLTied` bezier offsets |
| M8 | `<harmony><function>` | 4.0 | `<numeral>` | migrating (conditional) | `MXLHarmony.Chord.Content.function` |
| M9 | `<clef><sign>none</sign>` | 4.0 | `<clef print-object="no">` | migrating | `MXLClef.Sign.invisible` |

### M1 — `<print>@staff-spacing` → `<staff-layout>` *(1.1, migrating)*

**Derivation.** `schema-1.0/direction.dtd:413` declares `staff-spacing %tenths; #IMPLIED` on
`<print>` with no deprecation note. `schema-1.1/direction.dtd:510–517` adds the prose: *"This is
deprecated in MusicXML 1.1; the staff-layout element should be used instead. If both are present,
the staff-layout values take priority."* The attribute survives verbatim into
`schema-4.0/musicxml.xsd:2343` (attribute group `print-attributes`), with the same note at
`:2341`. `<staff-layout>` arrives with `schema-1.1/layout.dtd`, the pair's headline addition.

**Rewrite.** When `staffSpacing` is present and `layout.staffLayout` is empty, synthesize a single
`MXLStaffLayout` with `staffDistance` set from it and no `number` (meaning all staves), then clear
`staffSpacing`. When `staffLayout` is already populated, the spec's own precedence rule applies —
drop `staffSpacing` and emit the `Change` anyway, since the value was already inert.
Emit `replacedConstruct("print/@staff-spacing", "staff-layout/staff-distance")`.

**Targets exist:** `MXLPrint.layout: MXLLayout` → `staffLayout: [MXLStaffLayout]`.

### M2 — `<attributes><directive>` → `<direction>@directive` *(2.0, informational)*

**Derivation.** `schema-1.0/attributes.dtd:222–223` declares `<!ELEMENT directive (#PCDATA)>` as a
child of `<attributes>` (`:32`). `schema-2.0/musicxml.xsd` keeps it and adds the note, retained at
`schema-4.0/musicxml.xsd:2882`: *"This element has been deprecated in Version 2.0 in favor of the
directive attribute for direction elements."*

**Classified informational, deliberately.** The replacement is not a like-for-like rewrite: the
deprecated form is a *text-carrying element inside `<attributes>`*, while the replacement is a
`yes-no` *flag on a `<direction>`* whose text lives in a `<direction-type><words>`. Migrating means
synthesizing a whole `<direction>` element and choosing where in the measure's music-item sequence
to insert it — a structural, order-affecting edit, and the only one in this table. That is a
normalizer overreach for a construct the AST already models faithfully. Emit
`deprecatedElement("directive")` from the parser and pass it through.

### M3, M4 — `<part-name>` / `<group-name>` formatting attributes → `*-display` *(2.0, migrating)*

**Derivation.** These attributes have a one-version life. `schema-1.0/score.dtd:67,89` declare
`<!ELEMENT part-name (#PCDATA)>` and `<!ELEMENT group-name (#PCDATA)>` with **no `<!ATTLIST>` at
all**. `schema-1.1/score.dtd:126–127,158–159` adds the `<!ATTLIST>`s carrying `%print-style;` and
`%justify;`. `schema-2.0/musicxml.xsd` then deprecates them, in the wording retained at
`schema-4.0/musicxml.xsd:2412–2419` (attribute group `part-name-text`) and `:2375–2381`
(`group-name-text`): *"The print-style and justify attribute groups are deprecated in MusicXML 2.0
in favor of the new part-name-display and part-abbreviation-display elements."* The replacement
elements `<part-name-display>`, `<part-abbreviation-display>`, `<group-name-display>`,
`<group-abbreviation-display>` are all in the 1.1→2.0 addition set (§6).

**Rewrite.** For each of the four name elements, when its `Text` carries any formatting (`color`,
`font`, `justify`, `position`, and `printsObject` for part names) and the sibling `*Display`
property is `nil`, synthesize an `MXLNameDisplay` holding one `<display-text>` with the element's
string value and the same formatting, then reset the `Text` to its empty state. When the sibling
display element is already present, drop the formatting and emit the `Change` — again the spec's
own precedence.
Emit `replacedConstruct("part-name/@font-size", "part-name-display/display-text")` and siblings.

**Targets exist:** `MXLScorePart.nameDisplay`, `.abbreviationDisplay` (both `MXLNameDisplay?`), and
the `MXLPartGroup` equivalents.

**Note the asymmetry:** `part-name-text` includes `print-object`, `group-name-text` does not
(`schema-4.0/musicxml.xsd:2417` vs `:2379`), which matches `MXLPartName.Text.printsObject`
existing and `MXLGroupName.Text` having no such property. The AST is already correct here.

### M5 — `<sound>@pan`, `@elevation` → `<midi-instrument>` children *(2.0, migrating, conditional)*

**Derivation.** `schema-1.1/direction.dtd:611` declares `pan CDATA #IMPLIED` on `<sound>` (prose at
`:582`). `schema-2.0/musicxml.xsd:1657–1665` introduces `<pan>` and `<elevation>` as
`<midi-instrument>` children and deprecates the attributes; both attributes survive at
`schema-4.0/musicxml.xsd:4175–4176`, the elements at `:2709,2714`. The spec states the tie-break:
*"If both are present, the mid-instrument elements take priority."*

**Rewrite, conditional.** If the `<sound>` has one or more `<midi-instrument>` children whose own
`pan`/`elevation` are `nil`, move the attribute values onto them and clear the attributes. If the
`<sound>` has **no** `<midi-instrument>` child there is no target — leave the attributes in place
and emit only the parser diagnostic. Document the conditional in the pass, since it is the one
migrating row that can decline to migrate.
Emit `replacedConstruct("sound/@pan", "midi-instrument/pan")`.

**Targets exist:** `MXLMidiInstrument.pan` (`:89`), `.elevation` (`:50`).

### M6 — `<beam>@repeater` *(3.0, informational)*

**Derivation.** `schema-1.0/note.dtd:294` declares `repeater %yes-no; #IMPLIED` (prose at `:281`,
*"used for tremolos"*). `schema-3.0/musicxml.xsd:3826,3831` adds the deprecation; still declared at
`schema-4.0/musicxml.xsd:4729`.

**Informational, necessarily.** The schema names no mechanical replacement — the note says only
that a `"yes"` value must be repeated on each beam using it. The semantic successor is `<tremolo>`,
whose `type` and value cannot be recovered from a boolean flag on a beam. Emit
`deprecatedAttribute("repeater")` and pass through.

### M7 — `@bezier-offset`, `@bezier-offset2` *(3.1, informational)*

**Derivation.** `schema-1.0/common.dtd:172–178` declares the `%bezier;` entity with
`bezier-offset`/`bezier-offset2` alongside `bezier-x`/`-y`/`-x2`/`-y2`.
`schema-3.1/musicxml.xsd:1824` and `schema-4.0/musicxml.xsd:1962–1963` retain them with the note at
`schema-4.0/musicxml.xsd:1956`: *"deprecated as of MusicXML 3.1. If both the bezier-x and
bezier-offset attributes are present, the bezier-x attribute takes priority."*

**Informational, necessarily.** The units differ: the offsets are **divisions**, the replacements
are **tenths** (`schema-4.0/musicxml.xsd:1954` says so explicitly). Converting requires the layout
scaling *and* the prevailing divisions, and the two are not commensurable in general — a
normalizer that guessed would silently corrupt curvature. Emit
`deprecatedAttribute("bezier-offset")` / `("bezier-offset2")` and pass through.

There is one safe sub-case worth stating and *not* implementing: when `bezier-x` is also present,
the offset is already inert by the spec's precedence rule, so dropping it would be lossless. It is
not worth a pass of its own; the diagnostic covers it.

### M8 — `<harmony><function>` → `<numeral>` *(4.0, migrating, conditional)*

**Derivation.** `schema-1.0/direction.dtd:231` declares `<!ELEMENT function (#PCDATA)>`;
`schema-2.0/musicxml.xsd:4372` carries it into the XSD unchanged.
`schema-4.0/musicxml.xsd:6415–6420` adds `<numeral>` beside it in the `harmony-chord` group's
`xs:choice` and deprecates `<function>`: *"It has been deprecated as of MusicXML 4.0 in favor of
the numeral element."*

**Rewrite, conditional on the text parsing.** `<function>` is free text; `<numeral>` is structured
(`<numeral-root>` 1–7, optional `<numeral-alter>`, optional `<numeral-key>`). Migrate only when the
text matches the Roman-numeral grammar exactly — an optional leading `b`/`#`/`♭`/`♯`, then `I`–`VII`
in either case, and nothing else. Everything outside that (`V/V`, `viio7`, annotated forms) stays a
`<function>` and gets the parser diagnostic. Being conservative here is the point: a bad guess
turns a chord symbol into a different chord.
Emit `replacedConstruct("harmony/function", "harmony/numeral")` on the rows that convert,
`deprecatedElement("function")` from the parser on all of them.

**Targets exist:** `MXLHarmony.Chord.Content.numeral(MXLNumeral)` alongside `.function`;
`MXLNumeral.Root`, `.Value`, `.Key`, `.Mode`.

### M9 — `<clef><sign>none</sign>` → `<clef print-object="no">` *(4.0, migrating)*

**Derivation.** `schema-4.0/musicxml.xsd:725–740` defines `clef-sign` with `none` among its values
(`:738`) and the note at `:729`: *"The none sign is deprecated as of MusicXML 4.0. Use the clef
element's print-object attribute instead. When the none sign is used, notes should be displayed as
if in treble clef."* The value predates the XSDs; it is present from 2.0 (`clef-sign` simpleType)
and, by the enum diff, was never removed.

**Rewrite, and it is the cleanest row in the table** — the schema states the replacement semantics
in full. Set `sign` to `.g` (treble), set `printsObject` to `false`, leave `line` and `octaveChange`
alone.
Emit `replacedConstruct("clef/sign[none]", "clef/@print-object")`.

**Targets exist:** `MXLClef.Sign.invisible` is the `none` case (`MXLParser+Attributes.swift:103`);
`MXLClef.printsObject` (`:53`).

---

## 4. Seeding `MXLParser.Diagnostic`

`deprecatedElement(String)` and `deprecatedAttribute(String)` are seeded from this table's
*informational* rows. In practice **every** row in §3 should raise a parser diagnostic — a migrating
row's diagnostic reports what the *input* contained, which is information the normalizer's `Change`
does not carry (the `Change` reports what the normalizer *did*, and a caller may skip normalization
entirely).

The complete spelling lists, alphabetical, ready to write once:

**`deprecatedElement`** — 2 spellings:

| Spelling | Row |
|---|---|
| `directive` | M2 |
| `function` | M8 |

**`deprecatedAttribute`** — 15 spellings:

| Spelling | Row |
|---|---|
| `bezier-offset` | M7 |
| `bezier-offset2` | M7 |
| `color` (on `group-abbreviation`, `group-name`, `part-abbreviation`, `part-name`) | M3, M4 |
| `elevation` (on `sound`) | M5 |
| `font-family`, `font-size`, `font-style`, `font-weight` (same four elements) | M3, M4 |
| `justify` (same four elements) | M3, M4 |
| `pan` (on `sound`) | M5 |
| `repeater` | M6 |
| `staff-spacing` | M1 |

M9 is neither an element nor an attribute deprecation but a **value** deprecation. It needs no new
diagnostic case: `<sign>none</sign>` is legal 4.0 and the normalizer's `Change` reports the rewrite.
If a diagnostic is wanted anyway, add `deprecatedValue(String, String)` rather than straining
`deprecatedElement`.

### 4.1 `defaultedVersion` is the *normal* case for 1.0 and 1.1

**The `version` attribute does not exist before 2.0.** It is absent from
`schema-1.0/partwise.dtd` and `schema-1.1/partwise.dtd` entirely, and is introduced at
`schema-2.0/musicxml.xsd:1130` as `<xs:attribute name="version" type="xs:token" default="1.0"/>` —
the same declaration still at `schema-4.0/musicxml.xsd:1994`.

Two consequences for `defaultedVersion`:

- A versionless `<score-partwise>` is not malformed; it is a conforming 1.0 or 1.1 document, and the
  `.v1_0` default is the schema's own. Its doc comment is worded accordingly.
- The diagnostic therefore fires on **every** hand-authored 1.0/1.1 fixture. It is a routine signal,
  not an anomaly — no test may treat a non-empty diagnostic array as failure for those fixtures.

---

## 5. Parser-side findings

These rows are not normalizer work at all: the parser rejects the input before the normalizer can
see it, so none is fixable *in* the normalizer. **P1 and P2 remain open; P3 is resolved.**

### P1 — `<staff-tuning>@line` is required by the parser but optional before 4.0

`line` on `<staff-tuning>` is `use="optional"` through 3.1 and becomes `use="required"` at 4.0 —
one of only two requiredness changes in the entire schema history, and the only tightening.

`MXLStaffTuning.line` is non-optional `MXLStaffLine`, and
`Parser/Internal/MXLParser+Attributes.swift:337` reads it with `valueOfRequiredAttribute`. **A
conforming 1.1–3.1 document that omits `line` therefore throws `MXLParser.Error` and never reaches
the normalizer.** The normalizer cannot supply the default because normalization runs after parsing.

Options, in preference order: (a) relax the parser to `valueOfOptionalAttribute` with a documented
default and let the 3.1→4.0 pass emit `suppliedDefault("staff-tuning", "line")`; (b) accept the
restriction and document that pre-4.0 tablature omitting `line` is unsupported. **(a) is
recommended** — it is a two-line parser change plus one normalizer row, and it is the only thing
standing between the package and full 1.1–3.1 input coverage. It does mean the AST property becomes
optional, which is a breaking change; fold it into the major bump rather than deferring.

### P2 — `<frame>@valign="baseline"` is unrepresentable

`<frame>@valign` is typed `valign` (which includes `baseline`) in 2.0 and re-typed `valign-image`
(which does not) in 3.0 — the only enumeration narrowing in the schema history, and the reason
`baseline` shows up in the attribute-level enum diff while the `xs:simpleType` diff shows no
removals anywhere.

`MXLFrame.valign` is `MXLValignImage?`, whose cases are `bottom`, `middle`, `top` — no `baseline`.
A conforming **2.0** document with `<frame valign="baseline">` cannot be represented and the parser
will reject it. This is correct for 3.0+ input and wrong only for 2.0.

Given that 2.0 `<frame valign="baseline">` is vanishingly rare in the wild and that the AST already
matches the modern schema, **accept this and document it** rather than widening `MXLValignImage`.
This section is that documentation, and `frame-valign-baseline.musicxml` (§7) pins it as a
deliberate divergence rather than an oversight. If it is ever revisited, the
migration is `baseline` → `bottom`, per the `valign-image` documentation's own reasoning that image
alignment "removes the baseline value" because images have no baseline.

### P3 — `<opus><title>` was read as required *(resolved)*

`<title>` is `minOccurs="0"` at `opus.xsd:69`, and was `title?` in the 1.0 and 1.1 DTDs
(`<!ELEMENT opus (title?, (opus | opus-link | score)*)>`) — it has been optional in **every**
version. But `MXLOpus.title` was a non-optional `String` and `Parser/Internal/MXLParser+Opus.swift`
read it with `valueOfRequiredChildElement`, so **a conforming opus with no `<title>` threw at parse**
and never reached a stage that could report it.

Same shape as P1, and fixed the same way: `MXLOpus.title` is now `String?`, the initializer's
parameter defaults to `nil`, and the parser reads it with `valueOfOptionalChildElement`. The
formatter emits `<title>` only when non-`nil`. `String` → `String?` is a breaking change, which is
why it landed in a major bump. Pinned by the `titleless-opus.musicxml` synthetic fixture.

The second requiredness change — `<accord>@string`, `#REQUIRED` in 1.1 and `optional` from 2.0 — is
a relaxation and needs nothing. `MXLAccord.string` is already `MXLStringNumber?`.

---

## 6. Per-pair structural record

The full additive record, for reference. **No row here needs normalizer work**: every entry is a
pure addition, and a document that predates an addition simply does not contain it.

### 6.1 Summary

| Pair | Elements added | Attributes added | Distinct attr names | Enum types added | Removed |
|---|---:|---:|---:|---:|---|
| 1.0 → 1.1 | 36 | 508 across 111 elements | 41 | — (DTD) | none |
| 1.1 → 2.0 | 37 | 448 across 71 elements | 43 | — (DTD→XSD) | none |
| 2.0 → 3.0 | 45 | 109 across 49 elements | 42 | 30 | none |
| 3.0 → 3.1 | 23 | 96 across 78 elements | 15 | 11 | none |
| 3.1 → 4.0 | 31 | 27 across 21 elements | 18 | 11 | none |

Element counts by version: **1.0** 273 · **1.1** 309 · **2.0** 346 · **3.0** 391 · **3.1** 414 ·
**4.0** 445, plus 8 more in 4.0's `container.xsd` and `sounds.xsd`.

### 6.2 Elements added

**1.0 → 1.1** (36) — layout and page geometry arrive as a block, which is `layout.dtd`'s whole
point, plus scordatura, harp pedals, credits, and tremolo:
`accord`, `barre`, `bottom-margin`, `credit`, `credit-words`, `defaults`, `harp-pedals`,
`left-margin`, `lyric-font`, `lyric-language`, `measure-distance`, `measure-layout`, `millimeters`,
`music-font`, `page-height`, `page-layout`, `page-margins`, `page-width`, `pedal-alter`,
`pedal-step`, `pedal-tuning`, `pluck`, `right-margin`, `scaling`, `scordatura`, `staff-distance`,
`staff-layout`, `staff-size`, `system-distance`, `system-layout`, `system-margins`, `tenths`,
`top-margin`, `top-system-distance`, `tremolo`, `word-font`.

**1.1 → 2.0** (37) — the `*-display` elements that supersede M3/M4, the `<pan>`/`<elevation>`
elements that supersede M5, appearance/metronome-note machinery:
`accidental-text`, `accordion-high`, `accordion-low`, `accordion-middle`,
`accordion-registration`, `appearance`, `credit-image`, `display-text`, `elevation`, `ensemble`,
`group-abbreviation-display`, `group-name-display`, `group-time`, `image`, `inverted-turn`,
`key-octave`, `line-width`, `measure-numbering`, `metronome-beam`, `metronome-dot`,
`metronome-note`, `metronome-relation`, `metronome-tuplet`, `metronome-type`, `note-size`,
`other-appearance`, `pan`, `part-abbreviation-display`, `part-name-display`, `part-symbol`,
`relation`, `slash-dot`, `slash-type`, `solo`, `stress`, `unstress`, `volume`.

**2.0 → 3.0** (45) — percussion and playback:
`arrow`, `arrow-direction`, `arrow-style`, `beater`, `circular-arrow`, `credit-type`,
`delayed-inverted-turn`, `distance`, `effect`, `glass`, `handbell`, `hole`, `hole-closed`,
`hole-shape`, `hole-type`, `instrument-sound`, `interchangeable`, `ipa`, `key-accidental`,
`left-divider`, `membrane`, `metal`, `mute`, `notehead-text`, `other-percussion`, `other-play`,
`percussion`, `pitched`, `play`, `principal-voice`, `right-divider`, `semi-pitched`, `stick`,
`stick-location`, `stick-material`, `stick-type`, `string-mute`, `system-dividers`,
`time-relation`, `timpani`, `vertical-turn`, `virtual-instrument`, `virtual-library`,
`virtual-name`, `wood`.

**3.0 → 3.1** (23) — SMuFL:
`arrowhead`, `beat-unit-tied`, `brass-bend`, `credit-symbol`, `except-voice`, `flip`, `glyph`,
`golpe`, `half-muted`, `harmon-closed`, `harmon-mute`, `haydn`, `inverted-vertical-turn`,
`metronome-arrows`, `metronome-tied`, `n`, `open`, `pf`, `sfzp`, `smear`, `soft-accent`,
`staff-divide`, `symbol`.

**3.1 → 4.0** (31) — concert scores, part linking, `<listening>`, and the `<numeral>` group that
supersedes M8:
`assess`, `bass-separator`, `concert-score`, `first`, `for-part`, `group-link`,
`instrument-change`, `instrument-link`, `line-detail`, `listen`, `listening`, `numeral`,
`numeral-alter`, `numeral-fifths`, `numeral-key`, `numeral-mode`, `numeral-root`, `other-listen`,
`other-listening`, `part-clef`, `part-link`, `part-transpose`, `player`, `player-name`, `second`,
`straight`, `swing`, `swing-style`, `swing-type`, `sync`, `wait`.

**4.0 only, separate schemas** — `container.xsd`: `container`, `rootfile`, `rootfiles`;
`sounds.xsd`: `any`, `ensemble`, `solo`, `sound`, `sounds`. Neither is a `MXLDocument.Content` case.
`container.xsd` is modelled by the **internal** `MXLContainer`, reachable only from the `.mxl` read
and write paths (`container.xsd:140`: the container element is the document element for the
`META-INF/container.xml` file). `sounds.xsd` is not modelled at all: every published sounds file —
3.0, 3.1, and 4.0 — is a flat list of empty `<sound id="…"/>` elements, 886, 886, and 894 of them,
with **zero** `<solo>`, `<ensemble>`, or `<any>` children in any version, so its whole information
content is a list of ID strings. `Specifications/schema-4.0/sounds.xml` is instead the source of the
generated internal `MXLStandardSoundID.all`, which backs the
`MXLValidator.Issue.unknownInstrumentSound(_:)` conformance check.

### 6.3 Attributes added, by name and reach

The counts are the number of elements each name was added to. The shape is the same story every
time: an attribute *group* is rolled out across the vocabulary at once.

- **1.0 → 1.1** — `color`(101), `font-family`/`font-size`/`font-style`/`font-weight`(74 each),
  `default-x`/`default-y`/`relative-x`/`relative-y`(15 each), `justify`(6), `print-object`(5),
  then singletons: `bezier-offset`, `bezier-offset2`, `bezier-x`, `bezier-x2`, `bezier-y`,
  `bezier-y2`, `bracket`, `bracket-degrees`, `enclosure`(2), `end-length`, `fan`, `halign`(2),
  `height`, `line-shape`, `number`(2), `page-number`, `parentheses`(2), `parentheses-degrees`,
  `placement`(2), `print-lyric`(2), `print-spacing`, `reference`, `stack-degrees`, `substitution`(2),
  `text`, `use-symbols`, `valign`(2), `version`(2), `width`(2), `xml:lang`.
  This pair is where `%print-style;` becomes universal — 74 of the 111 touched elements gained the
  font group alone.
- **1.1 → 2.0** — `placement`(43), `default-x`/`default-y`/`relative-x`/`relative-y`(38 each),
  the font group(36 each), `color`(33), `print-object`(8), the text-decoration group
  `dir`/`line-through`/`overline`/`rotation`/`underline`(5 each), `text`(5), `location`(4),
  `letter-spacing`(4), `line-height`(3), plus `additional`, `attribute`, `blank-page`, `coda`,
  `directive`, `divisions`, `element`(2), `enclosure`, `halign`(2), `new-page`, `page`,
  `plus-minus`, `position`(2), `segno`, `size`, `sound`, `text-x`, `text-y`, `type`, `valign`(2),
  `value`, `version`, `xml:lang`.
  `directive` here is the M2 replacement attribute on `<direction>`.
- **2.0 → 3.0** — `halign`/`valign`(14 each), `dash-length`/`space-length`(12 each),
  `xml:space`(6), `slash`(3), then singletons and pairs: `after-barline`, `approach`(2), `color`,
  `departure`(2), `dir`, `enclosure`, the font group, `id`, `justify`(2), `letter-spacing`(2),
  `line-height`, `line-through`(2), `line-type`, `measure`, `niente`, `number`, `overline`(2),
  `placement`, `print-object`(2), `relative-*`/`default-*`(2 each), `rotation`, `separator`,
  `sign`, `symbol`, `time-only`, `type`, `underline`(2), `unplayed`, `winged`, `xml:lang`.
- **3.0 → 3.1** — `id`(57) and `smufl`(20) dominate; this is the pair that made almost everything
  addressable and SMuFL-referencable. Then `line-length`(4), `height`(2), `parentheses`(2),
  `width`(2), `abbreviated`, `bracket`, `dashed-circle`, `hand`, `number`, `print-leger`, `size`,
  `text`, `time-only`.
- **3.1 → 4.0** — the quietest pair: `smufl`(6), `system`(4), `arrangement`(2), then `above`,
  `after-jump`, `halign`, `multiple-rest-always`, `multiple-rest-range`, `offset`, `placement`,
  `print-object`, `scaling`, `shape`, `staff`, `text`, `type`, `unbroken`, `valign`.

### 6.4 Enumeration changes

Additions only — see finding 2. Named `xs:simpleType` diffs (2.0 onward):

| Pair | Existing types extended |
|---|---|
| 2.0 → 3.0 | `accidental-value` (+22, the microtonal and Persian accidentals), `clef-sign` (+`jianpu`), `group-symbol-value` (+`square`), `note-type-value` (+`1024th`, `512th`, `maxima`), `notehead-value` (+4), `time-symbol` (+`note`, `dotted-note`), `wedge-type` (+`continue`) |
| 3.0 → 3.1 | `accidental-value` (+7), `beater-value` (+3), `breath-mark-value` (+2), `effect` (+2), `enclosure-shape` (+6 polygons), `fermata-shape` (+5), `handbell-value` (+`belltree`), `membrane` (+5), `metal` (+9), `note-size-type`/`symbol-size` (+`grace-cue`), `notehead-value` (+`circled`, `other`), `stick-type` (+5), `wood` (+7) |
| 3.1 → 4.0 | `enclosure-shape` (+`inverted-bracket`), `pedal-type` (+`discontinue`, `resume`) |

Attribute-level, including the two DTD pairs where element-content enums are invisible:

| Pair | Change |
|---|---|
| 1.0 → 1.1 | `accidental@size` +`large`; `pedal@type` +`change` |
| 1.1 → 2.0 | `grouping@type` +`single` |
| 2.0 → 3.0 | `cancel@location` +`before-barline`; `bracket@type` +`continue`; `time@symbol` +`note`, `dotted-note`; `accidental-text@enclosure` and `rehearsal@enclosure` +5 each; **`frame@valign` −`baseline`** (P2) |
| 3.0 → 3.1 | `accidental@size` and `note-size@type` +`grace-cue`; `pedal@type` +`sostenuto`; `tied@type` +`let-ring`; `tremolo@type` +`unmeasured`; `accidental-text@enclosure` +6 |
| 3.1 → 4.0 | `accidental-text@enclosure` +`inverted-bracket`; `pedal@type` +`discontinue`, `resume` |

Several 3.1→4.0 "new" enum types — `effect-value`, `membrane-value`, `metal-value`, `wood-value` —
are schema-internal renames of the 3.0/3.1 types `effect`, `membrane`, `metal`, `wood`. The element
names are unchanged, so there is no migration.

### 6.5 Cardinality and defaults

**No child element's effective cardinality changed in any version, and no attribute default
changed.** The five element-local hits were all inspected and all are enclosing-particle artifacts:

| Reported | Reality |
|---|---|
| `attributes`/`transpose` `0:1` → `0:unbounded` (2.0→3.0) | genuine at 3.0; at 4.0 it also moves into an `xs:choice` with `for-part` (`schema-4.0/musicxml.xsd:2868–2880`) |
| `note`/`beam` `0:6` → `0:8` (2.0→3.0) | genuine — beam levels 7 and 8 for 512th/1024th notes, matching `note-type-value`'s additions |
| `score-part`/`midi-instrument`, `sound`/`midi-instrument` `0:unbounded` → `0:1` (2.0→3.0) | artifact — the element moved inside a repeated `xs:sequence` of device/instrument pairs |
| `direction-type`/`words` `1:unbounded` → `1:1` (3.0→3.1) | artifact — moved inside `<xs:choice maxOccurs="unbounded">` (`schema-3.1/musicxml.xsd:3276`) |
| `staff-details`/`staff-lines` `0:1` → `1:1` (3.1→4.0) | artifact — wrapped with `line-detail` in an optional `xs:sequence` (`schema-4.0/musicxml.xsd:3134–3141`) |

The only true cardinality changes are the two genuine rows above, both pure widenings, both
needing nothing from the normalizer.

Attribute requiredness changed exactly twice, both covered in §5: `<accord>@string` relaxed at 2.0
(no action), `<staff-tuning>@line` tightened at 4.0 (P1).

---

## 7. The hand-authored synthetic fixtures

`Tests/IvorMusicXMLTests/Fixtures/Synthetic/` exists because of this table: it names exactly which
per-version fixtures earn their keep. The real-world corpus contributes nothing here — it is 21×4.0
and 1×3.1. Adding a migrating row to §3 means adding a fixture here.

One fixture per migrating row, each minimal enough to read in one screen:

| Fixture | Exercises | Declared version |
|---|---|---|
| `print-staff-spacing.musicxml` | M1, and `defaultedVersion` (no `version` attribute) | 1.1, undeclared |
| `attributes-directive.musicxml` | M2 pass-through + `deprecatedElement("directive")` | 1.0, undeclared |
| `part-name-formatting.musicxml` | M3 | 1.1, undeclared |
| `group-name-formatting.musicxml` | M4 | 1.1, undeclared |
| `sound-pan-elevation.musicxml` | M5 **with** a `<midi-instrument>` | 1.1, undeclared |
| `sound-pan-no-instrument.musicxml` | M5's decline-to-migrate branch | 1.1, undeclared |
| `beam-repeater.musicxml` | M6 pass-through | 2.0 |
| `bezier-offset.musicxml` | M7 pass-through | 3.0 |
| `harmony-function.musicxml` | M8, both the convertible (`V`) and inconvertible (`V/V`) forms | 3.1 |
| `clef-sign-none.musicxml` | M9 | 3.1 |
| `version-malformed.musicxml` | `MXLParser.Diagnostic.malformedVersion("4")` | `version="4"` |

Two more that this table justifies but that are not migration rows:

- `staff-tuning-no-line.musicxml` — a 3.1 tablature part omitting `@line`. It is the regression test
  for P1 and **fails to parse until P1 is resolved**, so it is marked expected-throwing
  (`Fixture.Expectation.parseFailure`); flip it when P1 lands.
- `frame-valign-baseline.musicxml` — a 2.0 `<frame valign="baseline">`, asserted to throw. It pins
  P2 as a deliberate divergence rather than an oversight.

Every one of these is a handful of lines: a `<score-partwise>` with one part, one measure, and the
construct under test. None needs to be musically meaningful.

---

## 8. Reproducing this document

The extracts were produced mechanically and can be regenerated. The procedure, in full:

1. For 1.0 and 1.1, concatenate every `.dtd` in the version directory except `midixml.dtd` and
   `MIDIEvents10.dtd`; collect `<!ENTITY % name "…">` definitions; strip comments; expand `%name;`
   references recursively (depth cap 12) inside `<!ELEMENT>` and `<!ATTLIST>` bodies; tokenize each
   `<!ATTLIST>` body into (name, type, default) triples, treating parenthesized groups and quoted
   strings as single tokens.
2. For 2.0 onward, parse `musicxml.xsd` and `opus.xsd`; index every top-level `xs:complexType`,
   `xs:attributeGroup`, `xs:group`, and `xs:simpleType` by name; for each `xs:element name=`,
   resolve its type and collect attributes and child element names by walking
   `xs:attributeGroup ref=`, `xs:group ref=`, and `complexContent`/`simpleContent`
   `extension`/`restriction` `base=` recursively, with a visited set to stop cycles.
3. Normalize both into the shape in §1, resolving each XSD attribute's `type=` against the
   `xs:simpleType` enumeration index so attribute value sets are comparable with the DTDs'
   inline `(a | b | c)` types.
4. Diff adjacent versions on: element names; per-element attribute names; per-attribute enumeration
   values, defaults, and requiredness; child element names and element-local occurrence ranges.
5. Diff the named `xs:simpleType` enumerations directly across the four XSD versions, to catch the
   element-content vocabularies step 4 cannot see.
6. Harvest deprecations separately — `grep -ri eprecat` across all six schema directories — because
   they appear only in `xs:documentation` and DTD comments. This is what produces §3; steps 1–5
   produce §6 and serve as the negative evidence behind §2's findings.
