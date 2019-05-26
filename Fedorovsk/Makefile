all: FedorovskUnicode.otf

FedorovskUnicode.otf:
	rm -f *.otf *.woff
	fontforge -script hp-generate.py

site: FedorovskUnicode.zip

FedorovskUnicode.zip:
	rm -f *.zip
	zip -j $@ FedorovskUnicode.otf README CHANGES

web: FedorovskUnicode.woff2

FedorovskUnicode.woff2:
	rm -f *.ttf *.woff *.woff2 *.eot
	fontforge -script web-generate.py
	ttf2eot < FedorovskUnicode.ttf > FedorovskUnicode.eot
	sfnt2woff -m FedorovskUnicode-WOFF-metadata.xml FedorovskUnicode.otf
	woff2_compress FedorovskUnicode.otf

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip

