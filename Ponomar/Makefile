all: PonomarUnicode.otf

PonomarUnicode.otf:
	rm -f *.otf *.woff
	fontforge -script hp-generate.py

site: PonomarUnicode.zip

PonomarUnicode.zip:
	rm -f *.zip
	zip -j $@ PonomarUnicode.otf README CHANGES

web: PonomarUnicode.woff2

PonomarUnicode.woff2:
	rm -f *.ttf *.woff *.woff2 *.eot
	fontforge -script web-generate.py
	ttf2eot < PonomarUnicode.ttf > PonomarUnicode.eot
	sfnt2woff -m PonomarUnicode-WOFF-metadata.xml PonomarUnicode.otf
	woff2_compress PonomarUnicode.otf

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip
