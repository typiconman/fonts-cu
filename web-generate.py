import sys
import fontforge

if (len(sys.argv) < 2):
    print("No font specified")
    sys.exit(1)

name = sys.argv[1]
base_name = name + "Unicode"

fontforge.setPrefs ("AutoHint", False)
fontforge.setPrefs ("ClearInstrsBigChanges", False)
fontforge.setPrefs ( "CopyTTFInstrs", False)

font = fontforge.open(name + "/" + base_name + ".sfd")
font.head_optimized_for_cleartype = True

font.generate(name + "/" + base_name + ".otf", flags=( "opentype", "PfEd-colors", "PfEd-lookups"), layer="Fore" )

font.em = 1024
font.generate(name + "/" + base_name + ".ttf", flags=( "opentype", "PfEd-colors", "PfEd-lookups", "dummy-dsig" ), layer="Fore" )
font.close()
