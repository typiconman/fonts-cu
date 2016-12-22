all: PomorskyUnicode.ttf

PomorskyUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall PomorskyUnicode.gdl PomorskyUnicode.ttf PomorskyUnicodeSIL.ttf
	rm PomorskyUnicode.ttf
	mv PomorskyUnicodeSIL.ttf PomorskyUnicode.ttf

site: PomorskyUnicode.zip

PomorskyUnicode.zip:
	rm -f *.zip
	zip -j $@ PomorskyUnicode.otf PomorskyUnicode.ttf README CHANGES

web: PomorskyUnicode.woff2

PomorskyUnicode.woff2:
	rm -f *.ttf *.woff *.woff2 *.eot
	fontforge -script web-generate.py
	grcompiler -wall PomorskyUnicode.gdl PomorskyUnicode.ttf PomorskyUnicodeSIL.ttf
	rm PomorskyUnicode.ttf
	mv PomorskyUnicodeSIL.ttf PomorskyUnicode.ttf
	ttf2eot < PomorskyUnicode.ttf > PomorskyUnicode.eot
	woff2_compress PomorskyUnicode.ttf

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt

