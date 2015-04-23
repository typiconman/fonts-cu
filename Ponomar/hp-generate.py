import fontforge;

##
## THIS FILE IS A FONTFORGE SCRIPT THAT GENERATES THE PONOMAR  UNICODE FONT FAMILY
##
##

base_name = "PonomarUnicode"
full_name  = "Ponomar Unicode"


fontforge.setPrefs ("AutoHint", False)
fontforge.setPrefs ("ClearInstrsBigChanges",False )
fontforge.setPrefs ( "CopyTTFInstrs",True )

## open up the font
font = fontforge.open(base_name + ".sfd")

## Evidently, this can break Evince, so it may need to be commented out. Not sure about that, though
font.head_optimized_for_cleartype = True

ttnames = list( font.sfnt_names )
for ttname in ttnames:
	if ttname[1] == 'SubFamil':
		ttnames.append( ( ttname[0],'Fullname',"%s %s" % ( full_name,ttname[2] ) ) )
font.sfnt_names = tuple( ttnames )

font.generate( base_name + ".otf", flags=( "opentype", "PfEd-colors", "PfEd-lookups"), layer="Fore" )

woff_meta = base_name + "-WOFF-metadata.xml"
f = file( woff_meta, 'r')
lines = f.readlines()
f.close()
font.woffMetadata = "".join( lines )
font.generate( base_name + ".woff", flags=( "opentype"), layer="TTFLayer" )

# Append the TT suffix
for i in range( 0, len( ttnames )):
	ttname = ttnames[i]
	if ttname[1] == 'Fullname':
		ttnames[i] = ( ttname[0],'Fullname',ttname[2].replace( full_name,full_name + " TT" ) )
	if ttname[1] == 'Preferred Family':
		ttnames[i] = ( ttname[0],'Preferred Family',ttname[2].replace( full_name,full_name + " TT" ) )

font.sfnt_names = tuple( ttnames )
font.familyname = full_name + " TT"
font.fullname = full_name + " TT"
font.fontname = base_name + "TT"

font.generate( base_name + ".ttf", flags=( "opentype", "old-kern", "PfEd-colors", "PfEd-lookups", "dummy-dsig" ), layer="TTFLayer" )
font.close()


