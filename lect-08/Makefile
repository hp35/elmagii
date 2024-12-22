#
# Makefile for compilation of Lecture Notes in Electromagnetic Theory,
# Uppsala University, 2024. Code for the lectures written in plain TeX.
#
# Copyright (C) 2024 under GPL 3.0, Fredrik Jonsson
#
FIGURES = $(wildcard metapost/*.pdf)
PROJECT = lecture-08

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

archive:
	make -ik clean
	tar --directory=../ -cf ../$(PROJECT).tar $(PROJECT)

clean:
	make clean -C figs
	rm -Rf *~ *.aux *.toc *.log *.dvi *.ps *.tar.gz
