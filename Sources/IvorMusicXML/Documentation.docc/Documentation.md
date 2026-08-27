# ``IvorMusicXML``

@Metadata {
    @PageColor(blue)
}

A MusicXML parser, normalizer, validator, and formatter.

## Overview

The IvorMusicXML framework provides a [MusicXML](https://www.musicxml.com)
parser written in Swift, with a strict-concurrency-ready, value-type API. Both
compressed (`.mxl`) and uncompressed MusicXML files are supported.

IvorMusicXML's syntactic core turns MusicXML bytes into a typed,
round-trippable abstract syntax tree (``MXLDocument`` → ``MXLScorePartwise``
→ ``MXLScorePartwise/Part`` → ``MXLMusicItem``) and back to bytes, without
interpreting the music.

### The pipeline

Everything flows through a small, explicit pipeline of four value types, each a
`Sendable` value type with a no-argument initializer:

 Stage     | Type              | Input → Output
:-----     |:----              |:--------------
 Parse     | ``MXLParser``     | `Data` → ``MXLDocument``
 Normalize | ``MXLNormalizer`` | ``MXLDocument`` → ``MXLDocument`` (current version)
 Validate  | ``MXLValidator``  | ``MXLDocument`` → validated ``MXLDocument``
 Format    | ``MXLFormatter``  | ``MXLDocument`` → `Data`

An ``MXLDocument`` carries two Boolean state flags that enforce the order of
the pipeline: a document must be normalized before it can be validated, and
validated before it can be formatted. Both normalization and validation are
idempotent, so it is always safe to run the full pipeline:

```swift
import Foundation
import IvorMusicXML

let data = try Data(contentsOf: url)

let (parsed, diagnostics) = try MXLParser().parse(data, compressed: false)
let (normalized, changes) = MXLNormalizer().normalize(parsed)
let (validated, issues)   = try MXLValidator().validate(normalized)

guard issues.isEmpty
else { issues.forEach { print($0.message) }; return }

let output = try MXLFormatter().format(validated,     // back to MusicXML
                                       compressed: false)
```

See <doc:UsingIvorMusicXML> for a full guide to each stage, the models, and
error handling.

## Topics

### Guides

- <doc:UsingIvorMusicXML>

### Processing

- ``MXLParser``
- ``MXLNormalizer``
- ``MXLValidator``
- ``MXLFormatter``

### Documents

- ``MXLDocument``
- ``MXLScorePartwise``
- ``MXLScoreTimewise``
- ``MXLOpus``
- ``MXLPartList``
- ``MXLScorePart``

### Music

- ``MXLMusicItem``
- ``MXLNote``
- ``MXLRest``
- ``MXLPitch``
- ``MXLAttributes``
- ``MXLDirection``
- ``MXLBarline``
- ``MXLSound``
