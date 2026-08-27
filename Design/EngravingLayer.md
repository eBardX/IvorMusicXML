# The Engraving Layer in the IvorMusicXML AST

Normative catalogue of every AST type and property encoding **visual presentation**
rather than **musical content**, so the layer can be separated out for special
handling.

This document is the authority for what *engraving* means in IvorMusicXML.
`MXLEngravingLayerTests` verifies §2, §3, and §4 against the AST sources at
`Sources/IvorMusicXML/AST/`. Cite it by section, and by the stable identifiers
in §5 and §6 (`J1`…`J12`, `C1`…`C3`); §3 and §4 rows are cited by type name.
See §7 for how to re-verify after changing the AST.

## §1 Definition

A type or property is engraving if removing it changes how a score *looks* when
rendered, but not what a performer would *play*. Positions, fonts, colours, margins,
line geometry, glyph overrides, and print toggles are engraving. Pitches, durations,
dynamics, articulations, and structural markings are not.

Deliberately **excluded** despite looking decorative:

- `id` — document identity, used for cross-references and linking.
- `number` — nearly always a musical level (slur number, staff number, lyric verse),
  not a visual label.

## §2 Summary

| | Types | Properties |
|---|---:|---:|
| A. Engraving-by-nature types | 85 | 135 |
| B. Engraving properties on musical types | 121 | 498 |
| **Engraving total** | **206** | **633** |
| Remaining musical properties | — | 697 |

**48%** of all 1330 public stored properties in the AST are engraving.

These counts are asserted by `MXLEngravingLayerTests`; if the AST changes without
this document changing, the test fails rather than the numbers going quietly
stale.

---

## §3 Category A — engraving-by-nature types (85)

These exist only to carry presentation; every property they own is engraving.
A consumer ignoring engraving can skip them wholesale — subject to `C1`, which
forbids deleting the *elements* themselves.

**`Attributes/`**

- `MXLShowTuplet` — enumeration / type alias (no stored properties)
- `MXLStaffDetails.Group` — `lineDetail`, `staffLines`
- `MXLStaffDivide` — `color`, `font`, `halign`, `id`, `kind`, `position`, `valign`
- `MXLStaffDivide.Symbol` — enumeration / type alias (no stored properties)
- `MXLStaffSize` — `scaling`, `value`
- `MXLTimeSeparator` — enumeration / type alias (no stored properties)
- `MXLTimeSymbol` — enumeration / type alias (no stored properties)

**`Common/`**

- `MXLAboveBelow` — enumeration / type alias (no stored properties)
- `MXLColor` — `stringValue`
- `MXLCssFontSize` — enumeration / type alias (no stored properties)
- `MXLEmptyLine` — `dashedFormatting`, `kind`, `length`, `placement`, `printStyle`, `shape`
- `MXLEmptyPlacement` — `placement`, `printStyle`
- `MXLEmptyPrintObjectStyleAlign` — `printStyleAlign`, `printsObject`
- `MXLEmptyPrintStyleAlignID` — `id`, `printStyleAlign`
- `MXLEnclosureShape` — enumeration / type alias (no stored properties)
- `MXLFont` — `family`, `size`, `style`, `weight`
- `MXLFont.Family` — enumeration / type alias (no stored properties)
- `MXLFont.Size` — enumeration / type alias (no stored properties)
- `MXLFont.Style` — enumeration / type alias (no stored properties)
- `MXLFont.Weight` — enumeration / type alias (no stored properties)
- `MXLLeftCenterRight` — enumeration / type alias (no stored properties)
- `MXLLineDetail` — `color`, `line`, `lineKind`, `printsObject`, `width`
- `MXLLineEnd` — enumeration / type alias (no stored properties)
- `MXLLineKind` — enumeration / type alias (no stored properties)
- `MXLLineShape` — enumeration / type alias (no stored properties)
- `MXLMillimeters` — enumeration / type alias (no stored properties)
- `MXLNumberOfLines` — `uintValue`
- `MXLNumberOrNormal` — enumeration / type alias (no stored properties)
- `MXLOverUnder` — enumeration / type alias (no stored properties)
- `MXLPosition` — `defaultX`, `defaultY`, `relativeX`, `relativeY`
- `MXLPrintStyle` — `color`, `font`, `position`
- `MXLPrintStyleAlign` — `halign`, `printStyle`, `valign`
- `MXLSmuflAccidentalGlyphName` — `stringValue`
- `MXLSmuflCodaGlyphName` — `stringValue`
- `MXLSmuflGlyphName` — `stringValue`
- `MXLSmuflLyricsGlyphName` — `stringValue`
- `MXLSmuflPictogramGlyphName` — `stringValue`
- `MXLSmuflSegnoGlyphName` — `stringValue`
- `MXLSmuflWavyLineGlyphName` — `stringValue`
- `MXLSymbolSize` — enumeration / type alias (no stored properties)
- `MXLTenths` — enumeration / type alias (no stored properties)
- `MXLTextDirection` — enumeration / type alias (no stored properties)
- `MXLTopBottom` — enumeration / type alias (no stored properties)
- `MXLValign` — enumeration / type alias (no stored properties)
- `MXLValignImage` — enumeration / type alias (no stored properties)
- `MXLWinged` — enumeration / type alias (no stored properties)
- `MXLXPosition` — `defaultX`, `defaultY`, `relativeX`, `relativeY`
- `MXLXmlSpace` — enumeration / type alias (no stored properties)
- `MXLYPosition` — `defaultX`, `defaultY`, `relativeX`, `relativeY`

