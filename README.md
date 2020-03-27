# fonts-cu

This package provides Unicode-encoded OpenType fonts for Church Slavonic.
Fonts contain the necessary glyphs for Cyrillic (including extensions)
and Glagolitic, as supported in Unicode 13.0,
as well as OpenType features that provide support of ligatures and diacritical marks.

SIL Graphite is no longer supported. For Graphite features, see the
[legacy repository](https://github.com/slavonic/fonts-cu-legacy).

## Available Typefaces

The following typefaces are available:

* Ponomar Unicode -- a font for typesetting Synodal Church Slavonic (that is, Church Slavonic used in modern liturgical texts of the Russian Orthodox Church). It may also be used to typeset liturgical texts in Romanian (Moldovan) Cyrillic, Aleut and Sakha (Yakut)

* Pochaevsk Unicode -- a font that reproduces the typeface used in editions published by the Holy Dormition Pochayev Lavra in the late 19th century and, subsequently, in editions published in the 20th century by Holy Trinity Monastery in Jordanville, New York.

* Triodion Unicode -- another font for typesetting Synodal Church Slavonic. It is intended to reproduce the typeface of liturgical books published in Russia at the beginning of the 20th century

* Fedorovsk Unicode -- a font that mimics the typeface used by Ivan Fedorov, who produced some of the first printed books in Moscow. It is intended primarily for reproducing publications from that era, either in an academic setting, or as modern Old Rite liturgical texts.

* Menaion Unicode -- a font that provides both Cyrillic and Glagolitic characters for representing text from Ustav-era Church Slavonic manuscripts.

* Monomakh Unicode -- a Cyrillic font implemented in a mixed ustav/poluustav style and intended to cover needs of researches dealing with Slavic history and philology.

* Shafarik -- a font intended for an academic presentation of Old Church Slavonic (OCS) texts written in both the Cyrillic and Glagolitic alphabets. The font supports both round (Bulgarian) Glagolitic and angular (Croatian) Glagolitic.

* Indiction Unicode -- a font for decorative drop caps (bukvitsi) in liturgical books of the Russian Orthodox Church published since the late 19th century.

* Vertograd Unicode -- another font used for decorative drop caps and titling, commonly found in liturgical books of the late 19th and early 20th centuries.

* Cathisma Unicode -- a font used for titling in many 18th-20th century liturgical editions published by the Holy Synod in Russia.

* Oglavie Unicode -- another font used for titling in many 18th-20th century liturgical editions.

* Pomorsky Unicode -- a decorative font intended for drop caps (bukvitsy) and titling that reproduces the calligraphic style of book and chapter titles used by Priestless Old Ritualists of the Vyg Hermitage.

## Installation

### Font Binaries

All fonts can be downloaded and installed from the
[Slavonic Computing Initiative website](https://sci.ponomar.net/fonts.html).

### Building from Source

Building the fonts requires:

* [FontForge](https://github.com/fontforge/fontforge)
* [ttf2eot](https://github.com/fontello/ttf2eot) -- to build web fonts
* [sfnt2woff](https://github.com/kseo/sfnt2woff) -- to build web fonts
* [woff2_compress](https://github.com/google/woff2) -- to build web fonts
* XeTeX with [churchslavonic](https://www.ctan.org/pkg/churchslavonic) package -- to build PDF documentation

To build fonts:

```
make fonts
```

To build documentation:

```
make doc
```

To build entire package:

```
make all
```

To build web fonts:

```
make web
```

## License

Copyright 2013-2020 Aleksandr Andreev and Nikita Simmons
([Slavonic Computing Initiative](https://sci.ponomar.net/)).
The fonts are licensed under the SIL Open Font License, Version 1.1.
This license is available with a FAQ at: https://scripts.sil.org/OFL.
