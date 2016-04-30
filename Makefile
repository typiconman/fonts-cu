all: fonts doc ctan

FONTS = Ponomar Fedorovsk Menaion Pomorsky

fonts: $(FONTS)

Ponomar: Ponomar/PonomarUnicode.ttf

Ponomar/PonomarUnicode.ttf:
	(cd Ponomar/ && $(MAKE))

Fedorovsk: Fedorovsk/FedorovskUnicode.ttf

Fedorovsk/FedorovskUnicode.ttf:
	(cd Fedorovsk/ && $(MAKE))

Menaion: Menaion/MenaionUnicode.ttf

Menaion/MenaionUnicode.ttf:
	(cd Menaion/ && $(MAKE))

Pomorsky: Pomorsky/PomorskyUnicode.ttf

Pomorsky/PomorskyUnicode.ttf:
	(cd Pomorsky/ && $(MAKE))

doc: fonts-churchslavonic.pdf

fonts-churchslavonic.pdf:
	(cd docs/ && xelatex --interaction=nonstopmode fonts-churchslavonic.tex)
	(cd docs/ && xelatex --interaction=nonstopmode fonts-churchslavonic.tex)
	mv docs/fonts-churchslavonic.pdf ./

ctan: fonts-churchslavonic.zip

fonts-churchslavonic.zip:
	rm -f *.zip
	zip -j $@ Ponomar/PonomarUnicode.otf Ponomar/PonomarUnicode.ttf \
				Fedorovsk/FedorovskUnicode.otf Fedorovsk/FedorovskUnicode.ttf \
				Menaion/MenaionUnicode.otf Menaion/MenaionUnicode.ttf \
				Pomorsky/PomorskyUnicode.otf Pomorsky/PomorskyUnicode.ttf \
				fonts-churchslavonic.pdf LICENSE OFL.txt GPL.txt README.ctan
	zip -DrX $@ docs/fonts-churchslavonic.tex docs/*.png

# XXX: Future use
#images:
#fontimage --width 375 --height 40 --pixelsize 40 --text "   ЧИ́НЪ ВЕЧЕ́РНИ" --o PomorskyUnicode.png PomorskyUnicode.otf

clean:
	(cd Ponomar/ && $(MAKE) clean)
	(cd Fedorovsk/ && $(MAKE) clean)
	(cd Menaion/ && $(MAKE) clean)
	(cd Pomorsky/ && $(MAKE) clean)
	rm -f fonts-churchslavonic.pdf
	(cd docs/ && rm -f *.aux *.glo *.idx *.log *.out *.pdf *.toc)
	rm -f *.zip

