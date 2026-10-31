#
# Makefile for compilation of TeX files.
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

TEXFILE := $(firstword $(wildcard *.tex))
PROJDIR := $(notdir $(CURDIR))
ARCHIVE := $(notdir $(CURDIR)).tar.gz

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
	@$(TEX) $(BASE).tex
	@$(TEX) $(BASE).tex
	@echo "DVI file for $(BASE).tex written to $(BASE).dvi."

clean:
	@rm -Rf *~ *.aux *.toc *.idx *.ind *.log *.ilg *.dvi *.ps
