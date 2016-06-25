all: IndictionUnicode.ttf

IndictionUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall IndictionUnicode.gdl IndictionUnicode.ttf IndictionUnicodeSIL.ttf
	rm IndictionUnicode.ttf
	mv IndictionUnicodeSIL.ttf IndictionUnicode.ttf

clean:
	rm -f *.otf *.ttf *.woff
