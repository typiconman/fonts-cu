import fontforge

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

font.close()
