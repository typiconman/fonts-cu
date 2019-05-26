all: IndictionUnicode.otf

IndictionUnicode.otf:
	rm -f *.otf *.woff
	fontforge -script hp-generate.py

site: IndictionUnicode.zip

IndictionUnicode.zip:
	rm -f *.zip
	zip -j $@ IndictionUnicode.otf README

web: IndictionUnicode.woff2

IndictionUnicode.woff2:
	rm -f *.ttf *.woff *.woff2 *.eot
	fontforge -script web-generate.py
	ttf2eot < IndictionUnicode.ttf > IndictionUnicode.eot
	sfnt2woff -m IndictionUnicode-WOFF-metadata.xml IndictionUnicode.otf
	woff2_compress IndictionUnicode.otf

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip
