#!/bin/bash


PACK_NAME=PomorskyUnicode
DOCS="README LICENSE OFL.txt PomorskyUnicode.pdf CHANGES"
VERSION="0.75"

## delete binaries
rm PomorskyUnicode.otf
rm PomorskyUnicode.ttf
rm PomorskyUnicode.woff

## get FontForge to generate all necessary files
fontforge -script hp-generate.py
wait

## generate Graphite version
grcompiler -wall PomorskyUnicode.gdl PomorskyUnicode.ttf PomorskyUnicodeSIL.ttf
wait

## install the fonts on the system
mv PomorskyUnicodeSIL.ttf PomorskyUnicode.ttf
cp PomorskyUnicode.otf ~/.fonts/
cp PomorskyUnicode.ttf ~/.fonts/

## run the perl script first
rm PomorskyUnicode.pdf
#perl ../codechart.pl PomorskyUnicode.otf
#wait

## compile the demo file
xelatex PomorskyUnicode.tex
wait

## create the ZIP archives
zip -DrX PomorskyUnicode-$VERSION.zip PomorskyUnicode.otf PomorskyUnicode.ttf PomorskyUnicode.woff $DOCS
zip -DrX PomorskyUnicode-src.zip PomorskyUnicode.sfd PomorskyUnicode.gdl PomorskyUnicode-WOFF-metadata.xml $DOCS

