all: MenaionUnicode.ttf

MenaionUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall MenaionUnicode.gdl MenaionUnicode.ttf MenaionUnicodeSIL.ttf
	rm MenaionUnicode.ttf
	mv MenaionUnicodeSIL.ttf MenaionUnicode.ttf

clean:
	rm -f *.otf *.ttf *.woff
