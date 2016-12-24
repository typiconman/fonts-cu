all: fonts doc ctan

FONTS = Ponomar Fedorovsk Menaion Pomorsky Indiction Monomakh

fonts:
	$(foreach font, $(FONTS), cd $(font)/ && $(MAKE); cd ..;)

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
	zip -j $@ Ponomar/PonomarUnicode.otf Ponomar/PonomarUnicode.ttf \
				Fedorovsk/FedorovskUnicode.otf Fedorovsk/FedorovskUnicode.ttf \
				Menaion/MenaionUnicode.otf Menaion/MenaionUnicode.ttf \
				Pomorsky/PomorskyUnicode.otf Pomorsky/PomorskyUnicode.ttf \
				Indiction/IndictionUnicode.otf Indiction/IndictionUnicode.ttf \
				Monomakh/MonomakhUnicode.otf Monomakh/MonomakhUnicode.ttf \
				fonts-churchslavonic.pdf LICENSE OFL.txt GPL.txt
	zip -j $@ /tmp/README
	zip -DrX $@ docs/fonts-churchslavonic.tex docs/*.png
	rm -f /tmp/README

install: $(FONTS)
	ls ~/.fonts/
	$(foreach font, $(FONTS), cp $(font)/*.otf ~/.fonts/;)
	$(foreach font, $(FONTS), cp $(font)/*.ttf ~/.fonts/;)
	$(foreach font, $(FONTS), cp $(font)/*.otf ./ && cp $(font)/*.ttf ./;)
	tar -cvjSf fonts-cu.tar.bz2 *.otf *.ttf
	mv fonts-cu.tar.bz2 rpm/
	# To create debian package run debuild -us -uc

site:
	# Creating the separate zip archives for the website
	$(foreach font, $(FONTS), cd $(font)/ && $(MAKE) site; cd ..;)

web: sci-webfonts.zip

sci-webfonts.zip:
	# Create web fonts
	rm -fr fonts/
	rm -f *.zip
	$(foreach font, $(FONTS), cd $(font)/ && $(MAKE) web; cd ..;)
	mkdir fonts/
	$(foreach font, $(FONTS), cp $(font)/*.ttf $(font)/*.woff $(font)/*.eot $(font)/*.woff2 fonts/;)
	zip -j $@ LICENSE GPL.txt OFL.txt
	zip -DrX $@ css/ fonts/
	rm -fr fonts/

clean:
	$(foreach font, $(FONTS), cd $(font)/ && $(MAKE) clean; cd ..;)
	rm -f fonts-churchslavonic.pdf
	rm -f *.otf *.ttf
	(cd docs/ && rm -f *.aux *.glo *.idx *.log *.out *.pdf *.toc)
	(cd rpm/ && rm -f *.tar.bz2)
	rm -f *.zip *.png
	# To clean debian package run debuild clean

