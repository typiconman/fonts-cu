all: IndictionUnicode.ttf

IndictionUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall IndictionUnicode.gdl IndictionUnicode.ttf IndictionUnicodeSIL.ttf
	rm IndictionUnicode.ttf
	mv IndictionUnicodeSIL.ttf IndictionUnicode.ttf

web: IndictionUnicode.zip

IndictionUnicode.zip:
	rm -f *.zip
	zip -j $@ IndictionUnicode.otf IndictionUnicode.ttf \
				IndictionUnicode.woff \
				README

clean:
	rm -f *.otf *.ttf *.woff *.zip gdlerr.txt

