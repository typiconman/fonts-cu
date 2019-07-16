all: fonts doc ctan

FONTS = Cathisma Fedorovsk Indiction Menaion Monomakh Oglavie Pochaevsk Pomorsky Ponomar Vertograd

fonts:
	$(foreach font, $(FONTS), rm -f $(font)/*.otf $(font)/*.ttf $(font)/*.woff && fontforge -script hp-generate.py $(font);)

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
	zip -j $@ $(foreach dir, $(FONTS), $(wildcard $(dir)/*.otf)) \
				fonts-churchslavonic.pdf LICENSE OFL.txt GPL.txt
	zip -j $@ /tmp/README
	zip -DrX $@ docs/fonts-churchslavonic.tex docs/*.png
	rm -f /tmp/README

install: $(FONTS)
	ls ~/.fonts/
	$(foreach font, $(FONTS), cp $(font)/*.otf ~/.fonts/;)
	$(foreach font, $(FONTS), cp $(font)/*.otf ./;)
	tar -cvjSf fonts-cu.tar.bz2 *.otf
	mv fonts-cu.tar.bz2 rpm/
	# To create debian package run debuild -us -uc

site:
	# Creating the separate zip archives for the website
	$(foreach font, $(FONTS), cd $(font)/ && rm -f *.zip && zip -j $(font)Unicode.zip $(font)Unicode.otf README; cd ..;)

web: sci-webfonts.zip

sci-webfonts.zip:
	# Create web fonts
	rm -fr fonts/
	rm -f *.zip
	$(foreach font, $(FONTS), rm -f $(font)/*.otf $(font)/*.ttf $(font)/*.woff && fontforge -script web-generate.py $(font);)
	$(foreach font, $(FONTS), ttf2eot < $(font)/$(font)Unicode.ttf > $(font)/$(font)Unicode.eot;)
	$(foreach font, $(FONTS), cd $(font) && sfnt2woff -m $(font)Unicode-WOFF-metadata.xml $(font)Unicode.otf; cd ..;)
	$(foreach font, $(FONTS), cd $(font) && woff2_compress $(font)Unicode.otf; cd ..;)
	mkdir fonts/
	$(foreach font, $(FONTS), cp $(font)/*.ttf $(font)/*.woff $(font)/*.eot $(font)/*.woff2 fonts/;)
	zip -j $@ LICENSE GPL.txt OFL.txt
	zip -DrX $@ css/ fonts/
	rm -fr fonts/

clean:
	$(foreach font, $(FONTS), cd $(font)/ && rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip; cd ..;)
	rm -f fonts-churchslavonic.pdf
	rm -f *.otf *.ttf
	(cd docs/ && rm -f *.aux *.glo *.idx *.log *.out *.pdf *.toc)
	(cd rpm/ && rm -f *.tar.bz2)
	rm -f *.zip *.png
	# To clean debian package run debuild clean
