all: MezenetsUnicode.zip

MezenetsUnicode.zip:
	rm -f *.otf *.ttf *.woff *.zip
	fontforge -script hp-generate.py
	zip -j $@ MezenetsUnicode.otf MezenetsUnicode.ttf README LICENSE OFL.txt

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt

