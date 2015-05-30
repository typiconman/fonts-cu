#!/bin/bash


PACK_NAME=FedorovskUnicode
DOCS="README LICENSE OFL.txt FedorovskUnicode.pdf CHANGES"
VERSION="3.0"

## delete binaries
rm FedorovskUnicode.otf
rm FedorovskUnicode.ttf
rm FedorovskUnicode.woff

## get FontForge to generate all necessary files
fontforge -script hp-generate.py
wait

## generate Graphite version
grcompiler -wall FedorovskUnicode.gdl FedorovskUnicode.ttf FedorovskUnicodeSIL.ttf
wait

## install the fonts on the system
mv FedorovskUnicodeSIL.ttf FedorovskUnicode.ttf
cp FedorovskUnicode.otf ~/.fonts/
cp FedorovskUnicode.ttf ~/.fonts/

## run the perl script first
rm FedorovskUnicode.pdf
perl ../codechart.pl FedorovskUnicode.otf
wait

## compile the demo file
xelatex FedorovskUnicode.tex
wait

## create the ZIP archives
zip -DrX FedorovskUnicode-$VERSION.zip FedorovskUnicode.otf FedorovskUnicode.ttf FedorovskUnicode.woff $DOCS
zip -DrX FedorovskUnicode-src.zip FedorovskUnicode.sfd FedorovskUnicode.gdl FedorovskUnicode-WOFF-metadata.xml $DOCS

