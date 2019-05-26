all: MonomakhUnicode.otf

MonomakhUnicode.otf:
	rm -f *.otf *.woff
	fontforge -script hp-generate.py

site: MonomakhUnicode.zip

MonomakhUnicode.zip:
	rm -f *.zip
	zip -j $@ MonomakhUnicode.otf README.md FONTLOG.txt

web: MonomakhUnicode.woff2

MonomakhUnicode.woff2:
	rm -f *.ttf *.woff *.woff2 *.eot
	fontforge -script web-generate.py
	ttf2eot < MonomakhUnicode.ttf > MonomakhUnicode.eot
	sfnt2woff -m MonomakhUnicode-WOFF-metadata.xml MonomakhUnicode.otf
	woff2_compress MonomakhUnicode.otf

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip
