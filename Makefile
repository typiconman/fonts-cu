all: fonts doc ctan

FONTS = Cathisma Fedorovsk Indiction Menaion Monomakh Oglavie Pochaevsk Pomorsky Ponomar Triodion Vertograd
MOREFONTS = Shafarik Acathist

fonts:
	$(foreach font, $(FONTS), rm -f $(font)/*.otf $(font)/*.ttf $(font)/*.woff && fontforge -script hp-generate.py $(font);)
	$(foreach font, $(MOREFONTS), rm -f $(font)/*.otf $(font)/*.ttf $(font)/*.woff && cd $(font) && fontforge -script hp-generate.py && cd ..)

doc: fonts-churchslavonic.pdf

fonts-churchslavonic.pdf:
	(cd docs/ && xelatex --interaction=nonstopmode fonts-churchslavonic.tex)
	(cd docs/ && xelatex --interaction=nonstopmode fonts-churchslavonic.tex)
	(cd docs/ && xelatex --interaction=nonstopmode fonts-churchslavonic.tex)
	mv docs/fonts-churchslavonic.pdf ./

ctan: fonts-churchslavonic.zip

fonts-churchslavonic.zip:
	rm -f *.zip
	cp README.ctan /tmp/README
	wget https://www.ponomar.net/files/MezenetsUnicode.zip
	unzip MezenetsUnicode.zip -x README
	zip -j $@ $(foreach dir, $(FONTS), $(wildcard $(dir)/*.otf)) \
				$(foreach dir, $(MOREFONTS), $(wildcard $(dir)/*.otf)) \
				MezenetsUnicode.otf fonts-churchslavonic.pdf OFL.txt
	zip -j $@ /tmp/README
	zip -DrX $@ docs/fonts-churchslavonic.tex docs/*.png
	rm -f MezenetsUnicode.otf MezenetsUnicode.zip
	rm -f /tmp/README

install: $(FONTS)
	ls ~/.fonts/
	$(foreach font, $(FONTS), cp $(font)/*.otf ~/.fonts/;)
	$(foreach font, $(FONTS), cp $(font)/*.otf ./;)
	$(foreach font, $(MOREFONTS), cp $(font)/*.otf ~/.fonts/;)
	$(foreach font, $(MOREFONTS), cp $(font)/*.otf ./;)
	tar -cvjSf fonts-cu.tar.bz2 *.otf
	mv fonts-cu.tar.bz2 rpm/
	# To create debian package run debuild -us -uc

site:
	# Creating the separate zip archives for the website
	$(foreach font, $(FONTS), cd $(font)/ && rm -f *.zip && zip -j $(font)Unicode.zip $(font)Unicode.otf README; cd ..;)
	$(foreach font, $(MOREFONTS), cd $(font)/ && rm -f *.zip && zip -j $(font).zip *.odt *.otf README; cd ..;)

web: sci-webfonts.zip

sci-webfonts.zip:
	# Create web fonts
	rm -fr fonts/
	rm -f *.zip
	$(foreach font, $(FONTS), rm -f $(font)/*.otf $(font)/*.ttf $(font)/*.woff && fontforge -script web-generate.py $(font);)
	$(foreach font, $(FONTS), ttfautohint -n -D cyrl $(font)/$(font)Unicode.ttf $(font)/out.ttf && rm $(font)/$(font)Unicode.ttf && mv $(font)/out.ttf $(font)/$(font)Unicode.ttf;)
	$(foreach font, $(MOREFONTS), rm -f $(font)/*.otf $(font)/*.ttf $(font)/*.woff && cd $(font) && fontforge -script web-generate.py && cd ..;)
	$(foreach font, $(MOREFONTS), ttfautohint -n -D cyrl $(font)/$(font)-Regular.ttf $(font)/out.ttf && rm $(font)/$(font)-Regular.ttf && mv $(font)/out.ttf $(font)/$(font)-Regular.ttf;)
	$(foreach font, $(FONTS), ttf2eot < $(font)/$(font)Unicode.ttf > $(font)/$(font)Unicode.eot;)
	$(foreach font, $(MOREFONTS), ttf2eot < $(font)/$(font)-Regular.ttf > $(font)/$(font)-Regular.eot;)
	$(foreach font, $(FONTS), cd $(font) && sfnt2woff -m $(font)Unicode-WOFF-metadata.xml $(font)Unicode.otf; cd ..;)
	$(foreach font, $(MOREFONTS), cd $(font) && sfnt2woff -m $(font)-WOFF-metadata.xml $(font)-Regular.otf; cd ..;)
	$(foreach font, $(FONTS), cd $(font) && woff2_compress $(font)Unicode.otf; cd ..;)
	$(foreach font, $(MOREFONTS), cd $(font) && woff2_compress $(font)-Regular.otf; cd ..;)
	mkdir fonts/
	$(foreach font, $(FONTS), cp $(font)/*.ttf $(font)/*.woff $(font)/*.eot $(font)/*.woff2 fonts/;)
	$(foreach font, $(MOREFONTS), cp $(font)/*.ttf $(font)/*.woff $(font)/*.eot $(font)/*.woff2 fonts/;)
	zip -j $@ LICENSE GPL.txt OFL.txt
	zip -DrX $@ css/ fonts/
	rm -fr fonts/

clean:
	$(foreach font, $(FONTS), cd $(font)/ && rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip; cd ..;)
	$(foreach font, $(MOREFONTS), cd $(font)/ && rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip; cd ..;)
	rm -f fonts-churchslavonic.pdf
	rm -f *.otf *.ttf
	(cd docs/ && rm -f *.aux *.glo *.idx *.log *.out *.pdf *.toc)
	(cd rpm/ && rm -f *.tar.bz2)
	rm -f *.zip *.png
	# To clean debian package run debuild clean
