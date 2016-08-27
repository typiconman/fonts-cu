all: fonts doc ctan

FONTS = Ponomar Fedorovsk Menaion Pomorsky Indiction

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
				fonts-churchslavonic.pdf LICENSE OFL.txt GPL.txt
	zip -j $@ /tmp/README
	zip -DrX $@ docs/fonts-churchslavonic.tex docs/*.png
	rm -f /tmp/README

images: $(FONTS)
	rm -f *.png
	(cd Ponomar/ && fontimage --width 375 --height 40 --pixelsize 26 --text "   Хрⷭ҇то́съ воскре́се и҆з̾ ме́ртвыхъ " --o ../PonomarUnicode.png PonomarUnicode.otf)
	(cd Fedorovsk/ && fontimage --width 375 --height 40 --pixelsize 26 --text "   Хрⷭ҇то́съ вᲂскре́се и҆з̾ ме́ртвыхъ " --o ../FedorovskUnicode.png FedorovskUnicode.otf)
	(cd Menaion/ && fontimage --width 375 --height 40 --pixelsize 16 --text "   искони бѣ слово · ⰋⰔⰍⰑⰐⰉ ⰁⰡ ⰔⰎⰑⰂⰑ " --o ../MenaionUnicode.png MenaionUnicode.otf)
	(cd Pomorsky/ && fontimage --width 375 --height 40 --pixelsize 40 --text "   ЧИ́НЪ ВЕЧЕ́РНИ" --o ../PomorskyUnicode.png PomorskyUnicode.otf)
	(cd Indiction/ && fontimage --width 375 --height 40 --pixelsize 35 --text "   АБВГДЕЖЅЗИКЛ " --o ../IndictionUnicode.png IndictionUnicode.otf)

install: $(FONTS)
	ls ~/.fonts/
	$(foreach font, $(FONTS), cp $(font)/*.otf ~/.fonts/;)
	$(foreach font, $(FONTS), cp $(font)/*.ttf ~/.fonts/;)
	$(foreach font, $(FONTS), cp $(font)/*.otf ./ && cp $(font)/*.ttf ./;)
	tar -cvjSf fonts-cu.tar.bz2 *.otf *.ttf
	mv fonts-cu.tar.bz2 rpm/
	# To create debian package run debuild -us -uc

clean:
	$(foreach font, $(FONTS), cd $(font)/ && $(MAKE) clean; cd ..;)
	rm -f fonts-churchslavonic.pdf
	rm -f *.otf *.ttf
	(cd docs/ && rm -f *.aux *.glo *.idx *.log *.out *.pdf *.toc)
	(cd rpm/ && rm *.tar.bz2)
	rm -f *.zip *.png

