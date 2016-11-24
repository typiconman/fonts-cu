all: MenaionUnicode.ttf

MenaionUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall MenaionUnicode.gdl MenaionUnicode.ttf MenaionUnicodeSIL.ttf
	rm MenaionUnicode.ttf
	mv MenaionUnicodeSIL.ttf MenaionUnicode.ttf

web: MenaionUnicode.zip

MenaionUnicode.zip:
	rm -f *.zip
	zip -j $@ MenaionUnicode.otf MenaionUnicode.ttf \
				MenaionUnicode.woff \
				README CHANGES

clean:
	rm -f *.otf *.ttf *.woff *.zip gdlerr.txt

