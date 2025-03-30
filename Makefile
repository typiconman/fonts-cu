all: deb

FONTS = Cathisma Fedorovsk Indiction Menaion Monomakh Oglavie Pochaevsk Pomorsky Ponomar Triodion Vertograd
MOREFONTS = Shafarik Acathist Voskresensky Vilnius FiraSlav

unicode: build.tmp

build.tmp:
	$(foreach font, $(FONTS), rm -f $(font)/*.otf $(font)/*.ttf $(font)/*.woff && fontforge -script hp-generate.py $(font);)
	touch build.tmp

doc: fonts-churchslavonic.pdf

fonts-churchslavonic.pdf:
	(cd docs/ && xelatex --interaction=nonstopmode fonts-churchslavonic-sr.tex)
	(cd docs/ && xelatex --interaction=nonstopmode fonts-churchslavonic-sr.tex)
	(cd docs/ && xelatex --interaction=nonstopmode fonts-churchslavonic-sr.tex)
	(cd docs/ && xelatex --interaction=nonstopmode fonts-churchslavonic.tex)
	(cd docs/ && xelatex --interaction=nonstopmode fonts-churchslavonic.tex)
	(cd docs/ && xelatex --interaction=nonstopmode fonts-churchslavonic.tex)

ctan: fonts-churchslavonic.zip

deb: debuild.tmp

debuild.tmp:
	curl $(foreach font, $(FONTS), -O https://raw.githubusercontent.com/slavonic/$(font)/master/fonts/otf/$(font)-Regular.otf)
	curl $(foreach font, $(MOREFONTS), -O https://raw.githubusercontent.com/slavonic/$(font)/master/fonts/otf/$(font)-Regular.otf)
	curl -O https://raw.githubusercontent.com/slavonic/FiraSlav/master/fonts/otf/FiraSlav-Bold.otf
	touch debuild.tmp

site: fonts-churchslavonic.zip

fonts-churchslavonic.zip:
	rm -fr fonts-churchslavonic/
	mkdir fonts-churchslavonic
	cd fonts-churchslavonic/ && curl $(foreach font, $(FONTS), -O https://raw.githubusercontent.com/slavonic/$(font)/master/fonts/otf/$(font)-Regular.otf)
	cd fonts-churchslavonic/ && curl $(foreach font, $(MOREFONTS), -O https://raw.githubusercontent.com/slavonic/$(font)/master/fonts/otf/$(font)-Regular.otf)
	cd fonts-churchslavonic/ && curl -O https://raw.githubusercontent.com/slavonic/FiraSlav/master/fonts/otf/FiraSlav-Bold.otf
	cp OFL.txt fonts-churchslavonic/
	cp README.ctan fonts-churchslavonic/README
	zip -r -q fonts-churchslavonic.zip fonts-churchslavonic/
	rm -fr fonts-churchslavonic/
# TODO: Add Mezenets

web: sci-webfonts.zip

sci-webfonts.zip:
	rm -fr fonts/
	mkdir fonts
	cd fonts/ && curl $(foreach font, $(FONTS), -O https://raw.githubusercontent.com/slavonic/$(font)/master/fonts/ttf/$(font)-Regular.ttf)
	cd fonts/ && curl $(foreach font, $(MOREFONTS), -O https://raw.githubusercontent.com/slavonic/$(font)/master/fonts/ttf/$(font)-Regular.ttf)
	cd fonts/ && curl -O https://raw.githubusercontent.com/slavonic/FiraSlav/master/fonts/ttf/FiraSlav-Bold.ttf
	cd fonts/ && curl $(foreach font, $(FONTS), -O https://raw.githubusercontent.com/slavonic/$(font)/master/fonts/webfonts/$(font)-Regular.woff2)
	cd fonts/ && curl $(foreach font, $(MOREFONTS), -O https://raw.githubusercontent.com/slavonic/$(font)/master/fonts/webfonts/$(font)-Regular.woff2)
	cd fonts/ && curl -O https://raw.githubusercontent.com/slavonic/FiraSlav/master/fonts/webfonts/FiraSlav-Bold.woff2
	$(foreach font, $(FONTS), cd fonts/ && ttf2eot $(font)-Regular.ttf $(font)-Regular.eot; cd ..;)
	$(foreach font, $(MOREFONTS), cd fonts/ && ttf2eot $(font)-Regular.ttf $(font)-Regular.eot; cd ..;)
	zip -j $@ OFL.txt
	zip -DrX $@ css/ fonts/
	rm -fr fonts/

clean:
	$(foreach font, $(FONTS), cd $(font)/ && rm -f *.ttf *.woff *.eot *.woff2 *.zip; cd ..;)
	rm -f build.tmp debuild.tmp
	rm -f *.otf *.ttf
	(cd docs/ && rm -f *.aux *.hd *.glo *.idx *.log *.out *.pdf *.toc)
	(cd rpm/ && rm -f *.tar.bz2)
	rm -f *.zip *.png
	# To clean debian package run debuild clean
