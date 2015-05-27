#!/bin/bash


PACK_NAME=PonomarUnicode
DOCS="README LICENSE OFL.txt PonomarUnicode.pdf CHANGES"
VERSION="1.0"

## delete binaries
rm PonomarUnicode.otf
rm PonomarUnicode.ttf
rm PonomarUnicode.woff

## get FontForge to generate all necessary files
fontforge -script hp-generate.py
wait

## generate Graphite version XXX
grcompiler -wall PonomarUnicode.gdl PonomarUnicode.ttf PonomarUnicodeSIL.ttf
wait

rm PonomarUnicode.ttf
mv PonomarUnicodeSIL.ttf PonomarUnicode.ttf

## install the fonts on the system
cp PonomarUnicode.otf ~/.fonts/
cp PonomarUnicode.ttf ~/.fonts/

## run the perl script first
rm PonomarUnicode.pdf
perl ../codechart.pl PonomarUnicode.otf
wait

## compile the demo file
xelatex PonomarUnicode.tex
wait

## create the ZIP archives
zip -DrX PonomarUnicode-$VERSION.zip PonomarUnicode.otf PonomarUnicode.ttf PonomarUnicode.woff $DOCS
zip -DrX PonomarUnicode-src.zip PonomarUnicode.sfd PonomarUnicode.gdl PonomarUnicode-WOFF-metadata.xml $DOCS

