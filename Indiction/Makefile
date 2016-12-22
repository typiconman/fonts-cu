all: IndictionUnicode.ttf

IndictionUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall IndictionUnicode.gdl IndictionUnicode.ttf IndictionUnicodeSIL.ttf
	rm IndictionUnicode.ttf
	mv IndictionUnicodeSIL.ttf IndictionUnicode.ttf

site: IndictionUnicode.zip

IndictionUnicode.zip:
	rm -f *.zip
	zip -j $@ IndictionUnicode.otf IndictionUnicode.ttf README

web: IndictionUnicode.woff2

IndictionUnicode.woff2:
	rm -f *.ttf *.woff *.woff2 *.eot
	fontforge -script web-generate.py
	grcompiler -wall IndictionUnicode.gdl IndictionUnicode.ttf IndictionUnicodeSIL.ttf
	rm IndictionUnicode.ttf
	mv IndictionUnicodeSIL.ttf IndictionUnicode.ttf
	ttf2eot < IndictionUnicode.ttf > IndictionUnicode.eot
	woff2_compress IndictionUnicode.ttf

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt

