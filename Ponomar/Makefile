all: PonomarUnicode.ttf

PonomarUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall PonomarUnicode.gdl PonomarUnicode.ttf PonomarUnicodeSIL.ttf
	rm PonomarUnicode.ttf
	mv PonomarUnicodeSIL.ttf PonomarUnicode.ttf

web: PonomarUnicode.zip

PonomarUnicode.zip:
	rm -f *.zip
	zip -j $@ PonomarUnicode.otf PonomarUnicode.ttf \
				PonomarUnicode.woff \
				README CHANGES

clean:
	rm -f *.otf *.ttf *.woff *.zip gdlerr.txt

