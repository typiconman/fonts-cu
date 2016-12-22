all: MonomakhUnicode.ttf

MonomakhUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall MonomakhUnicode.gdl MonomakhUnicode.ttf MonomakhUnicodeSIL.ttf
	rm MonomakhUnicode.ttf
	mv MonomakhUnicodeSIL.ttf MonomakhUnicode.ttf

site: MonomakhUnicode.zip

MonomakhUnicode.zip:
	rm -f *.zip
	zip -j $@ MonomakhUnicode.otf MonomakhUnicode.ttf README.md FONTLOG.txt

web: MonomakhUnicode.woff2

MonomakhUnicode.woff2:
	rm -f *.ttf *.woff *.woff2 *.eot
	fontforge -script web-generate.py
	grcompiler -wall MonomakhUnicode.gdl MonomakhUnicode.ttf MonomakhUnicodeSIL.ttf
	rm MonomakhUnicode.ttf
	mv MonomakhUnicodeSIL.ttf MonomakhUnicode.ttf
	ttf2eot < MonomakhUnicode.ttf > MonomakhUnicode.eot
	woff2_compress MonomakhUnicode.ttf

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt

