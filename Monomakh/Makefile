all: MonomakhUnicode.ttf

MonomakhUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall MonomakhUnicode.gdl MonomakhUnicode.ttf MonomakhUnicodeSIL.ttf
	rm MonomakhUnicode.ttf
	mv MonomakhUnicodeSIL.ttf MonomakhUnicode.ttf

web: MonomakhUnicode.zip

MonomakhUnicode.zip:
	rm -f *.zip
	zip -j $@ MonomakhUnicode.otf MonomakhUnicode.ttf \
				MonomakhUnicode.woff \
				README FONTLOG.txt

clean:
	rm -f *.otf *.ttf *.woff *.zip gdlerr.txt