**`Direction/`**

- `MXLDashedFormatting` — `dashLength`, `spaceLength`
- `MXLSystemRelation` — enumeration / type alias (no stored properties)
- `MXLSystemRelationNumber` — enumeration / type alias (no stored properties)

**`Layout/`**

- `MXLAllMargins` — `bottomMargin`, `leftRightMargins`, `topMargin`
- `MXLAppearance` — `distance`, `glyph`, `lineWidth`, `noteSize`, `otherAppearance`
- `MXLDistance` — `kind`, `value`
- `MXLDistance.Kind` — enumeration / type alias (no stored properties)
- `MXLGlyph` — `kind`, `value`
- `MXLGlyph.Kind` — enumeration / type alias (no stored properties)
- `MXLLayout` — `pageLayout`, `staffLayout`, `systemLayout`
- `MXLLeftRightMargins` — `leftMargin`, `rightMargin`
- `MXLLineWidth` — `kind`, `value`
- `MXLLineWidth.Kind` — enumeration / type alias (no stored properties)
- `MXLMeasureLayout` — `measureDistance`
- `MXLMeasureNumbering` — `alwaysShowsOnMultipleRest`, `color`, `font`, `halign`, `position`, `showsRangeOnMultipleRest`, `staff`, `system`, `valign`, `value`
- `MXLMeasureNumbering.Value` — enumeration / type alias (no stored properties)
- `MXLOtherAppearance` — `kind`, `value`
- `MXLPageLayout` — `group`, `pageMargins`
- `MXLPageLayout.Group` — `pageHeight`, `pageWidth`
- `MXLPageMargins` — `allMargins`, `kind`
- `MXLPageMargins.Kind` — enumeration / type alias (no stored properties)
- `MXLPrint.Attributes` — `blankPage`, `pageNumber`, `staffSpacing`, `startsNewPage`, `startsNewSystem`
- `MXLPrintout` — `printsDot`, `printsLyric`, `printsObject`, `printsSpacing`
- `MXLScaling` — `millimeters`, `tenths`
- `MXLStaffLayout` — `number`, `staffDistance`
- `MXLSystemDividers` — `leftDivider`, `rightDivider`
- `MXLSystemLayout` — `systemDistance`, `systemDividers`, `systemMargins`, `topSystemDistance`
- `MXLSystemMargins` — `leftRightMargins`

**`MusicItem/`**

- `MXLLevel.Display` — `hasBracket`, `hasParentheses`, `size`

**`Notations/`**

- `MXLTuplet.Portion.Dot` — `color`, `font`

**`Note/`**

- `MXLFan` — enumeration / type alias (no stored properties)
- `MXLNoteSize` — `kind`, `value`
- `MXLNoteSize.Kind` — enumeration / type alias (no stored properties)

**`PartList/`**

- `MXLGroupName.Text` — `color`, `font`, `justify`, `position`
- `MXLPartName.Text` — `color`, `font`, `justify`, `position`, `printsObject`

**`Technical/`**

- `MXLTipDirection` — enumeration / type alias (no stored properties)

### SMuFL glyph-name types (7, listed above)

Each overrides the rendered glyph for an element whose meaning is already fixed by
its own value: `MXLSmuflAccidentalGlyphName`, `MXLSmuflCodaGlyphName`, `MXLSmuflGlyphName`, `MXLSmuflLyricsGlyphName`, `MXLSmuflPictogramGlyphName`, `MXLSmuflSegnoGlyphName`, `MXLSmuflWavyLineGlyphName`.

---

## §4 Category B — engraving properties on musical types (121 types, 498 properties)

These carry real musical content **and** engraving attributes. Separating the layer
here means removing the listed properties, not the type.

`why`: `type` = declared type is in Category A; `name` = known engraving attribute name.

### `Attributes/`

**`MXLAttributes.Directive`** — 3 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `position` | `MXLPosition` | type |

**`MXLBeatRepeat`** — 1 of 4 properties engraving

| property | declared type | why |
|---|---|---|
| `usesDots` | `Bool?` | name |

**`MXLClef`** — 5 of 10 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `position` | `MXLPosition` | type |
| `printsObject` | `Bool?` | name |
| `size` | `MXLSymbolSize?` | type |

**`MXLInterchangeable`** — 2 of 4 properties engraving

| property | declared type | why |
|---|---|---|
| `separator` | `MXLTimeSeparator` | type |
| `symbol` | `MXLTimeSymbol?` | type |

**`MXLKey`** — 4 of 8 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `position` | `MXLPosition` | type |
| `printsObject` | `Bool?` | name |

**`MXLKeyAccidental`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `smufl` | `MXLSmuflAccidentalGlyphName?` | type |

**`MXLMeasureStyle`** — 2 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |

**`MXLMultipleRest`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `usesSymbols` | `Bool` | name |

**`MXLSlash`** — 2 of 4 properties engraving

| property | declared type | why |
|---|---|---|
| `usesDots` | `Bool?` | name |
| `usesStems` | `Bool` | name |

**`MXLStaffDetails`** — 3 of 9 properties engraving

| property | declared type | why |
|---|---|---|
| `printsObject` | `Bool?` | name |
| `printsSpacing` | `Bool?` | name |
| `staffSize` | `MXLStaffSize?` | type |

**`MXLTime`** — 8 of 11 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `position` | `MXLPosition` | type |
| `printsObject` | `Bool?` | name |
| `separator` | `MXLTimeSeparator` | type |
| `symbol` | `MXLTimeSymbol?` | type |
| `valign` | `MXLValign?` | type |

### `Barline/`

**`MXLBarline.StyleColor`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |

**`MXLEnding`** — 8 of 11 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `endLength` | `MXLTenths?` | type |
| `font` | `MXLFont` | type |
| `position` | `MXLPosition` | type |
| `printsObject` | `Bool?` | name |
| `system` | `MXLSystemRelation?` | type |
| `textX` | `MXLTenths?` | type |
| `textY` | `MXLTenths?` | type |

**`MXLRepeat`** — 1 of 4 properties engraving

| property | declared type | why |
|---|---|---|
| `winged` | `MXLWinged` | type |

### `Common/`

**`MXLElementPosition`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `position` | `Int?` | name |

**`MXLFormattedSymbolID`** — 14 of 16 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `dir` | `MXLTextDirection` | type |
| `enclosure` | `MXLEnclosureShape?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `justify` | `MXLLeftCenterRight?` | type |
| `letterSpacing` | `MXLNumberOrNormal` | type |
| `lineHeight` | `MXLNumberOrNormal` | type |
| `lineThrough` | `MXLNumberOfLines?` | type |
| `overline` | `MXLNumberOfLines?` | type |
| `position` | `MXLPosition` | type |
| `rotation` | `MXLRotationDegrees?` | name |
| `underline` | `MXLNumberOfLines?` | type |
| `valign` | `MXLValign?` | type |

**`MXLFormattedText`** — 15 of 17 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `dir` | `MXLTextDirection` | type |
| `enclosure` | `MXLEnclosureShape?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `justify` | `MXLLeftCenterRight?` | type |
| `letterSpacing` | `MXLNumberOrNormal` | type |
| `lineHeight` | `MXLNumberOrNormal` | type |
| `lineThrough` | `MXLNumberOfLines?` | type |
| `overline` | `MXLNumberOfLines?` | type |
| `position` | `MXLPosition` | type |
| `rotation` | `MXLRotationDegrees?` | name |
| `underline` | `MXLNumberOfLines?` | type |
| `valign` | `MXLValign?` | type |
| `xmlSpace` | `MXLXmlSpace?` | type |

