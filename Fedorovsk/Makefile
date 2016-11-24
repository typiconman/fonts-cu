all: FedorovskUnicode.ttf

FedorovskUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall FedorovskUnicode.gdl FedorovskUnicode.ttf FedorovskUnicodeSIL.ttf
	rm FedorovskUnicode.ttf
	mv FedorovskUnicodeSIL.ttf FedorovskUnicode.ttf

web: FedorovskUnicode.zip

FedorovskUnicode.zip:
	rm -f *.zip
	zip -j $@ FedorovskUnicode.otf FedorovskUnicode.ttf \
				FedorovskUnicode.woff \
				README CHANGES

clean:
	rm -f *.otf *.ttf *.woff *.zip gdlerr.txt

