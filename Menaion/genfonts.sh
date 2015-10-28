#!/bin/bash


PACK_NAME=MenaionUnicode
DOCS="README LICENSE OFL.txt MenaionUnicode.pdf CHANGES"
VERSION="2.0"

## delete binaries
rm MenaionUnicode.otf
rm MenaionUnicode.ttf
rm MenaionUnicodeSIL.ttf
rm MenaionUnicode.woff

## get FontForge to generate all necessary files
fontforge -script hp-generate.py
wait

## generate Graphite version
grcompiler -wall MenaionUnicode.gdl MenaionUnicode.ttf MenaionUnicodeSIL.ttf
wait
rm MenaionUnicode.ttf
mv MenaionUnicodeSIL.ttf MenaionUnicode.ttf

## install the fonts on the system
cp MenaionUnicode.otf ~/.fonts/
cp MenaionUnicode.ttf ~/.fonts/

## run the perl script first
rm MenaionUnicode.pdf
perl ../codechart.pl MenaionUnicode.otf
wait

## compile the demo file
xelatex MenaionUnicode.tex
wait

## create the ZIP archives
zip -DrX MenaionUnicode-$VERSION.zip MenaionUnicode.otf MenaionUnicode.ttf MenaionUnicode.woff $DOCS
zip -DrX MenaionUnicode-src.zip MenaionUnicode.sfd MenaionUnicode.gdl MenaionUnicode-WOFF-metadata.xml $DOCS