**`MXLFormattedTextID`** — 15 of 18 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `dir` | `MXLTextDirection` | type |
| `enclosure` | `MXLEnclosureShape?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `justify` | `MXLLeftCenterRight?` | type |
| `letterSpacing` | `MXLNumberOrNormal` | type |
| `lineHeight` | `MXLNumberOrNormal` | type |
| `lineThrough` | `MXLNumberOfLines?` | type |
| `overline` | `MXLNumberOfLines?` | type |
| `position` | `MXLPosition` | type |
| `rotation` | `MXLRotationDegrees?` | name |
| `underline` | `MXLNumberOfLines?` | type |
| `valign` | `MXLValign?` | type |
| `xmlSpace` | `MXLXmlSpace?` | type |

**`MXLImage.Attributes`** — 5 of 7 properties engraving

| property | declared type | why |
|---|---|---|
| `halign` | `MXLLeftCenterRight?` | type |
| `height` | `MXLTenths?` | type |
| `position` | `MXLPosition` | type |
| `valign` | `MXLValignImage?` | type |
| `width` | `MXLTenths?` | type |

**`MXLOtherPlacementText`** — 3 of 4 properties engraving

| property | declared type | why |
|---|---|---|
| `placement` | `MXLAboveBelow?` | type |
| `printStyle` | `MXLPrintStyle` | type |
| `smufl` | `MXLSmuflGlyphName?` | type |

**`MXLOtherText`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `smufl` | `MXLSmuflGlyphName?` | type |

**`MXLPlacementText`** — 2 of 3 properties engraving

| property | declared type | why |
|---|---|---|
| `placement` | `MXLAboveBelow?` | type |
| `printStyle` | `MXLPrintStyle` | type |

**`MXLStyleText`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `printStyle` | `MXLPrintStyle` | type |

**`MXLTextElementData`** — 8 of 10 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `dir` | `MXLTextDirection` | type |
| `font` | `MXLFont` | type |
| `letterSpacing` | `MXLNumberOrNormal` | type |
| `lineThrough` | `MXLNumberOfLines?` | type |
| `overline` | `MXLNumberOfLines?` | type |
| `rotation` | `MXLRotationDegrees?` | name |
| `underline` | `MXLNumberOfLines?` | type |

### `Direction/`

**`MXLAccordionRegistration`** — 5 of 9 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `position` | `MXLPosition` | type |
| `valign` | `MXLValign?` | type |

**`MXLBracket`** — 7 of 10 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `dashLength` | `MXLTenths?` | type |
| `endLength` | `MXLTenths?` | type |
| `lineEnd` | `MXLLineEnd` | type |
| `lineKind` | `MXLLineKind?` | type |
| `position` | `MXLPosition` | type |
| `spaceLength` | `MXLTenths?` | type |

**`MXLCoda`** — 6 of 7 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `position` | `MXLPosition` | type |
| `smufl` | `MXLSmuflCodaGlyphName?` | type |
| `valign` | `MXLValign?` | type |

**`MXLDashes`** — 4 of 7 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `dashLength` | `MXLTenths?` | type |
| `position` | `MXLPosition` | type |
| `spaceLength` | `MXLTenths?` | type |

**`MXLDirection`** — 2 of 12 properties engraving

| property | declared type | why |
|---|---|---|
| `placement` | `MXLAboveBelow?` | type |
| `system` | `MXLSystemRelation?` | type |

**`MXLDynamics`** — 10 of 12 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `enclosure` | `MXLEnclosureShape?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `lineThrough` | `MXLNumberOfLines?` | type |
| `overline` | `MXLNumberOfLines?` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |
| `underline` | `MXLNumberOfLines?` | type |
| `valign` | `MXLValign?` | type |

**`MXLHarpPedals`** — 5 of 7 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `position` | `MXLPosition` | type |
| `valign` | `MXLValign?` | type |

**`MXLMetronome`** — 8 of 10 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `hasParentheses` | `Bool` | name |
| `justify` | `MXLLeftCenterRight?` | type |
| `position` | `MXLPosition` | type |
| `printsObject` | `Bool?` | name |
| `valign` | `MXLValign?` | type |

**`MXLMetronome.Note.Tuplet`** — 2 of 4 properties engraving

| property | declared type | why |
|---|---|---|
| `hasBracket` | `Bool?` | name |
| `showNumber` | `MXLShowTuplet?` | type |

**`MXLOctaveShift`** — 6 of 9 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `dashLength` | `MXLTenths?` | type |
| `font` | `MXLFont` | type |
| `position` | `MXLPosition` | type |
| `size` | `Int` | name |
| `spaceLength` | `MXLTenths?` | type |

**`MXLOtherDirection`** — 7 of 9 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `position` | `MXLPosition` | type |
| `printsObject` | `Bool?` | name |
| `smufl` | `MXLSmuflGlyphName?` | type |
| `valign` | `MXLValign?` | type |

**`MXLPedal`** — 8 of 11 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `isAbbreviated` | `Bool?` | name |
| `position` | `MXLPosition` | type |
| `usesLines` | `Bool?` | name |
| `usesSigns` | `Bool?` | name |
| `valign` | `MXLValign?` | type |

**`MXLPerMinute`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `font` | `MXLFont` | type |

**`MXLPrincipalVoice`** — 5 of 9 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `position` | `MXLPosition` | type |
| `valign` | `MXLValign?` | type |

**`MXLSegno`** — 6 of 7 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `position` | `MXLPosition` | type |
| `smufl` | `MXLSmuflSegnoGlyphName?` | type |
| `valign` | `MXLValign?` | type |

**`MXLWedge`** — 6 of 10 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `dashLength` | `MXLTenths?` | type |
| `lineKind` | `MXLLineKind?` | type |
| `position` | `MXLPosition` | type |
| `spaceLength` | `MXLTenths?` | type |
| `spread` | `MXLTenths?` | type |

### `Harmony/`

**`MXLBarre`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |

**`MXLBass`** — 1 of 4 properties engraving

