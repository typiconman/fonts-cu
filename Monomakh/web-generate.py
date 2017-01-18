import fontforge;

##
## THIS FILE IS A FONTFORGE SCRIPT THAT GENERATES WEB FONTS FAMILY
##
##

base_name = "MonomakhUnicode"
full_name  = "Monomakh Unicode"


fontforge.setPrefs ("AutoHint", False)
fontforge.setPrefs ("ClearInstrsBigChanges",False )
fontforge.setPrefs ( "CopyTTFInstrs",True )

## open up the font
font = fontforge.open(base_name + ".sfd")
font.head_optimized_for_cleartype = True

# generate TTF fonts
ttnames = list( font.sfnt_names )
for ttname in ttnames:
	if ttname[1] == 'SubFamil':
		ttnames.append( ( ttname[0],'Fullname',"%s %s" % ( full_name,ttname[2] ) ) )
font.sfnt_names = tuple( ttnames )
font.em = 1024
font.generate( base_name + ".ttf", flags=( "opentype", "old-kern", "PfEd-colors", "PfEd-lookups", "dummy-dsig" ), layer="TTF" )

#generate WOFF fonts
woff_meta = base_name + "-WOFF-metadata.xml"
f = file( woff_meta, 'r')
lines = f.readlines()
f.close()
font.woffMetadata = "".join( lines )
font.generate( base_name + ".woff", flags=( "opentype"), layer="TTF" )
font.close()

