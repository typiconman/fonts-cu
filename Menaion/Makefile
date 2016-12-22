all: MenaionUnicode.ttf

MenaionUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall MenaionUnicode.gdl MenaionUnicode.ttf MenaionUnicodeSIL.ttf
	rm MenaionUnicode.ttf
	mv MenaionUnicodeSIL.ttf MenaionUnicode.ttf

site: MenaionUnicode.zip

MenaionUnicode.zip:
	rm -f *.zip
	zip -j $@ MenaionUnicode.otf MenaionUnicode.ttf README CHANGES

web: MenaionUnicode.woff2

MenaionUnicode.woff2:
	rm -f *.ttf *.woff *.woff2 *.eot
	fontforge -script web-generate.py
	grcompiler -wall MenaionUnicode.gdl MenaionUnicode.ttf MenaionUnicodeSIL.ttf
	rm MenaionUnicode.ttf
	mv MenaionUnicodeSIL.ttf MenaionUnicode.ttf
	ttf2eot < MenaionUnicode.ttf > MenaionUnicode.eot
	woff2_compress MenaionUnicode.ttf

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt

