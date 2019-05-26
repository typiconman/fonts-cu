import fontforge

##
## THIS FILE IS A FONTFORGE SCRIPT THAT GENERATES THE HIRMOS PONOMAR FONT FAMILY
##
##

base_name = "FedorovskUnicode"
full_name  = "Fedorovsk Unicode"


fontforge.setPrefs ("AutoHint", False)
fontforge.setPrefs ("ClearInstrsBigChanges",False )
fontforge.setPrefs ( "CopyTTFInstrs",False )

## open up the font
font = fontforge.open(base_name + ".sfd")

## Evidently, this can break Evince, so it may need to be commented out
font.head_optimized_for_cleartype = True

## not sure if we need this
#font.encoding = "mac"

ttnames = list( font.sfnt_names )
for ttname in ttnames:
	if ttname[1] == 'SubFamil':
		ttnames.append( ( ttname[0],'Fullname',"%s %s" % ( full_name,ttname[2] ) ) )
font.sfnt_names = tuple( ttnames )

font.generate( base_name + ".otf", flags=( "opentype", "PfEd-colors", "PfEd-lookups"), layer="Fore" )

font.close()
