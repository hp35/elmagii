FONTS_DESTINATION_DIRECTORY=/usr/share/texmf/fonts/source/public/oiint/

all:
	@echo "Run 'make install' to install oiint on a UN*X machine";
	@echo "(or Linux/Cygwin/Mac OS X/Solaris)";
	@echo "To uninstall the oiint font, simply run 'make uninstall'";

install:
	rm -Rf $(FONTS_DESTINATION_DIRECTORY)
	mkdir $(FONTS_DESTINATION_DIRECTORY)
	cp -Rf *.mf $(FONTS_DESTINATION_DIRECTORY)
	cp -Rf *.tex $(FONTS_DESTINATION_DIRECTORY)
	texhash
	echo "all:" > $(FONTS_DESTINATION_DIRECTORY)/Makefile
	echo "	tex example.tex" >> $(FONTS_DESTINATION_DIRECTORY)/Makefile
	echo "	dvips -D1200 -ta4 example.dvi -o example.ps" >> $(FONTS_DESTINATION_DIRECTORY)/Makefile
	make -ik -C $(FONTS_DESTINATION_DIRECTORY)

uninstall:
	rm -Rf $(FONTS_DESTINATION_DIRECTORY)
	texhash

clean:
	rm -Rf *~ *.log *.aux *.dvi *.ps *.*pk *.*gf *.tfm
