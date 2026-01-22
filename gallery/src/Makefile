#
# Makefile for compilation of TeX code for the physicist gallery, part of
# Lecture Notes in Electromagnetic Theory, Uppsala University, 2025.
# Lectures available at Github: https://github.com/hp35/elmagii/
#
# Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
#
all:
	echo "Run 'make texchars' to regenerate any Swedish characters"
	echo "as standard TeX codes."

texchars:
	@echo "Converting Swedish Unicode chars in gallery-src.tex to TeX codes."
	@../../lect-01/macros/se-texchars.sh gallery-src.tex > tmp.tex
	@mv tmp.tex gallery-src.tex
	@echo "Reload gallery-src.tex to incorporate the changes."

clean:
	@rm -Rf *~
