all: PomorskyUnicode.otf

PomorskyUnicode.otf:
	rm -f *.otf *.woff
	fontforge -script hp-generate.py

site: PomorskyUnicode.zip

PomorskyUnicode.zip:
	rm -f *.zip
	zip -j $@ PomorskyUnicode.otf README CHANGES

web: PomorskyUnicode.woff2

PomorskyUnicode.woff2:
	rm -f *.ttf *.woff *.woff2 *.eot
	fontforge -script web-generate.py
	ttf2eot < PomorskyUnicode.ttf > PomorskyUnicode.eot
	sfnt2woff -m PomorskyUnicode-WOFF-metadata.xml PomorskyUnicode.otf
	woff2_compress PomorskyUnicode.otf

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip
