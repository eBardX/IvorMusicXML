# IvorMusicXML

A MusicXML parser, normalizer, validator, and formatter.

## <a name="overview">Overview</a>

The IvorMusicXML framework provides a [MusicXML](https://www.musicxml.com)
parser and formatter written in Swift, with a strict-concurrency-ready,
value-type API. Both compressed (`.mxl`) and uncompressed MusicXML files are
supported.

IvorMusicXML's syntactic core turns MusicXML bytes into a typed,
round-trippable abstract syntax tree (`MXLDocument` → `MXLScorePartwise` →
`Part` → `MXLMusicItem`) and back to bytes, without interpreting the music.

Everything flows through a small, explicit pipeline of four value types, each
with a no-argument initializer:

 Stage     | Type             | Input → Output
:-----     |:----             |:--------------
 Parse     | `MXLParser`      | `Data` → `MXLDocument`
 Normalize | `MXLNormalizer`  | `MXLDocument` → `MXLDocument` (current version)
 Validate  | `MXLValidator`   | `MXLDocument` → validated `MXLDocument`
 Format    | `MXLFormatter`   | `MXLDocument` → `Data`

The pipeline is gated by two flags on `MXLDocument`: a document must be
normalized before it can be validated, and validated before it can be
formatted. `MXLDocument.Content` has one case per document element a MusicXML
root file may have — a part-wise score, a time-wise score, or an `<opus>`. All
three parse, normalize, and validate; the formatter writes part-wise scores and
opus documents (a time-wise score is normalized to part-wise first). See the
[usage guide][guide] for a full walkthrough of the API.

## <a name="quick_start">Quick Start</a>

Take a MusicXML file from `Data` all the way back to MusicXML bytes:

```swift
import Foundation
import IvorMusicXML

let data = try Data(contentsOf: url)

// 1. Parse MusicXML bytes into a typed AST.
let (parsed, diagnostics) = try MXLParser().parse(data, compressed: false)

// 2. Normalize the document to the most recent supported MusicXML version.
let (normalized, changes) = MXLNormalizer().normalize(parsed)

// 3. Validate — e.g. every `<part>` id names a declared `<score-part>`.
let (validated, issues) = try MXLValidator().validate(normalized)

guard issues.isEmpty
else { issues.forEach { print($0.message) }; return }

// 4. Format back to MusicXML bytes.
let output = try MXLFormatter().format(validated, compressed: false)
```

Each stage is independent, so you can stop at the AST or round-trip through
the formatter. For the complete story — the AST model and error handling —
see the [usage guide][guide].

## <a name="documentation">Documentation</a>

* [Using IvorMusicXML][guide] — a guide to using the public API, published as
  part of the DocC documentation.
* Every public declaration carries a DocC comment.

## <a name="reference_documentation">Reference Documentation</a>

Full [reference documentation][refdoc] is available courtesy of [DocC][docc].

## <a name="credits">Credits</a>

John Gary Pusey (ebardx@gmail.com)

## <a name="license">License</a>

IvorMusicXML is available under [the MIT license][license].

[docc]:     https://www.swift.org/documentation/docc/
[guide]:    https://eBardX.github.io/ivor-packages-docs/documentation/ivormusicxml/usingivormusicxml
[license]:  https://github.com/eBardX/IvorMusicXML/blob/main/LICENSE.md
[refdoc]:   https://eBardX.github.io/ivor-packages-docs/documentation/ivormusicxml
