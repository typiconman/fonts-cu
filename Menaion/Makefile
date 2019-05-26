all: MenaionUnicode.otf

MenaionUnicode.otf:
	rm -f *.otf *.woff
	fontforge -script hp-generate.py

site: MenaionUnicode.zip

MenaionUnicode.zip:
	rm -f *.zip
	zip -j $@ MenaionUnicode.otf README CHANGES

web: MenaionUnicode.woff2

MenaionUnicode.woff2:
	rm -f *.ttf *.woff *.woff2 *.eot
	fontforge -script web-generate.py
	ttf2eot < MenaionUnicode.ttf > MenaionUnicode.eot
	sfnt2woff -m MenaionUnicode-WOFF-metadata.xml MenaionUnicode.otf
	woff2_compress MenaionUnicode.otf

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip
