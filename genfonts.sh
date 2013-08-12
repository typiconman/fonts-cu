#!/bin/bash

#####################################################################
#
# This file is part of Monomachus font family
# (http://www.thessalonica.org.ru/en/monomachus.html) and is
# Copyright (C) 2011 Alexey Kryukov <amkryukov@gmail.com>
# with Reserved Font Name "Monomachus".
#
# This Font Software is licensed under the SIL Open Font License,
# Version 1.1.
#
# You should have received a copy of the license along with this Font
# Software. If this is not the case, go to (http://scripts.sil.org/OFL)
# for all the details including a FAQ.
#
#####################################################################/

ZIP="zip -DrX"
PACK_NAME=monomachus
#DOCS="OFL.txt OFL-FAQ.txt FONTLOG.txt"
DOCS="OFL.txt OFL-FAQ.txt"
#DOCS_SRC="monomachus-specimen.tex theano160.png"
DOCS_SRC=
VERSION="1.0"

rm -f *.zip *.aux *.log
#xelatex theano-specimen.tex
#xelatex theano-specimen.tex
#xelatex theano-specimen.tex

fontforge -script $PACK_NAME-generate.py

for f in *.ttf; do
    BASENAME=${f%.ttf}
    wine cachett.exe $f ${BASENAME}_hdmx.ttf Monomachus.cfg
    mv ${BASENAME}_hdmx.ttf $BASENAME.ttf
    grcompiler -w3521 $BASENAME.gdl $BASENAME.ttf
    mv ${BASENAME}_gr.ttf $BASENAME.ttf
done

$ZIP $PACK_NAME-$VERSION.ttf.zip  *.ttf $DOCS
$ZIP $PACK_NAME-$VERSION.otf.zip  *.otf $DOCS
$ZIP $PACK_NAME-$VERSION.woff.zip  *.woff $DOCS
#$ZIP $PACK_NAME-$VERSION.src.zip genfonts.sh $PACK_NAME-generate.py *.gdl *.cfg *metadata.xml *.sfd $DOCS $DOCS_SRC
