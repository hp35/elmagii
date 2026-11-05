#
# Makefile for compilation of Lecture Notes in Electromagnetic Theory,
# Uppsala University, 2025. Code for the lectures written in plain TeX.
# Lectures available at Github: https://github.com/hp35/elmagii/
#
# Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
#
TEXFILE = formulas.tex

all:
	@echo "Run 'make texchars' to convert Swedish Unicode chars to TeX codes."

texchars:
	@echo "Converting Swedish Unicode chars in $(TEXFILE) to TeX codes."
	@../macros/se-texchars.sh $(TEXFILE) > tmp.tex
	@mv tmp.tex $(TEXFILE)
	@echo "Reload $(TEXFILE) to incorporate the changes."

clean:
	@rm -Rf *~ *.aux *.toc *.idx *.ind *.log *.ilg *.dvi *.ps
