import fontforge

name = "Voskresensky"
base_name = name + "-Regular"

fontforge.setPrefs ("AutoHint", False)
fontforge.setPrefs ("ClearInstrsBigChanges", False)
fontforge.setPrefs ( "CopyTTFInstrs", False)

font = fontforge.open(name + ".sfd")
font.head_optimized_for_cleartype = True

font.generate(base_name + ".otf", flags=( "opentype", "PfEd-colors", "PfEd-lookups", "dummy-dsig"), layer="Fore" )
font.close()
