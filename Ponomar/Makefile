all: PonomarUnicode.ttf

PonomarUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall PonomarUnicode.gdl PonomarUnicode.ttf PonomarUnicodeSIL.ttf
	rm PonomarUnicode.ttf
	mv PonomarUnicodeSIL.ttf PonomarUnicode.ttf

site: PonomarUnicode.zip

PonomarUnicode.zip:
	rm -f *.zip
	zip -j $@ PonomarUnicode.otf PonomarUnicode.ttf README CHANGES

web: PonomarUnicode.woff2

PonomarUnicode.woff2:
	rm -f *.ttf *.woff *.woff2 *.eot
	fontforge -script web-generate.py
	grcompiler -wall PonomarUnicode.gdl PonomarUnicode.ttf PonomarUnicodeSIL.ttf
	rm PonomarUnicode.ttf
	mv PonomarUnicodeSIL.ttf PonomarUnicode.ttf
	ttf2eot < PonomarUnicode.ttf > PonomarUnicode.eot
	woff2_compress PonomarUnicode.ttf

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt

