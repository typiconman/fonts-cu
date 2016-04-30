all: FedorovskUnicode.ttf

FedorovskUnicode.ttf:
	rm -f *.otf
	rm -f *.ttf
	rm -f *.woff
	fontforge -script hp-generate.py
	grcompiler -wall FedorovskUnicode.gdl FedorovskUnicode.ttf FedorovskUnicodeSIL.ttf
	rm FedorovskUnicode.ttf
	mv FedorovskUnicodeSIL.ttf FedorovskUnicode.ttf

clean:
	rm -f *.otf *.ttf *.woff
