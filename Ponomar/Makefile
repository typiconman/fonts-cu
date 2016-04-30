all: PonomarUnicode.ttf

PonomarUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall PonomarUnicode.gdl PonomarUnicode.ttf PonomarUnicodeSIL.ttf
	rm PonomarUnicode.ttf
	mv PonomarUnicodeSIL.ttf PonomarUnicode.ttf

clean:
	rm -f *.otf *.ttf *.woff