| property | declared type | why |
|---|---|---|
| `arrangement` | `MXLHarmonyArrangement?` | name |

**`MXLBass.Step`** — 3 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `position` | `MXLPosition` | type |

**`MXLDegree`** — 1 of 4 properties engraving

| property | declared type | why |
|---|---|---|
| `printsObject` | `Bool?` | name |

**`MXLDegree.Alter`** — 3 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `position` | `MXLPosition` | type |

**`MXLDegree.Kind`** — 3 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `position` | `MXLPosition` | type |

**`MXLDegree.Value`** — 3 of 6 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `position` | `MXLPosition` | type |

**`MXLFiguredBass`** — 8 of 13 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `hasParentheses` | `Bool?` | name |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |
| `printout` | `MXLPrintout` | type |
| `valign` | `MXLValign?` | type |

**`MXLFrame`** — 6 of 12 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `height` | `MXLTenths?` | type |
| `position` | `MXLPosition` | type |
| `valign` | `MXLValignImage?` | type |
| `width` | `MXLTenths?` | type |

**`MXLHarmony`** — 8 of 16 properties engraving

| property | declared type | why |
|---|---|---|
| `arrangement` | `MXLHarmonyArrangement?` | name |
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |
| `printsFrame` | `Bool?` | name |
| `printsObject` | `Bool?` | name |
| `system` | `MXLSystemRelation?` | type |

**`MXLHarmony.Chord.Kind`** — 6 of 11 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `position` | `MXLPosition` | type |
| `usesSymbols` | `Bool?` | name |
| `valign` | `MXLValign?` | type |

**`MXLHarmonyAlter`** — 4 of 6 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `position` | `MXLPosition` | type |
| `printsObject` | `Bool?` | name |

**`MXLInversion`** — 3 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `position` | `MXLPosition` | type |

**`MXLNumeral.Key`** — 1 of 3 properties engraving

| property | declared type | why |
|---|---|---|
| `printsObject` | `Bool?` | name |

**`MXLNumeral.Root`** — 3 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `position` | `MXLPosition` | type |

**`MXLRoot.Step`** — 3 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `position` | `MXLPosition` | type |

### `Identification/`

**`MXLDefaults`** — 5 of 8 properties engraving

| property | declared type | why |
|---|---|---|
| `appearance` | `MXLAppearance?` | type |
| `layout` | `MXLLayout` | type |
| `musicFont` | `MXLFont?` | type |
| `scaling` | `MXLScaling?` | type |
| `wordFont` | `MXLFont?` | type |

### `Layout/`

**`MXLPrint`** — 3 of 7 properties engraving

| property | declared type | why |
|---|---|---|
| `layout` | `MXLLayout` | type |
| `measureLayout` | `MXLMeasureLayout?` | type |
| `measureNumbering` | `MXLMeasureNumbering?` | type |

### `Linking/`

**`MXLLink`** — 1 of 4 properties engraving

| property | declared type | why |
|---|---|---|
| `position` | `MXLPosition` | type |

### `Lyric/`

**`MXLElision`** — 3 of 4 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `smufl` | `MXLSmuflLyricsGlyphName?` | type |

**`MXLExtend`** — 2 of 3 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `position` | `MXLPosition` | type |

**`MXLLyric`** — 7 of 14 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `endsLine` | `Bool` | name |
| `endsParagraph` | `Bool` | name |
| `justify` | `MXLLeftCenterRight?` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |
| `printsObject` | `Bool?` | name |

**`MXLLyricFont`** — 1 of 3 properties engraving

| property | declared type | why |
|---|---|---|
| `font` | `MXLFont` | type |

### `Notations/`

**`MXLAccidentalMark`** — 6 of 8 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `levelDisplay` | `MXLLevel.Display` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |
| `smufl` | `MXLSmuflAccidentalGlyphName?` | type |

**`MXLArpeggiate`** — 3 of 7 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |

**`MXLBreathMark`** — 4 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |

**`MXLCaesura`** — 4 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |

**`MXLEmptyTrillSound`** — 4 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |

**`MXLFermata`** — 3 of 6 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `position` | `MXLPosition` | type |

**`MXLGlissando`** — 6 of 10 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `dashLength` | `MXLTenths?` | type |
| `font` | `MXLFont` | type |
| `lineKind` | `MXLLineKind?` | type |
| `position` | `MXLPosition` | type |
| `spaceLength` | `MXLTenths?` | type |

**`MXLHorizontalTurn`** — 5 of 6 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `isSlashed` | `Bool?` | name |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |

**`MXLMordent`** — 6 of 8 properties engraving

| property | declared type | why |
|---|---|---|
| `approach` | `MXLAboveBelow?` | type |
| `color` | `MXLColor?` | type |
| `departure` | `MXLAboveBelow?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |

**`MXLNonArpeggiate`** — 4 of 6 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `kind` | `MXLTopBottom` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |

**`MXLNotations`** — 1 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `printsObject` | `Bool?` | name |

**`MXLOtherNotation`** — 6 of 10 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |
| `printsObject` | `Bool?` | name |
| `smufl` | `MXLSmuflGlyphName?` | type |

**`MXLSlide`** — 6 of 11 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `dashLength` | `MXLTenths?` | type |
| `font` | `MXLFont` | type |
| `lineKind` | `MXLLineKind?` | type |
| `position` | `MXLPosition` | type |
| `spaceLength` | `MXLTenths?` | type |

**`MXLSlur`** — 13 of 16 properties engraving

| property | declared type | why |
|---|---|---|
| `bezierOffset` | `MXLDivisions?` | name |
| `bezierOffset2` | `MXLDivisions?` | name |
| `bezierX` | `MXLTenths?` | type |
| `bezierX2` | `MXLTenths?` | type |
| `bezierY` | `MXLTenths?` | type |
| `bezierY2` | `MXLTenths?` | type |
| `color` | `MXLColor?` | type |
| `dashLength` | `MXLTenths?` | type |
| `lineKind` | `MXLLineKind?` | type |
| `orientation` | `MXLOverUnder?` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |
| `spaceLength` | `MXLTenths?` | type |

**`MXLStrongAccent`** — 4 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |

**`MXLTied`** — 13 of 16 properties engraving

| property | declared type | why |
|---|---|---|
| `bezierOffset` | `MXLDivisions?` | name |
| `bezierOffset2` | `MXLDivisions?` | name |
| `bezierX` | `MXLTenths?` | type |
| `bezierX2` | `MXLTenths?` | type |
| `bezierY` | `MXLTenths?` | type |
| `bezierY2` | `MXLTenths?` | type |
| `color` | `MXLColor?` | type |
| `dashLength` | `MXLTenths?` | type |
| `lineKind` | `MXLLineKind?` | type |
| `orientation` | `MXLOverUnder?` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |
| `spaceLength` | `MXLTenths?` | type |

**`MXLTremolo`** — 5 of 7 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |
| `smufl` | `MXLSmuflGlyphName?` | type |

**`MXLTuplet`** — 6 of 11 properties engraving

| property | declared type | why |
|---|---|---|
| `hasBracket` | `Bool?` | name |
| `lineShape` | `MXLLineShape?` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |
| `showNumber` | `MXLShowTuplet?` | type |
| `showType` | `MXLShowTuplet?` | type |

**`MXLTuplet.Portion.Kind`** — 2 of 3 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |

**`MXLTuplet.Portion.Number`** — 2 of 3 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |

**`MXLWavyLine`** — 4 of 7 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |
| `smufl` | `MXLSmuflWavyLineGlyphName?` | type |

### `Note/`

**`MXLAccidental`** — 5 of 8 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `levelDisplay` | `MXLLevel.Display` | type |
| `position` | `MXLPosition` | type |
| `smufl` | `MXLSmuflAccidentalGlyphName?` | type |

**`MXLAccidentalText`** — 16 of 18 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `dir` | `MXLTextDirection` | type |
| `enclosure` | `MXLEnclosureShape?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `justify` | `MXLLeftCenterRight?` | type |
| `letterSpacing` | `MXLNumberOrNormal` | type |
| `lineHeight` | `MXLNumberOrNormal` | type |
| `lineThrough` | `MXLNumberOfLines?` | type |
| `overline` | `MXLNumberOfLines?` | type |
| `position` | `MXLPosition` | type |
| `rotation` | `MXLRotationDegrees?` | name |
| `smufl` | `MXLSmuflAccidentalGlyphName?` | type |
| `underline` | `MXLNumberOfLines?` | type |
| `valign` | `MXLValign?` | type |
| `xmlSpace` | `MXLXmlSpace?` | type |

**`MXLBeam`** — 2 of 6 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `fan` | `MXLFan?` | type |

**`MXLGrace`** — 1 of 4 properties engraving

| property | declared type | why |
|---|---|---|
| `isSlashed` | `Bool?` | name |

**`MXLNote`** — 6 of 30 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `dot` | `[MXLEmptyPlacement]` | type |
| `font` | `MXLFont` | type |
| `printout` | `MXLPrintout` | type |
| `printsLeger` | `Bool` | name |
| `xPosition` | `MXLXPosition` | type |

**`MXLNote.Kind`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `size` | `MXLSymbolSize?` | type |

**`MXLNote.Notehead`** — 5 of 6 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `hasParentheses` | `Bool` | name |
| `isFilled` | `Bool?` | name |
| `smufl` | `MXLSmuflGlyphName?` | type |

**`MXLStem`** — 2 of 3 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `yPosition` | `MXLYPosition` | type |

