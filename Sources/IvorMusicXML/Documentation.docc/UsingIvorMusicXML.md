# Using IvorMusicXML

Take a MusicXML document from bytes to a validated, round-trippable syntax
tree.

## Overview

IvorMusicXML exposes four processing types. Each is a `Sendable` value type
with a no-argument initializer and a single primary method:

 Type               | Method                | Result
:----               |:------                |:------
 ``MXLParser``      | `parse(_:compressed:)` | `(MXLDocument, [MXLParser.Diagnostic])`
 ``MXLNormalizer``  | `normalize(_:)`        | `(MXLDocument, [MXLNormalizer.Change])`
 ``MXLValidator``   | `validate(_:)`         | `(MXLDocument, [MXLValidator.Issue])`
 ``MXLFormatter``   | `format(_:compressed:)` | `Data`

An ``MXLDocument`` carries two Boolean state flags that enforce the order of
the pipeline:

- **`isNormalized`** — `validate(_:)` throws unless this is `true`.
- **`isValidated`** — `format(_:compressed:)` throws unless this is `true`.

So the canonical order is **parse → normalize → validate → format**:

```swift
let (parsed, diagnostics) = try MXLParser().parse(data, compressed: false)
let (normalized, changes) = MXLNormalizer().normalize(parsed)
let (validated, issues)   = try MXLValidator().validate(normalized)

guard issues.isEmpty
else { /* handle issues */ return }

let xml = try MXLFormatter().format(validated, compressed: false)
```

Both `normalize(_:)` and `validate(_:)` are idempotent — calling them on a
document that is already normalized or validated returns it unchanged — so it
is always safe to run the full pipeline.

MusicXML files come in two physical encodings: an uncompressed XML document and
a compressed `.mxl` ZIP archive that wraps a `META-INF/container.xml` pointing
at the root score. The `compressed:` argument on `parse(_:compressed:)` and
`format(_:compressed:)` selects between them; the rest of the pipeline is
encoding-agnostic.

## Parsing

``MXLParser`` decodes `Data` into an ``MXLDocument``:

```swift
let (document, diagnostics) = try MXLParser().parse(data, compressed: false)
```

A MusicXML root file may have three document elements — a part-wise score, a
time-wise score, or an `<opus>` — so ``MXLDocument/Content`` is an enum over all
three. Most documents are a part-wise ``MXLScorePartwise``. An MXL
`<container>` is an archive implementation detail rather than a document, so a
bare `container.xml` is rejected as an unexpected root element.

``MXLParser/Diagnostic`` reports things the parser accepted but had to adjust
or work around — a `version` attribute it had to default or repair
(`defaultedVersion`, `malformedVersion(_:)`), an element or attribute the
schema deprecated (`deprecatedElement(_:)`, `deprecatedAttribute(_:)`), or one
it did not recognize and skipped (`ignoredElement(_:)`,
`ignoredAttribute(_:)`). Diagnostics are always returned, never thrown; each
has a human-readable `message`:

```swift
for diagnostic in diagnostics {
    print(diagnostic.message)
}
```

Unrecoverable problems are thrown as an ``MXLParser/Error`` — a malformed ZIP
container (`noRootFileFound`, `invalidRootFileMediaType(_:)`) or an XML body
that will not parse at all (`parseFailure(_:)`). Like all IvorMusicXML errors
it conforms to `EnhancedError` and provides a `message`:

```swift
do {
    let (document, _) = try MXLParser().parse(data, compressed: true)
} catch let error as MXLParser.Error {
    print(error.message)
}
```

## Normalizing

``MXLNormalizer`` migrates a document to the most recent supported MusicXML
version, returning a new document whose `isNormalized` flag is `true`, together
with a list of the changes it applied:

```swift
let (normalized, changes) = MXLNormalizer().normalize(parsed)

for change in changes {
    print(change.message)
}
```

``MXLDocument/Version`` lists all six supported versions (1.0 through 4.0);
`.current` is the migration target. A part-wise score enters an ordered chain
of per-version passes at its declared version and is stamped with the current
version on the way out. The passes are **derived by diffing the six vendored
schemas** rather than written from memory — the 1.0 and 1.1 DTDs and the 2.0–4.0
XSDs — and applied as an additive record of deprecations. Each
``MXLNormalizer/Change`` case names what moved: `upgradedVersion(_:_:)`,
`renamedElement(_:_:)`, `replacedConstruct(_:_:)`, `suppliedDefault(_:_:)`, and
`convertedToPartwise`.

A **time-wise score is converted to part-wise** as its first migration step —
the two encodings are isomorphic in musical content — so a normalized document
is never time-wise. An opus has no migration passes — the opus schema has never
changed structurally — but it does take the same closing version stamp, applied
at every level of nesting. Because a content-changing normalization can
invalidate a prior validation, normalizing clears `isValidated`.

IvorMusicXML has **no born-normalized fast path**: the parser never pre-sets
`isNormalized`, so every document goes through the normalizer at least once.
Detecting an already-canonical document would mean proving no migration-triggering
construct appears anywhere in it — the declared `version` is asserted by the file,
never verified, so a document may claim `4.0` and still contain a 2.0-era
deprecated element. Over-reporting is harmless (a pass that makes no changes)
while under-reporting silently skips a migration, so the check would have to be
exhaustive to be safe — which costs more than the pass it would skip.

## Validating

``MXLValidator`` checks a **normalized** score:

