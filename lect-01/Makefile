#
# Makefile for compilation of Lecture Notes in Electromagnetic Theory,
# Uppsala University, 2025. Code for the lectures written in plain TeX.
#
# Copyright (C) 2025 under GPL 3.0, Fredrik Jonsson
#
PROJECT = lecture-01

all: figures $(PROJECT).pdf

figures:
	make -C figs

$(PROJECT).pdf: $(PROJECT).ps
	ps2pdf $(PROJECT).ps $(PROJECT).pdf

$(PROJECT).ps: $(PROJECT).dvi
	dvips -D1200 -ta4 $(PROJECT).dvi -o $(PROJECT).ps

$(PROJECT).dvi: $(PROJECT).tex
	tex $(PROJECT).tex
	tex $(PROJECT).tex

texchars:
	./macros/se-texchars.sh $(PROJECT).tex > tmp.tex
	mv tmp.tex $(PROJECT).tex

archive:
	make -ik clean
	tar --directory=../ -cf ../$(PROJECT).tar $(PROJECT)

clean:
	make clean -C figs
	rm -Rf *~ *.aux *.toc *.log *.dvi *.ps *.tar.gz
