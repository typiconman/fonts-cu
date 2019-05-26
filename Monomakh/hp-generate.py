import fontforge

##
## THIS FILE IS A FONTFORGE SCRIPT THAT GENERATES THE MONOMAKH FONT FAMILY
##
##

base_name = "MonomakhUnicode"
full_name  = "Monomakh Unicode"

## open up the font
font = fontforge.open(base_name + ".sfd")

## Evidently, this can break Evince, so it may need to be commented out
font.head_optimized_for_cleartype = True

ttnames = list( font.sfnt_names )
for ttname in ttnames:
	if ttname[1] == 'SubFamil':
		ttnames.append( ( ttname[0],'Fullname',"%s %s" % ( full_name,ttname[2] ) ) )
font.sfnt_names = tuple( ttnames )

font.generate( base_name + ".otf", flags=( "opentype", "PfEd-colors", "PfEd-lookups"), layer="Fore" )

font.close()
