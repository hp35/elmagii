#
# Makefile for compilation of Lecture Notes in Electromagnetic Theory,
# Uppsala University, 2026. Code for the lectures written in plain TeX.
# Lectures available at Github: https://github.com/elmagii/
#
# Copyright (C) 2026 under GPL 3.0, Fredrik Jonsson
#
TEX    = tex
DVIPS  = dvips
PS2PDF = ps2pdf

srcs = $(wildcard *.tex)
dvis = $(patsubst %.tex,%.dvi,$(srcs))
pss  = $(patsubst %.tex,%.ps ,$(srcs))
pdfs = $(patsubst %.tex,%.pdf,$(srcs))

all: $(pdfs)

$(pdfs): $(pss)
	@$(eval BASE = $(shell basename $@ .pdf))
	@echo "Converting PS file $< to PDF (target $@)."
	@$(PS2PDF) $(BASE).ps $(BASE).pdf
	@echo "PDF file for $(BASE).ps written to $(BASE).pdf."

$(pss): $(dvis)
	@$(eval BASE = $(shell basename $@ .ps))
	@echo "Converting DVI file $< to PostScript (target $@)."
	@$(DVIPS) -D1200 -ta4 $(BASE).dvi -o $(BASE).ps
	@echo "PostScript file for $< written to $@."

$(dvis): $(srcs)
	@$(eval BASE = $(shell basename $@ .dvi))
	@echo "Compiling source file $(BASE).tex to DVI (target $(BASE).dvi)."
	@$(TEX) '\input $(BASE).tex \bye'
	@$(TEX) '\input $(BASE).tex \bye'
	@echo "DVI file for $(BASE).tex written to $(BASE).dvi."

texchars:
	@echo "Converting Swedish Unicode chars in formulas.tex to TeX codes."
	@../lect-01/macros/se-texchars.sh formulas.tex > tmp.tex
	@mv tmp.tex formulas.tex
	@echo "Reload formulas.tex to incorporate the changes."

clean:
	@rm -Rf *~ *.aux *.toc *.idx *.log *.dvi *.ps *.pdf