```swift
let (validated, issues) = try MXLValidator().validate(normalized)

if issues.isEmpty {
    // `validated.isValidated` is now true.
} else {
    issues.forEach { print($0.message) }
}
```

- If the document has not been normalized, `validate(_:)` throws
  ``MXLValidator/Error/notNormalized``.
- An opus passes straight through, marked validated with no issues: its schema
  is four elements and the parser already enforces nearly everything they
  constrain, so there is nothing left to check.
- If any issues are found, the returned document is the **input unchanged**
  (its `isValidated` flag stays `false`). Fix the issues and validate again.
- Only when the issues array is empty does the returned document have
  `isValidated == true` — the prerequisite for formatting and resolving.

A time-wise score is validated in its part-wise encoding. The
``MXLValidator/Issue`` catalogue covers the
cross-references the schema cannot express on its own: an `<part>` whose `id`
names no `<score-part>` (`danglingPartID(_:)`), a `<score-part>` no `<part>`
realizes (`unusedScorePart(_:)`), a durational element before the first
`<divisions>` (`durationBeforeDivisions(part:measure:)`), an unmatched
`<ending>` (`unpairedEnding(number:part:measure:)`), an unbalanced
`<part-group>` (`unbalancedPartGroup(number:)`), and an `<instrument-sound>`
that is not one of the 894 standard sounds defined by MusicXML 4.0
(`unknownInstrumentSound(_:)`).

## Formatting

``MXLFormatter`` serializes a **validated** score back to MusicXML `Data`,
optionally as a compressed `.mxl` archive:

```swift
let xml = try MXLFormatter().format(validated, compressed: false)
let mxl = try MXLFormatter().format(validated, compressed: true)
```

- If the document has not been validated, `format(_:compressed:)` throws
  ``MXLFormatter/Error/notValidated``.
- The formatter writes **part-wise scores and opus documents** — both are
  document elements a MusicXML root file may have, and both can be written
  compressed. A time-wise document throws
  ``MXLFormatter/Error/unsupportedTimewise`` — but since the normalizer converts
  time-wise to part-wise, a normally-processed document never hits that case.

Because the AST is lossless, `parse → normalize → validate → format` reproduces
the original score (modulo the version migration the normalizer applies and
settled whitespace canonicalization).

## The AST model

The syntactic model is a tree of value types rooted at ``MXLDocument``:

```
MXLDocument
└─ content: MXLDocument.Content
   └─ .scorePartwise(MXLScorePartwise)
      ├─ partList: MXLPartList
      └─ parts:    [MXLScorePartwise.Part]
         └─ measures: [Measure]
            └─ items: [MXLMusicItem]   // .note, .attributes, .direction, …
```

``MXLDocument/Content`` is an enum over the three MusicXML document elements
(`opus`, `scorePartwise`, `scoreTimewise`). The AST is
lossless — it records exactly what was written so it can round-trip through
``MXLFormatter`` — and every leaf value is wrapped in a small validating type.
All AST types are `Equatable`, `Hashable`, and `Sendable`.

``MXLDocument`` equality compares `content` only; the `isNormalized` and
`isValidated` flags are metadata and are excluded.

## Building a document programmatically

You can construct the AST directly rather than parsing bytes:

```swift
let pitch    = MXLPitch(step: .c, octave: 4)
let fullNote = MXLFullNote(isChord: false, content: .pitch(pitch))
let note     = MXLNote(content: .regularNote(fullNote: fullNote,
                                             duration: 4,
                                             tie: []))

let measure  = MXLScorePartwise.Part.Measure(number: "1", items: [.note(note)])
let part     = MXLScorePartwise.Part(id: "P1", measures: [measure])
let scorePart = MXLScorePart(id: "P1",
                             name: MXLPartName(value: "Music",
                                               text: MXLPartName.Text()))
let score    = MXLScorePartwise(partList: MXLPartList(items: [.scorePart(scorePart)]),
                                parts: [part])
let document = MXLDocument(content: .scorePartwise(score))
```

A directly-constructed document has `isNormalized == false` and
`isValidated == false`, so you must run it through the normalizer and validator
before formatting.

## Error handling

Thrown errors conform to `EnhancedError` (from
[XestiTools](https://github.com/eBardX/XestiTools)): each has a `category` of
`"IvorMusicXML"` and a human-readable `message`.

 Type                     | Thrown by
:----                     |:---------
 ``MXLParser/Error``      | `MXLParser.parse(_:compressed:)`
 ``MXLValidator/Error``   | `MXLValidator.validate(_:)`
 ``MXLFormatter/Error``   | `MXLFormatter.format(_:compressed:)`

`MXLNormalizer.normalize(_:)` never throws — every version is migratable, so
normalization has no failure mode.

Non-fatal results are returned rather than thrown, and each also provides a
`message`:

 Type                       | Returned by
:----                       |:-----------
 ``MXLParser/Diagnostic``   | `parse(_:compressed:)`
 ``MXLNormalizer/Change``   | `normalize(_:)`
 ``MXLValidator/Issue``     | `validate(_:)`

## Concurrency

IvorMusicXML is built for Swift 6 strict concurrency. Every public type — the
four processing types and the entire AST — is a `Sendable` value type, so
instances can be freely shared across tasks and actor boundaries. The
processing types hold no mutable state, so a single ``MXLParser``,
``MXLNormalizer``, ``MXLValidator``, or ``MXLFormatter`` instance can be
reused for any number of concurrent operations.
