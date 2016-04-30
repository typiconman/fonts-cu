all: PomorskyUnicode.ttf

PomorskyUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall PomorskyUnicode.gdl PomorskyUnicode.ttf PomorskyUnicodeSIL.ttf
	rm PomorskyUnicode.ttf
	mv PomorskyUnicodeSIL.ttf PomorskyUnicode.ttf

clean:
	rm -f *.otf *.ttf *.woff
