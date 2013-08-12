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

import fontforge

base_name = "Monomachus"
fontrev = 1.0

def process_font(name):
    filename = name
    font = fontforge.open(filename + ".sfd")

    woff_meta = name + "-WOFF-metadata.xml"
    f = file( woff_meta,'r' )
    lines = f.readlines()
    f.close()
    font.version = str( fontrev )
    font.sfntRevision = fontrev
    font.woffMetadata = "".join( lines )
    font.generate( filename + ".woff",layer="TTF" )

    font.encoding = "mac"
    font.generate(filename + ".ttf",flags=("opentype","old-kern","PfEd-colors","PfEd-lookups","dummy-dsig"),layer="TTF")

    font.em = 1000
    font.generate(filename + ".otf",flags=("opentype","PfEd-colors","PfEd-lookups"),layer="Fore")
    font.close()

process_font( base_name )
