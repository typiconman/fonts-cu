all: PomorskyUnicode.ttf

PomorskyUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall PomorskyUnicode.gdl PomorskyUnicode.ttf PomorskyUnicodeSIL.ttf
	rm PomorskyUnicode.ttf
	mv PomorskyUnicodeSIL.ttf PomorskyUnicode.ttf

site: PomorskyUnicode.zip

PomorskyUnicode.zip:
	rm -f *.zip
	zip -j $@ PomorskyUnicode.otf PomorskyUnicode.ttf \
				PomorskyUnicode.woff \
				README CHANGES

clean:
	rm -f *.otf *.ttf *.woff *.zip gdlerr.txt

