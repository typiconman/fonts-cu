all: FedorovskUnicode.ttf

FedorovskUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall FedorovskUnicode.gdl FedorovskUnicode.ttf FedorovskUnicodeSIL.ttf
	rm FedorovskUnicode.ttf
	mv FedorovskUnicodeSIL.ttf FedorovskUnicode.ttf

site: FedorovskUnicode.zip

FedorovskUnicode.zip:
	rm -f *.zip
	zip -j $@ FedorovskUnicode.otf FedorovskUnicode.ttf README CHANGES

web: FedorovskUnicode.woff2

FedorovskUnicode.woff2:
	rm -f *.ttf *.woff *.woff2 *.eot
	fontforge -script web-generate.py
	grcompiler -wall FedorovskUnicode.gdl FedorovskUnicode.ttf FedorovskUnicodeSIL.ttf
	rm FedorovskUnicode.ttf
	mv FedorovskUnicodeSIL.ttf FedorovskUnicode.ttf
	ttf2eot < FedorovskUnicode.ttf > FedorovskUnicode.eot
	woff2_compress FedorovskUnicode.ttf

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt

