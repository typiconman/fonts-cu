# fonts-cu

This a meta package for Unicode-encoded OpenType fonts for Church Slavonic.
Individual fonts now reside in their own repositories and any bugs should be filed as issues against those repositories.

## The fonts available

Fonts for Synodal Church Slavonic:

* [Acathist](https://github.com/slavonic/Acathist)
* [Pochaevsk](https://github.com/slavonic/Pochaevsk)
* [Ponomar](https://github.com/slavonic/Ponomar)
* [Triodion](https://github.com/slavonic/Triodion)

Fonts for working with early Cyrillic printed books:

* [Fedorovsk](https://github.com/slavonic/Fedorovsk)
* [Vilnius](https://github.com/slavonic/Vilnius)

Fonts reproducing Ustav-era manuscripts:

* [Menaion](https://github.com/slavonic/Menaion)
* [Voskresensky](https://github.com/slavonic/Voskresensky)

Academic fonts:

* [Monomakh](https://github.com/slavonic/Monomakh)
* [Shafarik](https://github.com/slavonic/Shafarik)

Decorative fonts:

* [Indiction](https://github.com/slavonic/Indiction)
* [Vertograd](https://github.com/slavonic/Vertograd)
* [Cathisma](https://github.com/slavonic/Cathisma)
* [Oglavie](https://github.com/slavonic/Oglavie)
* [Pomorsky](https://github.com/slavonic/Pomorsky)

Fonts for technical work:

* [FiraSlav](https://github.com/slavonic/FiraSlav)

The source code of the fonts is found in the repositories above. The fonts can be installed from those repositories or directly from here.

## This package

This package provides:

* An archive of all of the fonts, available also from the project [website](https://sci.ponomar.net/fonts.html).
* The documentation
* The tools for building the Debian / Ubuntu package.
* The tools for building the LaTeX package, part of the churchslavonic package on TexLive.

## Fonts with the word Unicode in their name

A number of the fonts were previously distributed with the word *Unicode* in their name, e.g., *Ponomar Unicode*. With the nearly universal adoption of Unicode this feature seems no longer necessary, so the term Unicode has been removed from the names of the fonts. You may still need the fonts with the term *Unicode* in their name for processing of older documents and they are also supplied in this package. Note that these fonts are no longer maintained:

* [Pochaevsk Unicode]()
* [Ponomar Unicode]()
* [Triodion Unicode]()
* [Fedorovsk Unicode]()
* [Vilnius Unicode]()
* [Menaion Unicode]()
* [Monomakh Unicode]()
* [Indiction Unicode]()
* [Vertograd Unicode]()
* [Cathisma Unicode]()
* [Oglavie Unicode]()
* [Pomorsky Unicode]()

There is also a [legacy repository](https://github.com/slavonic/fonts-cu-legacy) that contains TTF fonts with SIL Graphite features.

## Installation

### Font Binaries

All fonts can be downloaded and installed from the
[Slavonic Computing Initiative website](https://sci.ponomar.net/fonts.html).

### Building this respository

Building requires:

* [ttf2eot](https://github.com/fontello/ttf2eot) -- to build web fonts
* XeTeX with [churchslavonic](https://www.ctan.org/pkg/churchslavonic) package -- to build PDF documentation

To build documentation:

```
make doc
```

To build ZIP archive of all fonts:

```
make all
```

To build web fonts:

```
make web
```

To build files for the website:

```
make site
```

## License

Copyright 2013-2025 Aleksandr Andreev, Nikita Simmons, and others
([Slavonic Computing Initiative](https://sci.ponomar.net/)).
The fonts are licensed under the SIL Open Font License, Version 1.1.
This license is available with a FAQ at: https://scripts.sil.org/OFL.
