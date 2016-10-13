all: MonomakhUnicode.ttf

MonomakhUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall MonomakhUnicode.gdl MonomakhUnicode.ttf MonomakhUnicodeSIL.ttf
	rm MonomakhUnicode.ttf
	mv MonomakhUnicodeSIL.ttf MonomakhUnicode.ttf

clean:
	rm -f *.otf *.ttf *.woff gdlerr.txt
