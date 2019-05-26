import fontforge

##
## THIS FILE IS A FONTFORGE SCRIPT THAT GENERATES WEB FONTS FAMILY
##
##

base_name = "PonomarUnicode"
full_name  = "Ponomar Unicode"


fontforge.setPrefs ("AutoHint", False)
fontforge.setPrefs ("ClearInstrsBigChanges",False )
fontforge.setPrefs ( "CopyTTFInstrs",True )

## open up the font
font = fontforge.open(base_name + ".sfd")
font.head_optimized_for_cleartype = True

ttnames = list( font.sfnt_names )
for ttname in ttnames:
	if ttname[1] == 'SubFamil':
		ttnames.append( ( ttname[0],'Fullname',"%s %s" % ( full_name,ttname[2] ) ) )
font.sfnt_names = tuple( ttnames )

font.generate( base_name + ".otf", flags=( "opentype", "PfEd-colors", "PfEd-lookups"), layer="Fore" )

# generate TTF fonts
ttnames = list( font.sfnt_names )
for ttname in ttnames:
	if ttname[1] == 'SubFamil':
		ttnames.append( ( ttname[0],'Fullname',"%s %s" % ( full_name,ttname[2] ) ) )
font.sfnt_names = tuple( ttnames )

font.em = 1024
font.generate( base_name + ".ttf", flags=( "opentype", "PfEd-colors", "PfEd-lookups", "dummy-dsig" ), layer="Fore" )
font.close()