### `PartList/`

**`MXLGroupBarline`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |

**`MXLGroupSymbol`** — 2 of 3 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `position` | `MXLPosition` | type |

**`MXLNameDisplay`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `printsObject` | `Bool?` | name |

**`MXLPartSymbol`** — 2 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `position` | `MXLPosition` | type |

### `Percussion/`

**`MXLBeater`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `tip` | `MXLTipDirection?` | type |

**`MXLEffect`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `smufl` | `MXLSmuflPictogramGlyphName?` | type |

**`MXLGlass`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `smufl` | `MXLSmuflPictogramGlyphName?` | type |

**`MXLMembrane`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `smufl` | `MXLSmuflPictogramGlyphName?` | type |

**`MXLMetal`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `smufl` | `MXLSmuflPictogramGlyphName?` | type |

**`MXLPercussion`** — 6 of 8 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `enclosure` | `MXLEnclosureShape?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `position` | `MXLPosition` | type |
| `valign` | `MXLValign?` | type |

**`MXLPitched`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `smufl` | `MXLSmuflPictogramGlyphName?` | type |

**`MXLStick`** — 3 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `hasDashedCircle` | `Bool` | name |
| `hasParentheses` | `Bool` | name |
| `tip` | `MXLTipDirection?` | type |

**`MXLTimpani`** — 1 of 1 properties engraving

| property | declared type | why |
|---|---|---|
| `smufl` | `MXLSmuflPictogramGlyphName?` | type |

**`MXLWood`** — 1 of 2 properties engraving

| property | declared type | why |
|---|---|---|
| `smufl` | `MXLSmuflPictogramGlyphName?` | type |

### `Score/`

**`MXLScorePartwise.Part.Measure`** — 1 of 7 properties engraving

| property | declared type | why |
|---|---|---|
| `width` | `MXLTenths?` | type |

**`MXLScoreTimewise.Measure`** — 1 of 7 properties engraving

| property | declared type | why |
|---|---|---|
| `width` | `MXLTenths?` | type |

### `Technical/`

**`MXLArrow`** — 5 of 6 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |
| `smufl` | `MXLSmuflGlyphName?` | type |

**`MXLBend`** — 4 of 8 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `position` | `MXLPosition` | type |
| `shape` | `Shape?` | name |

**`MXLFingering`** — 4 of 7 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |

**`MXLFret`** — 2 of 3 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |

**`MXLHammerOnPullOff`** — 4 of 7 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |

**`MXLHandbell`** — 4 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |

**`MXLHarmonMute`** — 4 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |

**`MXLHarmonic`** — 5 of 7 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |
| `printsObject` | `Bool?` | name |

**`MXLHeelToe`** — 4 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |

**`MXLHole`** — 5 of 7 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |
| `shape` | `String` | name |

**`MXLString`** — 4 of 5 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |

**`MXLStringMute`** — 5 of 7 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `halign` | `MXLLeftCenterRight?` | type |
| `position` | `MXLPosition` | type |
| `valign` | `MXLValign?` | type |

**`MXLTap`** — 4 of 6 properties engraving

| property | declared type | why |
|---|---|---|
| `color` | `MXLColor?` | type |
| `font` | `MXLFont` | type |
| `placement` | `MXLAboveBelow?` | type |
| `position` | `MXLPosition` | type |
---

## §5 Judgment calls

These resist classification by declared type or name alone. Each is a settled
call, not an open question: cite the identifier to justify a decision, and change
the call here — with its reasoning — before changing any code that depends on it.

### §5.1 Classified as engraving, but arguably not

| ID | Item | Reasoning |
|---|---|---|
| `J1` | `printsObject` on musical elements | It is a print toggle, but `print-object="no"` is how invisible rests and hidden clefs are expressed. Stripping it makes hidden elements visible — a *visible* change to output, not a neutral one. |
| `J2` | `MXLStaffDivide` | The element is purely a visual divider symbol, but it appears in `direction-type` alongside musical directions. |
| `J3` | `MXLMeasureNumbering.value` | Encodes *how often* measures are numbered (`measure`/`system`/`never`) — a layout policy, not a musical fact. |
| `J4` | `orientation` (slur, tied) | `over`/`under` is purely visual, but engravers treat it as part of the marking's identity. |
| `J5` | `isFilled`, `hasParentheses` (notehead) | Visual, yet a filled vs hollow notehead is conventionally read as duration information. |
| `J6` | `shape` (fermata) | `normal`/`angled`/`square` is visual, though some shapes carry performance conventions. |

### §5.2 Classified as musical, but arguably engraving

| ID | Item | Reasoning |
|---|---|---|
| `J7` | `text` on `MXLRoot.Step`, `MXLBass.Step`, `MXLDegree.Value`, `MXLDegree.Kind`, `MXLHarmony.Chord.Kind`, `MXLInversion`, `MXLNumeral.Root`, `MXLFirstFret` | A display-text override substituting for the computed value. Presentational in effect, but it is the only place the authored string survives — dropping it loses information not recoverable from the AST. |
| `J8` | `symbol` | Meaning varies by owner: `MXLTime.symbol` (`common`/`cut`) and `MXLPartSymbol`/`MXLGroupSymbol` are visual; `MXLDegree.Value.symbol` is harmonic. Not separable by name alone, so the whole name is classified musical; a per-type split would have to be spelled out here first. |
| `J9` | `line` | `MXLClef.Content.line` is musical (which staff line the clef sits on); `MXLLineDetail.line` is visual. Same name, opposite classification — `MXLLineDetail` is a Category A type, so §4's declared-type rule already catches the visual case. |
| `J10` | `xmlLang` | Internationalisation metadata rather than engraving proper. |
| `J11` | `showFrets` (`MXLStaffDetails`) | `letters` vs `numbers` is a tablature notation-style choice; sits between the two categories. |
| `J12` | `location` | `MXLCancel.location` and `MXLHarmonyAlter.location` are placement-like but constrained by notation rules. |

## §6 Structural cautions

Constraints on *how* the layer may be separated. These bind any consumer acting
on §3 and §4, and violating them loses sound rather than appearance.

### `C1` — presence-only elements

Several elements carry **no** musical properties at all: their entire payload is
engraving, and the musical fact is that the element *exists*. Examples:

- `MXLEmptyPlacement` — used for `dot`, and for most articulations
  (`staccato`, `accent`, `tenuto`, `spiccato`, …)
- `MXLEmptyPrintStyleAlignID` — `damp`, `damp-all`, `eyeglasses`
- `MXLEmptyLine`, `MXLEmptyTrillSound`, `MXLEmptyPrintObjectStyleAlign`

A naive strip that removes all-engraving types would **delete these elements
entirely**, silently discarding every staccato and augmentation dot in the score.
The layer separation must preserve element presence and remove only attributes.

### `C2` — already-resolved durational elements

`<dot>`, `<type>`, and `<time-modification>` read as durational, so they look
musical. Once a document has been resolved into an absolute `Duration` their
content has *already* been folded in, and only their engraving remains. They
are therefore droppable **after** resolution and not before.

### `C3` — mixed containers

`<notations>` mixes engraving with performance meaning — articulations, slurs,
ornaments, arpeggios, and fermatas all sound. Combined with `C1`, a blunt
attribute strip over the container would delete sounding marks. Prune such a
container per-type or retain it whole; retaining it whole never loses sound.

## §7 Maintenance

The classification is derived from the AST sources, so it must be re-derived when
they change. `MXLEngravingLayerTests` performs steps 1–3 on every test run and
fails if this document and the sources disagree.

1. Every `public let` stored property is extracted from all non-`Internal` files
   under `AST/`, giving the §2 property counts.
2. §3 is curated by hand; every name must resolve to an actual source file.
3. §4 is computed mechanically: any property on a non-§3 type whose **declared
   type** is in §3, or whose **name** matches a known engraving attribute.

Classifying by declared type is what makes this reliable — it catches every
`color`/`font`/`position` attribute-group member without depending on naming
conventions. The name-based pass covers the remainder (`dashLength`, `spread`,
`bezierX`, and similar).

When the test fails, fix this document and the code together; do not silence the
test by relaxing its expectations.

### §7.1 Engraving attribute names

The name-based half of step 3. A property whose declared type is not in §3 is
engraving if its name appears here. This list is normative — it is what makes §4
reproducible rather than curated:

`arrangement`, `bezierOffset`, `bezierOffset2`, `endsLine`, `endsParagraph`,
`hasBracket`, `hasDashedCircle`, `hasParentheses`, `isAbbreviated`, `isFilled`,
`isSlashed`, `position`, `printsFrame`, `printsLeger`, `printsObject`,
`printsSpacing`, `rotation`, `shape`, `size`, `usesDots`, `usesLines`,
`usesSigns`, `usesStems`, `usesSymbols`.

Names deliberately absent, per §5: `symbol` (`J8`), `line` (`J9`), `xmlLang`
(`J10`), `showFrets` (`J11`), `location` (`J12`), `text` (`J7`), and the `id`
and `number` exclusions from §1.

### §7.2 Scope

- Only `public let` stored properties are in scope. Computed properties and
  non-public members are deliberately excluded — they are not part of the
  round-trippable surface the layer separation acts on.
- `MXLStyleText` belongs to §4, not §3, despite being dominated by `printStyle`:
  its `value` carries authored text (time-signature separators, figured-bass
  prefix/number/suffix, degree text). It is called out because the declared-type
  rule alone would misplace it.
